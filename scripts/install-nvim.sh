#!/bin/bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sv ~/.dotfiles/init.vim nvim/init.vim
python3 -m pip install --user --upgrade pynvim
python2 -m pip install --user --upgrade pynvim

python3 -m pip install --user --upgrade jedi
python3 -m pip install --user --upgrade 'python-language-server[all]'

npm install -g neovim
nvim -c PlugUpdate

tic ../iterm2/xterm-256color-italic.terminfo
