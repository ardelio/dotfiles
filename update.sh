#/bin/bash

function log {
  msg_type=$1
  msg=$2
  date=`date +"%Y-%m-%d %H:%M:%S"`

  echo "[${date}] ${msg_type}: ${msg}"
}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
INTERNET_STATUS=$(curl -sI www.google.com.au | grep 'HTTP/1.1 200 OK' | grep -o 200)

if [[ $INTERNET_STATUS -ne 200 ]]; then
  log "ABORTING" "No Internet"
  exit 1
fi

cd $DIR

git fetch

GIT_STATUS=$(git status --porcelain | egrep "^\s?[AMD]" | wc -l)

if [[ $GIT_STATUS -ne 0 ]]; then
  log "ABORTING" "Local changes found"
  exit 1
fi

AHEAD_OF_ORIGIN=$(git rev-list origin..HEAD | wc -l)

if [[ $AHEAD_OF_ORIGIN -ne 0 ]]; then
  log "ABORTING" "Ahead of origin"
  exit 1
fi

BEHIND_ORIGIN=$(git rev-list HEAD..origin | wc -l)

if [[ $BEHIND_ORIGIN -eq 0 ]]; then
  log "ABORTING" "Nothing to pull"
  exit 0
fi

log "RUNNING" "git pull --rebase"
git pull --rebase

if [[ $? -ne 0 ]]; then
  log "WARNING" "Update failed"
  exit 1
fi

exit 0
