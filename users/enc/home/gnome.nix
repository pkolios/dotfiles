{ config, pkgs, lib, ... }:

let
  mkTuple = lib.hm.gvariant.mkTuple;
in
{
  dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll = false;
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/desktop/interface" = {
      clock-show-date = false;
    };
    "org/gnome/desktop/input-sources" = {
      show-all-sources = true;
      sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "gr" ]) ];
    };
    "org/gnome/shell/keybindings" = {
      screenshot-window = [];
      show-screenshot-ui = ["<Alt>Print"];
    };
  };
}
