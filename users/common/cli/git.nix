{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    delta
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "Paris Kolios";
      user.email = "paris.k@gmail.com";
      alias = {
        co = "checkout";
        st = "status";
        gl = "log --graph --all --decorate --date=relative --abbrev-commit";
        fixup = "commit --fixup";
        branch-name = "!git rev-parse --abbrev-ref HEAD";
        unstage = "reset HEAD~";
        rlog = "!git log $(git describe --tags --abbrev=0)..HEAD --oneline";
        # show the 20 most changed files in the last year
        check-churn = "git log --format=format: --name-only --since=\"1 year ago\" | sort | uniq -c | sort -nr | head -20";
        # show the top contributors to the codebase, excluding merge commits
        check-bus = "git shortlog -sn --no-merges";
        # show the 20 files with the most bug-related commits
        check-bugs = "git log -i -E --grep=\"fix|bug|broken\" --name-only --format='' | sort | uniq -c | sort -nr | head -20";
        # show the number of commits per month for the last year
        check-accel = "git log --format='%ad' --date=format:'%Y-%m' | sort | uniq -c";
        # show the 20 most recent commits that are likely to be hotfixes or rollbacks
        check-fire = "git log --oneline --since=\"1 year ago\" | grep -iE 'revert|hotfix|emergency|rollback'";
      };
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

    ignores = [
      "*~"
      "*.swp"
    ];
  };
}
