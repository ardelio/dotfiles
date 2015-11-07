# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}] ➜ [%{$reset_color%}git:%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[red]%}●"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}●"

# Prompt format: \n [USER@MACHINE]➜ [DIRECTORY]➜ [git:BRANCH STATE] [TIME] \n $
PROMPT="
%{$terminfo[bold]$fg[white]%}[%{$reset_color%}\
%{$fg[cyan]%}%n\
%{$fg[white]%}@\
%{$fg[green]%}$(box_name)\
%{$fg[white]%}] ➜ [ \
%{$terminfo[bold]$fg[red]%}${current_dir}%{$reset_color%}\
${git_info}\
%{$fg[white]%}] <%*>
%{$terminfo[bold]%}$ %{$reset_color%}"
