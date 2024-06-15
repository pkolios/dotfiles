{ config, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./fish.nix
    ./starship.nix
    ./tmux.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };

  home.shellAliases = {
    # ls, mv, rm, cp
    ls = "eza";
    l = "eza -lAh";
    la = "eza -lah";
    ll = "eza -lh";
    mv = "mv -v";
    rm = "rm -i -v";
    cp = "cp -v";

    # nix
    nix-rebuild = "sudo nixos-rebuild switch --flake .#nyx";
    nix-clean = "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d";
    nix-gc = "sudo nix-collect-garbage --delete-old";
  };
}
