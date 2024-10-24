alias dotfiles='cd ~/.dotfiles'
alias grep='egrep --color=auto'
alias http_server='python -m SimpleHTTPServer 8888'
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
alias gitclean="git b | grep -v \"^\* $(git symbolic-ref refs/remotes/origin/HEAD | sed 's/.*\///')\" | xargs git b -D"

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
# drm() { [[ -n $1 ]] && docker rm $@ || docker rm $(docker ps -a -q);}

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
