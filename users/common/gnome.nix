{
  config,
  pkgs,
  lib,
  ...
}:

let
  mkTuple = lib.hm.gvariant.mkTuple;
in
{
  dconf.settings = {
    "org/gnome/shell" = {

      favorite-apps = [
        "alacritty.desktop"
        "firefox.desktop"
        "spotify.desktop"
        "org.gnome.Nautilus.desktop"
      ];

      disable-user-extensions = false;

      disabled-extensions = [ ];

      # `gnome-extensions list` for a list
      enabled-extensions = with pkgs.gnomeExtensions; [
        system-monitor.extensionUuid
        removable-drive-menu.extensionUuid
      ];
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll = false;
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/desktop/interface" = {
      clock-show-date = true;
    };
    "org/gnome/desktop/input-sources" = {
      show-all-sources = true;
      sources = [
        (mkTuple [
          "xkb"
          "us"
        ])
        (mkTuple [
          "xkb"
          "gr"
        ])
      ];
    };
    "org/gnome/shell/keybindings" = {
      screenshot-window = [ ];
      show-screenshot-ui = [ "<Alt>Print" ];
    };
  };
}
