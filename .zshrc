# ~/.zshrc

# --- Node (n) + yarn ---
export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH
export PATH="$HOME/.yarn/bin:$PATH"   # was: $(cd ~ && yarn global bin) — hardcoded to skip the per-startup subshell

export LOCAL_DEVELOPER_MACHINE=1

DISABLE_AUTO_TITLE="true"

source ~/.antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle npm
antigen bundle wd
antigen bundle sudo
antigen bundle docker
antigen bundle command-not-found
antigen bundle brew

# Other Bundles
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen apply

[ -f ~/.dotfiles/.aliases.sh ] && source ~/.dotfiles/.aliases.sh
[ -f ~/.propeller.aliases.sh ] && source ~/.propeller.aliases.sh
[ -f ~/.secrets/general.sh ] && source ~/.secrets/general.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. /opt/homebrew/etc/profile.d/z.sh

export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# --- PATH ---
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="/opt/homebrew/opt/python@3.11/libexec/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"   # pipx
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"

export AWS_PAGER=""

[ -f ~/.cargo/env ] && . ~/.cargo/env

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
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

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# keep at the end of the file
# Load starship prompt
eval "$(starship init zsh)"
