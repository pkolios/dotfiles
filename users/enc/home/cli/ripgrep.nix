{ pkgs, ... }:

{
  programs.ripgrep = {
    enable = true;
  };

  home.shellAliases = {
    # ripgrep common args
    # -C 2: 2 lines context | -M 160: Print up to 160th line column
    rg = "${pkgs.ripgrep} -C 2 -M 160";
    rgv = "${pkgs.ripgrep}/bin/rg";
  };
}
