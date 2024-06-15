{ pkgs, ... }:

let font = "Iosevka Nerd Font Mono";
in {
  programs.alacritty = {
    enable = true;
    settings = {
      shell.program = "${pkgs.fish}/bin/fish";
      scrolling.history = 10000;
      env = { term = "xterm-256color"; };

      font = {
        normal.family = font;
        bold.family = font;
        italic.family = font;
        size = 12;
      };

      window = {
        startup_mode = "Maximized";
        padding.x = 3;
        padding.y = 3;
        decorations = "None";
      };

      # https://github.com/folke/tokyonight.nvim/blob/main/extras/alacritty/tokyonight_storm.toml
      colors = {
        primary = {
          background = "#24283b";
          foreground = "#c0caf5";
        };
        normal = {
          black = "#1d202f";
          red = "#f7768e";
          green = "#9ece6a";
          yellow = "#e0af68";
          blue = "#7aa2f7";
          magenta = "#bb9af7";
          cyan = "#7dcfff";
          white = "#a9b1d6";
        };
        bright = {
          black = "#414868";
          red = "#f7768e";
          green = "#9ece6a";
          yellow = "#e0af68";
          blue = "#7aa2f7";
          magenta = "#bb9af7";
          cyan = "#7dcfff";
          white = "#c0caf5";
        };
        indexed_colors = [
          {
            index = 16;
            color = "#ff9e64";
          }
          {
            index = 17;
            color = "#db4b4b";
          }
        ];
      };
    };
  };
}
