# MacOS Nix

nix-darwin configuration for the work MacBook (`athena`).

The user environment (fish, starship, git, neovim, zellij, coding agents, ...)
comes from the home-manager aspects of my personal flake
[inc-2](https://github.com/pkolios/inc-2), which is a flake input here. This
flake only adds what is macOS or work specific. `nixpkgs` and `home-manager`
follow inc-2, so its aspects build exactly as on my other hosts.

## Layout

```
flake.nix                       inputs (inc-2, nix-darwin, nix-homebrew, firefox-addons) & athena
darwin/default.nix              nix-darwin base: homebrew, user, home-manager wiring
darwin/settings.nix             macOS defaults (keyboard, trackpad, finder, dock, ...)
darwin/homebrew.nix             GUI apps as homebrew casks
darwin/hammerspoon.nix          caps lock as ctrl/escape (with hammerspoon/)
home/default.nix                home-manager: the inc-2 aspects + the modules below
home/ghostty.nix                terminal: tokyonight (from tokyonight.nvim), JetBrainsMonoNL Nerd Font Mono
home/cli.nix                    extra cli tools & aliases
home/firefox.nix                firefox profile (the app comes from homebrew)
home/dnl.nix                    DNL local development environment
hosts/athena/configuration.nix  host specific settings
```

## Installation

1. Install nix with the determinate installer
   https://determinate.systems/blog/graphical-nix-installer/

   Make sure to answer *NO* when the determinate installer asks if you want
   to install Determinate Nix.

   ```sh
   curl \
     --proto '=https' \
     --tlsv1.2 \
     -sSf \
     -L https://install.determinate.systems/nix \
     | sh -s -- install
   ```

2. Make sure `ssh -T git@github.com` works: inc-2 is private and fetched over
   ssh (`git+ssh://git@github.com/pkolios/inc-2`).

3. Install nix-darwin
   https://github.com/nix-darwin/nix-darwin?tab=readme-ov-file#getting-started

   Fetch the inputs as your user first, since the switch runs as root, which
   has no access to your ssh key:

   ```sh
   nix flake archive
   sudo nix run nix-darwin/nix-darwin-26.05#darwin-rebuild -- switch --flake .
   ```

   Afterwards rebuild with:

   ```sh
   sudo darwin-rebuild switch --flake .
   ```

   If fetching inc-2 still fails under sudo, pass the ssh agent through:
   `sudo --preserve-env=SSH_AUTH_SOCK darwin-rebuild switch --flake .`

4. Install rosetta

   ```sh
   softwareupdate --install-rosetta --agree-to-license
   ```

5. Check the login shell (`dscl . -read ~ UserShell`). nix-darwin does not
   change it for existing users; ghostty starts fish regardless. To make fish
   the login shell:

   ```sh
   chsh -s /run/current-system/sw/bin/fish
   ```

## Updating the system

Pull the latest inc-2 (shell, editor, ... changes):

```sh
nix flake update inc-2
sudo darwin-rebuild switch --flake .
```

Update everything (nixpkgs and home-manager move with inc-2's lock):

```sh
nix flake update
sudo darwin-rebuild switch --flake .
```

To try inc-2 changes before pushing them, point the input at a local checkout:

```sh
sudo darwin-rebuild switch --flake . --override-input inc-2 path:$HOME/inc-2
```

## Notes

Use homebrew for desktop applications configured manually and nix for cli
apps and apps configured via home-manager. Nix apps are copied to
`~/Applications/Home Manager Apps` so Spotlight finds them. Updating them
needs the App Management permission (System Settings > Privacy & Security)
for the terminal you switch from; activation stops and says so otherwise.

Files home-manager would overwrite are removed, not backed up (the shared
inc-2 home-manager settings).

## TODO

- [ ] Figure out how to handle ctrl / cmd keys
- [ ] Install / configure docker & podman

## References

https://nixcademy.com/posts/nix-on-macos/
https://dreamsofcode.io/blog/nix-darwin-my-favorite-package-manager-for-macos
