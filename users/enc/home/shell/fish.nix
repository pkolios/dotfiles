{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      set -g fish_key_bindings fish_vi_key_bindings
      if status is-interactive
      and not set -q TMUX
        exec tmux attach
      end
    '';
    plugins = [
    ];
  };
}
