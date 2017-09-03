#!/bin/bash

find ~/.dotfiles -maxdepth 1 -name 'HemisuDark.terminal' -exec \
cp {} $HOME/ \;

#set Terminal defaults
sudo -u $USER defaults write /Users/$USER/Library/Preferences/com.apple.Terminal.plist "Default Window Settings" "HemisuDark"
sudo -u $USER defaults write /Users/$USER/Library/Preferences/com.apple.Terminal.plist "Startup Window Settings" "HemisuDark"
