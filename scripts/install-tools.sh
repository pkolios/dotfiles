#!/bin/bash

# Install GNU core utilities (those that come with macOS are outdated).
brew install coreutils

brew install git
brew install neovim
brew install ripgrep
brew install tree
brew install wget

# Python
brew instal python
brew install python3
pip2 install --upgrade pip setuptool
pip3 install --upgrade pip setuptool
pip3 install flake8
pip3 install flake8-bugbear
pip3 install black
pip3 install isort

# AWS
pip install awscli
pip install awsebcli

brew cleanup
