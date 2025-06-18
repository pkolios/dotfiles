{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    delta
  ];

  programs.git = {
    enable = true;
    userName = "Paris Kolios";
    userEmail = "paris.k@gmail.com";
    aliases = {
      co = "checkout";
      st = "status";
      gl = "log --graph --all --decorate --date=relative --abbrev-commit";
      fixup = "commit --fixup";
      branch-name = "!git rev-parse --abbrev-ref HEAD";
      unstage = "reset HEAD~";
      rlog = "!git log $(git describe --tags --abbrev=0)..HEAD --oneline";
    };

    ignores = [
      "*~"
      "*.swp"
    ];

    extraConfig = {
      github.user = "pkolios";
      core.editor = "nvim";
      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
      merge.conflictstyle = "zdiff3";
      rerere.enabled = true;
      init.defaultBranch = "main";
      push.default = "upstream";
      push.autoSetupRemote = true;
      color = {
        diff = "auto";
        status = "auto";
        branch = "auto";
        ui = "auto";
      };
      pager.branch = true;
    };
  };
}
