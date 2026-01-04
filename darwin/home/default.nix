{ primaryUser, ... }:
{
  imports = [
    ../../users/common/cli
    ../../users/common/shell
  ];

  home = {
    username = primaryUser;
    stateVersion = "25.05";
    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "firefox";
      TERMINAL = "alacritty";
    };
  };
}
