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

# Docker
brew install docker
brew install docker-machine
brew install docker-compose
brew install docker-machine-nfs

# The rest
brew install ripgrep
brew install tree
brew install vim --with-python3
brew install wget

# Remove outdated versions from the cellar.
brew cleanup
