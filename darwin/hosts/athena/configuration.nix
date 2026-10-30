{
  lib,
  pkgs,
  primaryUser,
  ...
}:
{
  networking.hostName = "athena";

  programs.fish.enable = true;

  # sleep timers per power source in minutes, 0 = never.
  # nix-darwin's power.sleep options go through systemsetup,
  # which sets all power sources at once, so call pmset:
  # -c power adapter, -b battery
  system.activationScripts.power.text = lib.mkAfter ''
    pmset -c sleep 0 displaysleep 180 disksleep 0
    pmset -b sleep 5 displaysleep 10 disksleep 30
  '';

  # host-specific homebrew casks
  homebrew.casks = [
    # "slack"
  ];

  # host-specific home-manager configuration
  home-manager.users.${primaryUser} = {
    home.packages = with pkgs; [
      wget
      curl
    ];
  };
}
