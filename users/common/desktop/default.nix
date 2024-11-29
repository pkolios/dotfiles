{ config, pkgs, inputs, ... }:

{
  imports = [ ./firefox.nix ];

  home.packages = with pkgs; [
    insync
    keepassxc
    signal-desktop
    slack
    spotify
    vlc
    whatsapp-for-linux
  ];

  home.neovide = {
    enable = true;
    settings = {
      font = {
        normal = [ "Iosevka Nerd Font Mono" ];
        size = 12.0;
      };
    };
  };
}
