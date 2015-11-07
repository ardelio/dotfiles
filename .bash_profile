### common exports
export EDITOR=vim
#export PATH="$HOME/.gems/bin:$PATH"

### common aliases
alias ls='ls -G'
alias ll='ls -alG'
alias vi='mvim -v'
alias vim='vi'
alias grep='egrep --color=auto'


### Get!Up shortcuts
alias ozvote='cd /Users/asceresi/projects/getup/ozvote'
alias ozvote_android='ozvote; cd platforms/android'
alias ozvote_ios='ozvote; cd platforms/ios'
alias tijuana='cd /Users/asceresi/projects/getup/Tijuana'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[[ -s /Users/asceresi/.nvm/nvm.sh ]] && . /Users/asceresi/.nvm/nvm.sh # This loads NVM
