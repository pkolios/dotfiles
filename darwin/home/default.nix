{ inputs, primaryUser, ... }:
{
  imports =
    (with inputs.inc-2.modules.homeManager; [
      enc
      git
      delta
      git-forensics
      neovim
      claude-code
      codex
      direnv
      fish
      starship
      zoxide
      atuin
      zellij
      eza
      ripgrep
    ])
    ++ [
      ./ghostty.nix
      ./cli.nix
      ./firefox.nix
      ./dnl.nix
    ];

  home = {
    username = primaryUser;
    homeDirectory = "/Users/${primaryUser}";
    # inc-2 hosts use 26.05; this home predates it, so keep its defaults
    stateVersion = "25.05";
    sessionVariables = {
      BROWSER = "firefox";
      TERMINAL = "ghostty";
    };
  };

  programs.nixvim.clipboard.providers.pbcopy.enable = true;

  # copy nix apps to ~/Applications so Spotlight finds them (the default from
  # stateVersion 25.11 on; symlinks from linkApps are not indexed)
  targets.darwin = {
    linkApps.enable = false;
    copyApps.enable = true;
  };
}
