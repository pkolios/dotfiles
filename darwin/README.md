# MacOS Nix Experiments

This directory contains MacOS related Nix setup & configuration files.

## Installation

1. Use the determinate nix installer to install nix https://determinate.systems/blog/graphical-nix-installer/

Make sure to answer *NO* when the determinate installer asks if you want to install Determinate Nix.

```sh
curl \
  --proto '=https' \
  --tlsv1.2 \
  -sSf \
  -L https://install.determinate.systems/nix \
  | sh -s -- install
```

2. Install nix-darwin

https://github.com/nix-darwin/nix-darwin?tab=readme-ov-file#getting-started

First time install nix-darwin with:

```sh
nix run nix-darwin -- switch --flake .
```

Then when rebuilding the config use:

```sh
darwin-rebuild switch --flake .
```


3. Install rosetta

```sh
softwareupdate --install-rosetta --agree-to-license
```

## Updating the system

```sh
nix flake update
darwin-rebuild switch --flake .
```

## Notes

Use homebrew for desktop applications configured manually and nix for cli apps and apps configured via home-manager

## TODO

- [ ] Figure out how to handle ctrl / cmd keys
- [ ] Install / configure docker & podman

## References

https://nixcademy.com/posts/nix-on-macos/
https://dreamsofcode.io/blog/nix-darwin-my-favorite-package-manager-for-macos
https://github.com/dustinlyons/nixos-config/tree/main?tab=readme-ov-file#5-make-apps-executable
