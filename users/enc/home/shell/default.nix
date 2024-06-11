{ config, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./fish.nix
    ./starship.nix
    ./tmux.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };

  home.shellAliases = {
    vim = "nvim";
    vi = "nvim";
    # :q = "exit";
    
    # ls, mv, rm, cp
    ls = "ls --color";
    l = "ls -lAh --color";
    la = "ls -lah --color";
    ll = "ls -lh --color";
    mv = "mv -v";
    rm = "rm -i -v";
    cp = "cp -v";
  };
}
