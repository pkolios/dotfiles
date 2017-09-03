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

update:
	brew update
	brew upgrade
	vim +PluginClean +qall
	vim +PluginInstall +qall

extras:
	sh scripts/install-extras.sh
