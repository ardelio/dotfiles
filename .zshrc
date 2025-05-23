# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH
export PATH="$(cd ~ && yarn global bin):$PATH"

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

# antigen theme bhilburn/powerlevel9k powerlevel9k
antigen theme romkatv/powerlevel10k

antigen apply

export POWERLEVEL9K_MODE='awesome-fontconfig'
export POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="🧟"
export POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="🧟 "
export POWERLEVEL9K_PROMPT_ON_NEWLINE=true
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)
export POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='black'
export POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='092'
export POWERLEVEL9K_DIR_HOME_BACKGROUND='black'
export POWERLEVEL9K_DIR_HOME_FOREGROUND='092'
export POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='black'
export POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='092'
export POWERLEVEL9K_TIME_BACKGROUND='black'
export POWERLEVEL9K_TIME_FOREGROUND='magenta'
export POWERLEVEL9K_STATUS_OK_BACKGROUND='black'
export POWERLEVEL9K_STATUS_OK_FOREGROUND='magenta'
export POWERLEVEL9K_STATUS_ERROR_BACKGROUND='magenta'
export POWERLEVEL9K_STATUS_ERROR_FOREGROUND='black'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -f ~/.dotfiles/.aliases.sh ] && source ~/.dotfiles/.aliases.sh
[ -f ~/.propeller.aliases.sh ] && source ~/.propeller.aliases.sh
[ -f ~/.secrets/general.sh ] && source ~/.secrets/general.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. /opt/homebrew/etc/profile.d/z.sh

export TERM="xterm-256color"

export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
export PATH="$HOME/Library/Python/3.8/bin:$HOME/Library/Python/2.7/bin:$PATH"
export PATH=/Users/asceresini/code/vms/vms2aws/bin:$PATH

export AWS_PAGER=""
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

source ~/.pyvenv/bin/activate

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

[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

hash rbenv && eval "$(rbenv init -)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true


if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="${PATH}:${HOME}/.krew/bin"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
[ -f ~/.cargo/env ] && . ~/.cargo/env

# Created by `pipx` on 2024-06-16 05:01:31
export PATH="$PATH:/Users/anthonysceresini/.local/bin"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

