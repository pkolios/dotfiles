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

    # TokyoNight colors for Tmux
    # https://github.com/folke/tokyonight.nvim/blob/main/extras/tmux/tokyonight_storm.tmux
    set -g mode-style "fg=#7aa2f7,bg=#3b4261"
    set -g message-style "fg=#7aa2f7,bg=#3b4261"
    set -g message-command-style "fg=#7aa2f7,bg=#3b4261"
    set -g pane-border-style "fg=#3b4261"
    set -g pane-active-border-style "fg=#7aa2f7"
    set -g status "on"
    set -g status-justify "left"
    set -g status-style "fg=#7aa2f7,bg=#1f2335"
    set -g status-left-length "100"
    set -g status-right-length "100"
    set -g status-left-style NONE
    set -g status-right-style NONE
    set -g status-left "#[fg=#1d202f,bg=#7aa2f7,bold] #S #[fg=#7aa2f7,bg=#1f2335,nobold,nounderscore,noitalics]"
    set -g status-right "#[fg=#1f2335,bg=#1f2335,nobold,nounderscore,noitalics]#[fg=#7aa2f7,bg=#1f2335] #{prefix_highlight} #[fg=#3b4261,bg=#1f2335,nobold,nounderscore,noitalics]#[fg=#7aa2f7,bg=#3b4261] %Y-%m-%d  %H:%M #[fg=#7aa2f7,bg=#3b4261,nobold,nounderscore,noitalics]#[fg=#1d202f,bg=#7aa2f7,bold] #h "
    setw -g window-status-activity-style "underscore,fg=#a9b1d6,bg=#1f2335"
    setw -g window-status-separator ""
    setw -g window-status-style "NONE,fg=#a9b1d6,bg=#1f2335"
    setw -g window-status-format "#[fg=#1f2335,bg=#1f2335,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#1f2335,bg=#1f2335,nobold,nounderscore,noitalics]"
    setw -g window-status-current-format "#[fg=#1f2335,bg=#3b4261,nobold,nounderscore,noitalics]#[fg=#7aa2f7,bg=#3b4261,bold] #I  #W #F #[fg=#3b4261,bg=#1f2335,nobold,nounderscore,noitalics]"
    # tmux-plugins/tmux-prefix-highlight support
    set -g @prefix_highlight_output_prefix "#[fg=#e0af68]#[bg=#1f2335]#[fg=#1f2335]#[bg=#e0af68]"
    set -g @prefix_highlight_output_suffix ""

    # if run as "tmux attach", create a session if one does not already exist
    new-session -n $HOST
    '';
  };
}
