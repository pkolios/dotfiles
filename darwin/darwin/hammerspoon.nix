{ pkgs, primaryUser, ... }:
{
  home-manager.users.${primaryUser}.home.file.".hammerspoon" = {
    source = ./hammerspoon;
    recursive = true;
  };
}
