alias ls='ls -G'
alias ll='ls -alGh'

alias vi='mvim -v'
alias vim='vi'
alias grep='egrep --color=auto'

alias be='bundle exec'
alias ber='bundle exec rails'

alias zshrc='vim ~/.zshrc'
alias dotfiles='cd ~/vcs/git/dotfiles'

alias http_server='python -m SimpleHTTPServer 8888'
alias tm='tmux list-sessions && tmux attach || tmux'
alias tmls='tmux list-sessions'
alias gitx='/Applications/GitX.app/Contents/Resources/gitx'

alias dotfile_log='cat ~/tmp/logs/dotfiles.log'

function hgrep() {history | grep -e "$@";}
function tmks() {tmux kill-session -t $@;}
function tmns() {tmux new -s $@;}
function tmas() {tmux attach-session -t $@;}
function tmrs() {tmux rename-session -t $@;}

alias dev_up='pushd ~/development/environment; vagrant up; popd;'
alias dev_destroy='pushd ~/development/environment; vagrant destroy; popd;'
alias dev_status='echo $(cd ~/development/environment; vagrant status;)'
alias dev_halt='echo $(cd ~/development/environment; vagrant halt;)'
alias dev_ssh='$( cd ~/development/environment; vagrant ssh;)'

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

# Remove container or all containers
drm() { [[ -n $1 ]] && docker rm $@ || docker rm $(docker ps -a -q); }

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove images or all image
drmi() { [[ -n $1 ]] && docker rmi $@ || docker rmi $(docker images -q); }

# Dockerfile build, e.g., $dbu tcnksm/test
dbu() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort;}

# docker-machine
alias dm="docker-machine"

# docker-compose
alias dc="docker-compose"
