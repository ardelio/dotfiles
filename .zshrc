ZSH=$HOME/vcs/git/oh-my-zsh
ZSH_THEME="pure"
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_TITLE=true
EDITOR='vim'
USER=`whoami`

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git history-substring-search z)

source $ZSH/oh-my-zsh.sh
for alias in $(find ~ -name ".aliases.*.sh" -maxdepth 1); do source $alias; done
for alias in $(find ~ -name ".env-vars.*.sh" -maxdepth 1); do source $alias; done

#### vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

setopt AUTO_CD

if [[ `which figlet | wc -l` -ne 0 ]]; then
  NICE_THINGS=( "You're awesome" "May the Force be with you!" "Take a break!")
  random_number=$(( ( RANDOM % 3 ) + 1 ))
  echo ${NICE_THINGS[$random_number]} | figlet
fi

if [[ -e ~/tmp/logs/dotfiles.log ]]; then
  lines=3
  echo "Dotfiles Updater - Showing ${lines} line(s)"
  tail -${lines} ~/tmp/logs/dotfiles.log
fi

export GOPATH="/users/${USER}/go"
export GOBIN="${GOPATH}/bin"
export PATH="$GOBIN:$PATH"

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

export PATH="~/.bundler_binstubs:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

PERSONAL_HOME_DIR=/Users/asceresi
TABCORP_HOME_DIR=/Users/ardelio
if [ -d "$PERSONAL_HOME_DIR" ]; then
  [ -f /Users/asceresi/.travis/travis.sh ] && source /Users/asceresi/.travis/travis.sh
fi

if [ -d "$TABCORP_HOME_DIR" ]; then
  # nothing to put in here yet
fi

