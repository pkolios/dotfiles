{ primaryUser, ... }:
{
  imports = [
    ../../users/common/cli
    ../../users/common/shell
    ../../users/common/desktop/firefox.nix
  ];

  home = {
    username = primaryUser;
    homeDirectory = "/Users/${primaryUser}";
    stateVersion = "25.05";
    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "firefox";
      TERMINAL = "alacritty";
    };
  };
}
