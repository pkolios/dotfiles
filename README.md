# Setup mac for dev

## Install homebrew

Check homebrew site for installation changes otherwise use:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Homebrew should take care of install xcode's command line tools.

Opt out of analytics with `brew analytics off`

## Install browsers

```sh
brew install firefox google-chrome
```

## Install basic set of tools

```sh
brew install git curl wget tree ripgrep neovim p7zip keepassxc
```

## Install terminal, shell & multiplexer

```sh
brew install alacritty zsh tmux neofetch
```

## Install fonts

```sh
brew tap homebrew/cask-fonts
brew install font-victor-mono font-iosevka-nerd-font
```

## Configure git

Generate ssh key & add to github profile

Clone this repo in `$HOME` dir.

Link `.gitconfig` and `.global-gitignore`.

```sh
ln -sv ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sv ~/.dotfiles/.global-gitignore ~/.global-gitignore
```

TODO: gpg

## Configure alacritty

Setup terminfo for alacritty

```sh
wget https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info
sudo tic -xe alacritty,alacritty-direct alacritty.info
rm alacritty.info
```

Link `.alacritty.yml`.

```sh
ln -sv ~/.dotfiles/.alacritty.yml ~/.alacritty.yml
```

## Configure zsh

Install oh-my-zsh for plugins and themes

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install zsh-autosuggestions
```

Link zsh configuration & theme.

```sh
ln -sv ~/.dotfiles/.zshrc ~/.zshrc
ln -sv ~/.dotfiles/.zshrc-alias ~/.zshrc-alias
ln -sv ~/.dotfiles/.zshrc-opts ~/.zshrc-opts
ln -sv ~/.dotfiles/enc.zsh-theme ~/.oh-my-zsh/themes/enc.zsh-theme
```

## Configure tmux

Link `.tmux.conf`.

```sh
ln -sv ~/.dotfiles/.tmux.conf ~/.tmux.conf
```

To configure tmux-256color term that supports italics follow [this guide](https://gist.github.com/bbqtd/a4ac060d6f6b9ea6fe3aabe735aa9d95#the-right-way).

## Configure nvim

Install nvim optional dependencies

```sh
brew install python node
```

Install plugin manager, link `init.vim` and fetch plugins

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim
ln -sv ~/.dotfiles/init.vim ~/.config/nvim/init.vim

pip3 install neovim jedi 'python-lsp-server[all]' pyls-flake8 pylsp-mypy pyls-isort python-lsp-black pyls-memestra pylsp-rope
npm install -g neovim
gem install neovim
nvim -c PlugUpdate

```

## Configure macOS

```sh
defaults write http://com.apple.Finder AppleShowAllFiles true  # Show hidden files in finder
```

## Install & configure project specific tooling

```sh
brew install poetry terraform direnv podman libpq pre-commit obsidian
```

Enable tab completion for poetry

```sh
mkdir $ZSH_CUSTOM/plugins/poetry
poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
```

Init podman machine

```sh
podman machine init
```

## (Optional) Install xcode, window manager & hotkey daemon

Use app store to install xcode as it is required for yabai

```sh
brew tap koekeishiya/formulae
brew install yabai skhd
```

## (Optional) Other programs

Linear mouse to remove mouse acceleration

```sh
brew install linearmouse
```
