export PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:$PATH"
export PATH="$HOME/.bin:/usr/local/bin:$PATH"


eval "$(rbenv init -)"
. /usr/local/etc/profile.d/z.sh

# added by travis gem
[ -f /Users/anthony.sceresini/.travis/travis.sh ] && source /Users/anthony.sceresini/.travis/travis.sh

alias title='export DISABLE_AUTO_TITLE=true && title'
alias gpp='git status | fpp'
