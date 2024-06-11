{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    historyLimit = 100000;
    terminal = "tmux-256color";
    mouse = true;
    keyMode = "vi";
    prefix = "C-x";
    escapeTime = 10;

    extraConfig = ''
    set-option -g focus-events on
    set -g status-position top
    set-option -g prefix2 C-b

    # Set new panes to open in current directory
    bind c new-window -c "#{pane_current_path}"
    bind '"' split-window -c "#{pane_current_path}"
    bind % split-window -h -c "#{pane_current_path}"

    # if run as "tmux attach", create a session if one does not already exist
    new-session -n $HOST
    '';
  };
}
