PATH  := /usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
SHELL := /bin/bash

.PHONY: install install-scripts setup-scripts update extras

install: install-scripts setup-scripts

install-scripts:
	sh scripts/install-xcode.sh
	sh scripts/install-brew.sh
	sh scripts/install-tools.sh
	sh scripts/install-fonts.sh
	sh scripts/install-zsh.sh
	sh scripts/install-native.sh

setup-scripts:
	sh scripts/setup-git.sh
	sh scripts/setup-zsh.sh
	sh scripts/setup-terminal.sh
	sh scripts/setup-vim.sh
	sh scripts/setup-docker.sh

update-vim:
	\vim -c VundleUpdate -c quitall

update-nvim:
	\nvim -c PlugUpgrade
	\nvim -c PlugUpdate

update-brew:
	brew -v update
	brew upgrade --force-bottle
	brew cleanup
	brew doctor

update-brew-cask:
	brew cask upgrade

update-tools:
	pip install --upgrade pip
	pip install -U `pip freeze | cut -d '=' -f 1`

update: update-brew update-tools update-vim update-brew-cask

extras:
	sh scripts/install-extras.sh
