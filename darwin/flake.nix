{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ pkgs.vim
        ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Disable determinate nix
      nix.enable = false;

      # Enable rosetta support
      nix.extraOptions = ''
        extra-platforms = x86_64-darwin aarch64-darwin
      '';

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      # System primary user
      system.primaryUser = "paris";

      # Sudo with touch id
      security.pam.services.sudo_local.touchIdAuth = true;

      # MacOS default settings
      system.defaults = {
        dock.autohide = true;
        dock.mru-spaces = false;
        dock.magnification = false;
        dock.orientation = "left";
        dock.persistent-apps = [ ];
        dock.show-recents = false;
        dock.tilesize = 32;
        finder.AppleShowAllExtensions = true;
        finder.FXPreferredViewStyle = "clmv";
      };
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#athena
    darwinConfigurations."athena" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
