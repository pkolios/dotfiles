{ config, pkgs, inputs, ... }:

{
  imports = [ ./firefox.nix ];

  home.packages = with pkgs; [
    insync
    keepassxc
    neovide
    signal-desktop
    slack
    spotify
    vlc
    whatsapp-for-linux
  ];
}
