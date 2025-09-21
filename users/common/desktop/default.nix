{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [ ./firefox.nix ];

  home.packages = with pkgs; [
    insync
    keepassxc
    obsidian
    signal-desktop
    slack
    spotify
    vlc
  ];
}
