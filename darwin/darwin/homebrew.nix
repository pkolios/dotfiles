{ ... }:
{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    # caskArgs.no_quarantine = true;
    global.brewfile = true;

    # homebrew is best for GUI apps
    # nixpkgs is best for CLI tools
    casks = [
      # OS enhancements
      # "aerospace"
      "hammerspoon"

      # messaging
      "slack"

      # browsers
      "firefox"

      # other
      "keepassxc"
      "1password"
      "dbeaver-community"
      "spotify"
      "google-chrome"
      "microsoft-excel"
      "microsoft-word"
      "the-unarchiver"
      "kap"
    ];
    # brews = [
    #   "docker"
    #   "colima"
    # ];
    # For aerospace
    # taps = [
    #   "nikitabobko/tap"
    # ];
  };
}
