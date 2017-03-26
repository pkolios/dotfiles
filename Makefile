.PHONY: install uninstall update

install:
	echo "Installing brew..."
	export HOMEBREW_NO_ANALYTICS=1
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	echo "Installing brew packages..."
	-brew install git python python3 zsh ripgrep tree vim
	echo "Installing oh-my-zsh..."
	curl -L http://install.ohmyz.sh | sh
	find ~/.dotfiles -maxdepth 1 -name 'enc.zsh-theme' -exec \
	cp {} $$HOME/.oh-my-zsh/themes/ \;
	find ~ -maxdepth 1 -name '.zshrc' -delete
	echo "Creating links from .dotfiles to home dir..."
	find ~/.dotfiles -maxdepth 1 -name '.*' \
	! -path ~/.dotfiles/ \
	! -path ~/.dotfiles/.git \
	! -path ~/.dotfiles/.gitignore \
	! -path ~/.dotfiles/.gitmodules \
	-name '.*' -exec ln -sf {} $$HOME \;
	find ~/.dotfiles -maxdepth 1 -name 'HemisuDark.terminal' -exec \
	cp {} $$HOME/ \;
	echo "Installing vundle..."
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	echo "Installing vim plugins..."
	vim +PluginInstall +qall

uninstall:
	echo "Removing links from home dir..."
	find ~ -maxdepth 1 -lname "$$HOME/.dotfiles/*" -delete
	echo "Removing vim plugins..."
	-rm -rf ~/.dotfiles/.vim/bundle
	echo "Removing zsh..."
	-sh uninstall_oh_my_zsh
	echo "Removing brew..."
	brew list -1 | xargs brew rm
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"

update:
	brew update
	brew upgrade
	vim +PluginInstall +qall
