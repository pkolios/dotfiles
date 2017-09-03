#!/bin/bash

# Copy custom zsh theme
find ~/.dotfiles -maxdepth 1 -name 'enc.zsh-theme' -exec \
cp {} $HOME/.oh-my-zsh/themes/ \;

# Remove default zshrc
find ~ -maxdepth 1 -name '.zshrc' -delete

# Link zsh config etc
ln -sv ~/.dotfiles/.zshrc ~/.zshrc
ln -sv ~/.dotfiles/.zsh ~/.zsh

# Install autosuggestions
git clone --depth 1 git://github.com/zsh-users/zsh-autosuggestions ~/.dotfiles/.zsh/zsh-autosuggestions
