#!/usr/bin/env bash

[ -f $HOME/.gitconfig ] && echo "gitconfig linked" || ( echo "linking gitconfig" && ln -s $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig )