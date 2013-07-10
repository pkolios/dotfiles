install:                                                                        
	echo "Creating links from .dotfiles to home dir..."
	find ~/.dotfiles -maxdepth 1 -name '.*' \
	! -path ~/.dotfiles/ \
	! -path ~/.dotfiles/.git \
	! -path ~/.dotfiles/.gitignore \
	! -path ~/.dotfiles/.gitmodules \
	-name '.*' -exec ln -sf {} $$HOME \;                                        
	echo "Installing vundle..."
	git clone https://github.com/gmarik/vundle.git .vim/bundle/vundle
	echo "Installing vim plugins..."
	vim +BundleInstall +qall
                                                                                
clean:                                                                          
	echo "Removing links from home dir..."                                      
	find ~ -maxdepth 1 -lname "$$HOME/.dotfiles/*" -delete

update:
	vim +BundleInstall +qall
