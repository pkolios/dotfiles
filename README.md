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

1. Generate ssh key & add to github profile
2. Copy `.gitconfig` and `.global-gitignore` to `$HOME`.
3. TODO: gpg

## Configure alacritty

Setup terminfo for alacritty

```
wget https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info
sudo tic -xe alacritty,alacritty-direct alacritty.info
rm alacritty.info
```

Copy `.alacritty.yml` to `$HOME`.

## Configure zsh

Install oh-my-zsh for plugins and easier themes
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install zsh-autosuggestions
```

## Configure tmux

Copy `.tmux.conf` to `$HOME`.

## Configure nvim

TODO

## Install & configure project specific tooling

TODO: python, terraform, podman, k8s

## (Optional) Install xcode, window manager & hotkey daemon

Use app store to install xcode as it is required for yabai

```
brew tap koekeishiya/formulae
brew install yabai skhd
```
