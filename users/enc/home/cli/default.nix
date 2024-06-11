{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./ripgrep.nix
  ];

  home.packages = with pkgs; [
    p7zip
    tree
  ];

  programs.eza.enable = true;
  programs.neovim.enable = true;
}
