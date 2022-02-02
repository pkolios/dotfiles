# Setup mac for dev

## Install homebrew

Check homebrew site for installation changes otherwise use:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Homebrew should take care of install xcode's command line tools.

Opt out of analytics with `brew analytics off`


## Install browsers

```
brew install firefox google-chrome
```

## Install basic set of tools

```
brew install git curl wget tree ripgrep neovim
```

## Install terminal, shell & multiplexer

```
brew install alacritty zsh tmux neofetch
```

## Install fonts

```
brew tap homebrew/cask-fonts
brew install --cask font-monoid-font font-victor-mono font-iosevka-nerd-font
```

## Configure git

Generate ssh key & add to github profile

Clone this repo in `$HOME` dir.

Link `.gitconfig` and `.global-gitignore`.

```
ln -sv ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sv ~/.dotfiles/.global-gitignore ~/.global-gitignore
```

3. TODO: gpg

## Configure alacritty

Setup terminfo for alacritty

```
wget https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info
sudo tic -xe alacritty,alacritty-direct alacritty.info
rm alacritty.info
```

Link `.alacritty.yml`.

```
ln -sv ~/.dotfiles/.alacritty.yml ~/.alacritty.yml
```

## Configure zsh

Install oh-my-zsh for plugins and themes

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install zsh-autosuggestions
```

Link zsh configuration & theme.

```
ln -sv ~/.dotfiles/.zshrc ~/.zshrc
ln -sv ~/.dotfiles/.zshrc-alias ~/.zshrc-alias
ln -sv ~/.dotfiles/.zshrc-opts ~/.zshrc-opts
ln -sv ~/.dotfiles/enc.zsh-theme ~/.oh-my-zsh/themes/enc.zsh-theme
```

## Configure tmux

Link `.tmux.conf`.

```
ln -sv ~/.dotfiles/.tmux.conf ~/.tmux.conf
```

To configure tmux-256color term that supports italics follow https://gist.github.com/bbqtd/a4ac060d6f6b9ea6fe3aabe735aa9d95#the-right-way


## Configure nvim

Install plugin manager, link `init.vim` and fetch plugins

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim
ln -sv ~/.dotfiles/init.vim ~/.config/nvim/init.vim

# Install node, depedency of coc extensions
brew install node

nvim -c PlugUpdate

# Run vim and install coc extensions
:CocInstall coc-pyright coc-docker coc-sh coc-highlight coc-markdownlint coc-prettier coc-sql coc-yaml
```

## Install & configure project specific tooling

TODO: python, terraform, podman, k8s
```
brew install python poetry terraform direnv podman libpq
```

Enable tab completion for poetry
```
mkdir $ZSH_CUSTOM/plugins/poetry
poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
```

Init podman machine
```
podman machine init
```

## (Optional) Install xcode, window manager & hotkey daemon

Use app store to install xcode as it is required for yabai

```
brew tap koekeishiya/formulae
brew install yabai skhd
```

## (Optional) Other programs

Linear mouse to remove mouse acceleration

```
brew install linearmouse
```
