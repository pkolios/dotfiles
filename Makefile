install:                                                                        
	echo "Creating links from .dotfiles to home dir..."
	find ~/.dotfiles -maxdepth 1 -name '.*' \
	! -path ~/.dotfiles/ \
	! -path ~/.dotfiles/.git \
	! -path ~/.dotfiles/.gitignore \
	-name '.*' -exec ln -sf {} $$HOME \;                                        
                                                                                
clean:                                                                          
	echo "Removing links from home dir..."                                      
	find ~ -maxdepth 1 -lname "$$HOME/.dotfiles/*" -delete
