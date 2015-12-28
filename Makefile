.PHONY: install uninstall update

install:
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
	git clone https://github.com/gmarik/vundle.git .vim/bundle/vundle
	echo "Installing vim plugins..."
	vim -c "PluginInstall! "

uninstall:
	echo "Removing links from home dir..."
	find ~ -maxdepth 1 -lname "$$HOME/.dotfiles/*" -delete
	echo "Removing vim plugins..."
	rm -rf ~/.dotfiles/.vim/bundle
	echo "Removing zsh..."
	find ~/.oh-my-zsh/tools -maxdepth 1 -name 'uninstall.sh' -exec sh {} \;


update:
	vim -c "PluginInstall! "
