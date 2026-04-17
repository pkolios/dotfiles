# Options: https://nix-community.github.io/home-manager/options.xhtml#opt-programs.claude-code.enable
{ pkgs, ... }:

{
  programs.claude-code = {
    enable = true;
    package = pkgs.claude-code;
  };
}
