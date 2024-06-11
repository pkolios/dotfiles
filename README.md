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

```

### Downgrading - upgrading packages

When working with Flakes, you may encounter situations where you need to downgrade or upgrade certain packages to address bugs or compatibility issues...
https://nixos-and-flakes.thiscute.world/nixos-with-flakes/downgrade-or-upgrade-packages
