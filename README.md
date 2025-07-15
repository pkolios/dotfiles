# Nix / NixOS dotfiles

### Common commands

```sh
# Rebuild after configuration changes
sudo nixos-rebuild switch --flake .

# Same but targeting a specific host
sudo nixos-rebuild switch --flake .#nyx

# Update flake.lock
nix flake update

# Or replace only the specific input, such as home-manager:
nix flake update home-manager

# Update home manager
sudo nix-channel --update

```

### Downgrading - upgrading packages

When working with Flakes, you may encounter situations where you need to downgrade or upgrade certain packages to address bugs or compatibility issues...
https://nixos-and-flakes.thiscute.world/nixos-with-flakes/downgrade-or-upgrade-packages

### Upgrading NixOS

https://nixos.org/manual/nixos/stable/#sec-upgrading

```sh
# To see which NixOS channel you’re subscribed to, run the following as root:
sudo nix-channel --list | grep nixos
# > nixos https://nixos.org/channels/nixos-24.05

# To switch to a different NixOS channel, do... (Be sure to include the nixos parameter at the end.) For instance, to use the NixOS 25.05 stable channel:
sudo nix-channel --add https://channels.nixos.org/nixos-25.05 nixos

# You can then upgrade NixOS to the latest version in your chosen channel by running
sudo nixos-rebuild switch --upgrade --flake .#nyx

# Then run the common commands for upgrading flake etc.
```
