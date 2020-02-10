#!/usr/bin/env bash

if hash nvim 2>/dev/null; then
    echo NVIM installed
else
    echo NVIM not found...installing
    brew install neovim
    python3 -m pip install neovim
    ls -d ~/.config/nvim || ln -s ~/.dotfiles/nvim ~/.config/.
    nvim +PlugInstall +qa
fi