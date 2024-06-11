{ pkgs, ... }:

let
  font = "Iosevka Nerd Font Mono";
in
{
  programs.alacritty = {
    enable = true;
    settings = {
      shell.program = "${pkgs.fish}/bin/fish";
      scrolling.history = 10000;

      font = {
        normal.family = font;
        bold.family = font;
        italic.family = font;
        size = 14;
      };

      window = {
        startup_mode = "Maximized";
        padding.x = 3;
        padding.y = 3;
      };
    };
  };
}
