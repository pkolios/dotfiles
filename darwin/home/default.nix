{ pkgs, primaryUser, ... }:
{
  imports = [
    ../../users/common/cli
    ../../users/common/shell
    ./firefox.nix
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
    packages = with pkgs; [
      btop
      claude-code
      wireguard-tools
      wireguard-ui
    ];
  };
}
