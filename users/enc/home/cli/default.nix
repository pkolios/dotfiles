{ config, pkgs, ... }:

{
  imports = [
    ./docker-compose.nix
    ./git.nix
    ./ripgrep.nix
  ];

  home.packages = with pkgs; [
    p7zip
    tree
  ];

  programs.btop.enable = true;
  programs.eza.enable = true;
  programs.neovim.enable = true;
}
