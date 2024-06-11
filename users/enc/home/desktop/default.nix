{ config, pkgs, inputs, ... }:

{
  imports = [
    ./firefox.nix
  ];

  home.packages = with pkgs; [
    insync
    keepassxc
  ];
}
