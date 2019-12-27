#!/bin/bash

# Install GNU core utilities (those that come with macOS are outdated).
brew install coreutils

# Git
brew install git

# Python
brew instal python
brew install python3
pip2 install --upgrade pip setuptool
pip3 install --upgrade pip setuptool
pip3 install flake8
pip3 install flake8-bugbear
pip3 install black
pip3 install isort

# Docker
# brew install docker
# pip install docker-compose
# brew install docker-machine-nfs

# AWS
# pip install awscli
# pip install awsebcli

# The rest
brew install ripgrep
brew install tree
# brew install vim --with-python3
brew install wget

# Remove outdated versions from the cellar.
brew cleanup
