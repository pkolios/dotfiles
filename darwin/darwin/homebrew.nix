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

      # messaging
      "slack"
      "signal"

      # other
      "1password"
      "spotify"
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
