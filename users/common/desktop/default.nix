{ config, pkgs, inputs, ... }:

{
  imports = [ ./firefox.nix ];

  home.packages = with pkgs; [
    insync
    keepassxc
    signal-desktop
    spotify
    vlc
    whatsapp-for-linux
  ];
}
