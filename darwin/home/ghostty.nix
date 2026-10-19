{ pkgs, ... }:
{
  home.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

  programs.ghostty = {
    enable = true;
    # the nixpkgs build is linux only; this is the official signed app
    package = pkgs.ghostty-bin;
    settings = {
      # the theme that ships with tokyonight.nvim, matching the editor
      theme = "${pkgs.vimPlugins.tokyonight-nvim}/extras/ghostty/tokyonight_storm";
      font-family = "JetBrainsMonoNL Nerd Font Mono";
      font-size = 13;

      # fish whatever the login shell is
      command = "${pkgs.fish}/bin/fish";

      # zellij binds Alt+hjkl/arrows; macOS sends Option as a compose key otherwise
      macos-option-as-alt = true;

      maximize = true;
      window-padding-x = 3;
      window-padding-y = 3;
      scrollback-limit = 100000000; # bytes, not lines
    };
  };
}
