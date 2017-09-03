#!/bin/bash

# Link configuration and vim folder
ln -sv ~/.dotfiles/.vimrc ~/.vimrc
ln -sv ~/.dotfiles/.vim ~/.vim

# Install Vundle plugin manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install plugins
vim +PluginInstall +qall

