{
  pkgs,
  primaryUser,
  ...
}:
{
  networking.hostName = "athena";

  programs.fish.enable = true;

  # host-specific homebrew casks
  homebrew.casks = [
    # "slack"
  ];

  # host-specific home-manager configuration
  home-manager.users.${primaryUser} = {
    home.packages = with pkgs; [
      vim
      git
      nerd-fonts.iosevka
      nerd-fonts.iosevka-term
      wget
      curl
    ];
  };
}
