#!/usr/bin/env bash

PLUGINS="awscli:aws bat diff-so-fancy fd fpp hub jq pt python2 python3 watch z"

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

