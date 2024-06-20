{ config, pkgs, ... }:

{
  imports = [ ./alacritty.nix ./fish.nix ./starship.nix ./tmux.nix ];

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };
}
