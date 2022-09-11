#!/usr/bin/env bash

[ -d $HOME/.dotfiles ] && echo "~/.dotfiles linked" || ( echo "linking dotfiles" && ln -s $HOME/code/personal/dotfiles $HOME/.dotfiles )
[ -f $HOME/.gitconfig ] && echo "gitconfig linked" || ( echo "linking gitconfig" && ln -s $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig )
[ -f $HOME/.gitignore_global ] && echo "global gitignore linked" || ( echo "linking global gitignore" && ln -s $HOME/.dotfiles/git/gitignore $HOME/.gitignore_global )
[ -d $HOME/.bin ] && echo "~/.bin linked" || ( echo "linking bin" && ln -s $HOME/.dotfiles/bin $HOME/.bin )
