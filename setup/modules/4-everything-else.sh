#!/usr/bin/env bash

PLUGINS="ag awscli:aws awslogs bat coreutils entr exiftool fd fpp git-delta git-remote-codecommit glances httpie hub jq pt pyenv pyenv-virtualenv python3 rbenv tfenv tree watch z"

for plugin in $PLUGINS; do
    IFS=':' read -ra ADDR <<< "$plugin"
    BREW_PLUGIN_NAME=${ADDR[0]}
    COMMAND=${ADDR[1]:-${ADDR[0]}}
    IFS=' ' # Reset to default

    if which $COMMAND; then
        echo $COMMAND installed
    else
        echo $COMMAND not found...installing
        brew install $BREW_PLUGIN_NAME
    fi
done

