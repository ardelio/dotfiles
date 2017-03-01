source ~/.zsh/antigen/antigen.zsh

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

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train

# Setup autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Tell antigen that you're done.
antigen apply


[ -f ~/.aliases.personal.sh ] && source ~/.aliases.personal.sh
[ -f ~/.aliases.myob.sh ] && source ~/.aliases.myob.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
export PATH="/usr/local/bin:$PATH"

export BULLETTRAIN_PROMPT_ORDER=(
  time
  status
  custom
  context
  dir
  perl
  # ruby
  virtualenv
  nvm
  go
  git
  hg
  cmd_exec_time
)

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

alias gpp='git status | fpp'
alias title='export DISABLE_AUTO_TITLE=true && title'

eval "$(rbenv init -)"
. /usr/local/etc/profile.d/z.sh

# added by travis gem
[ -f /Users/anthony.sceresini/.travis/travis.sh ] && source /Users/anthony.sceresini/.travis/travis.sh
