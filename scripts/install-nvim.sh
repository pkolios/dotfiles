#!/bin/bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim
ln -sv ~/.dotfiles/init.vim ~/.config/nvim/init.vim
python3 -m pip install --user --upgrade pynvim
python3 -m pip install --user --upgrade jedi
python3 -m pip install --user --upgrade 'python-language-server[all]'

npm install -g neovim
nvim -c PlugUpdate

tic ../iterm2/xterm-256color-italic.terminfo
