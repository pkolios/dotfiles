{ config, pkgs, ... }:

{
  imports = [ ./docker-compose.nix ./git.nix ./neovim ./ripgrep.nix ];

  home.packages = with pkgs; [ gnumake p7zip tree xclip ];

  programs.btop.enable = true;
  programs.eza.enable = true;

  home.shellAliases = {
    # ls, mv, rm, cp
    ls = "eza";
    l = "eza -lAh";
    la = "eza -lah";
    ll = "eza -lh";
    mv = "mv -v";
    rm = "rm -i -v";
    cp = "cp -v";

    # xclip copy to clipboard
    xclip = "xclip -selection clipboard";

    # nix
    nix-rebuild = "sudo nixos-rebuild switch --flake .#nyx";
    nix-clean =
      "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d";
    nix-gc = "sudo nix-collect-garbage --delete-old";
  };
}
