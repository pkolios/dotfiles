{ config, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll = false;
    };
    "org/gnome/desktop/interface" = {
      clock-show-date = false;
    };
    "org/gnome/shell/keybindings" = {
      screenshot-window = [];
      show-screenshot-ui = ["<Alt>Print"];
    };
  };
}
