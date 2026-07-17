alias dotfiles='cd ~/.dotfiles'
alias grep='egrep --color=auto'
alias http_server='python3 -m http.server 8000'
alias ll='ls -alGh'
alias ls='ls -G'
alias tm='tmux list-sessions && tmux attach || tmux'
alias tmls='tmux list-sessions'
alias vi='nvim'
alias vim='vi'
alias cat='bat'
alias top='glances'
alias randomAlphaNum='date | md5sum | head -c 12'
alias githash="git l | head -1 | awk '{print \$2}'"
alias gitwipebranches="git b | grep -v \"^\* \$(git symbolic-ref refs/remotes/origin/HEAD | sed 's/.*\///')\" | xargs git b -D"
alias ssh_pi="ssh anthonysceresini@pi5.local"

function del()  {mv $@ ${HOME}/.Trash;}
function tmks() {tmux kill-session -t $@;}
function tmns() {tmux new -s $@;}
function tmas() {tmux attach-session -t $@;}
function tmrs() {tmux rename-session -t $@;}

function dpurge() {docker rm -f $(docker ps -a -q); docker system prune --all --volumes -f}

# courtesy Taichi Nakashima - github.com/tcnksm/docker-alias

# ------------------------------------
# Docker alias and function
# ------------------------------------

# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Stop all containers
dstop() { [[ -n $1 ]] && docker stop $@ || docker stop $(docker ps -a -q);}

# # Remove container or all containers
drmc() { [[ -n $1 ]] && docker rm $@ || docker rm $(docker ps -a -q);}

# # Stop and Remove all containers
# alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# # Remove images or all image
# drmi() { [[ -n $1 ]] && docker rmi $@ || docker rmi $(docker images -q); }

# # Dockerfile build, e.g., $dbu tcnksm/test
# dbu() { docker build -t=$1 .; }

# # Show all alias related docker
# dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort;}

# # docker-compose
# alias dc="docker-compose"

# Alias to use when monitor preferences need to be reset. For instance, sometimes the Acer Predator
# stops connecting as an external monitor
function reset_monitor() {
  sudo rm /Library/Preferences/com.apple.windowserver.displays.plist;
  rm ~/Library/Preferences/ByHost/com.apple.windowserver.*.plist
  echo Now, make sure you restart the machine!
}

function worktree() {
  local branch="$1"
  local lowercase_branch=$(echo "$branch" | tr '[:upper:]' '[:lower:]')
  
  if [ -z "$branch" ]; then
    echo "Error: Branch is required" >&2
    exit 1
  fi

  local worktree_base_dir=$HOME/code/.worktrees
  local project_name=$(basename $PWD)
  local worktree_dir=$worktree_base_dir/$project_name-$lowercase_branch

  mkdir -p $worktree_dir
  
  echo "Setting up worktree for branch ($branch) in $worktree_dir"

  git branch | grep $branch \
    && git worktree add $worktree_dir $branch \
    || git worktree add -b $branch $worktree_dir
  code $worktree_dir
}

function worktree_rm() {
  local branch="$1"
  local lowercase_branch=$(echo "$branch" | tr '[:upper:]' '[:lower:]')
  
  if [ -z "$branch" ]; then
    echo "Error: Branch is required" >&2
    exit 1
  fi

  local worktree_base_dir=$HOME/code/.worktrees
  local project_name=$(basename $PWD)
  local worktree_dir=$worktree_base_dir/$project_name-$lowercase_branch

  git worktree remove $worktree_dir
  git branch -D $branch
}
