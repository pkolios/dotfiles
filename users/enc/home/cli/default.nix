{ config, pkgs, ... }:

{
  imports = [
    ./docker-compose.nix
    ./git.nix
    ./neovim
    ./ripgrep.nix
  ];

  home.packages = with pkgs; [
    p7zip
    tree
    xclip
  ];

  programs.btop.enable = true;
  programs.eza.enable = true;
}
