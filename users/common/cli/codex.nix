# Options https://nix-community.github.io/home-manager/options.xhtml#opt-programs.codex.enable

{ pkgs, ... }:

{
  programs.codex = {
    enable = true;
    package = pkgs.codex;
  };
}
