{ ... }:
{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      upgrade = true;
      cleanup = "zap";
    };

    caskArgs.no_quarantine = true;
    global.brewfile = true;

    # homebrew is best for GUI apps
    # nixpkgs is best for CLI tools
    casks = [
      # OS enhancements
      # "aerospace"
      "hammerspoon"

      # messaging
      "slack"

      # other
      "keepassxc"
      "1password"
      "spotify"
      "google-chrome"
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
