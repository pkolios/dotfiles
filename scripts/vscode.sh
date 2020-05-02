brew cask install visual-studio-code

# For vscode vim plugin
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false         # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false # For VS Code Insider
defaults delete -g ApplePressAndHoldEnabled                                      # If necessary, reset global default

# Install extensions
code --install-extension apollographql.vscode-apollo
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-python.python
code --install-extension sainnhe.sonokai
code --install-extension usernamehw.errorlens
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension vscodevim.vim

ln -sv ~/.dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -sv ~/.dotfiles/vscode/snippets/ ~/Library/Application\ Support/Code/User
