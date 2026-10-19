{
  pkgs,
  inputs,
  self,
  primaryUser,
  ...
}:
{
  imports = [
    ./homebrew.nix
    ./settings.nix
    ./hammerspoon.nix
    # home-manager with the settings shared across inc-2 hosts
    inputs.inc-2.modules.darwin.home-manager
    inputs.nix-homebrew.darwinModules.nix-homebrew
  ];

  # nix itself is managed by the determinate installer, not nix-darwin
  nix.enable = false;

  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    # nixpkgs' vim-zellij-navigator (used by inc-2's zellij aspect) fails to
    # build on darwin, its build scripts don't find libiconv. The plugin is
    # wasm, the same on every platform, so use the upstream release build.
    (final: prev: {
      zellijPlugins = prev.zellijPlugins // {
        vim-zellij-navigator = final.fetchurl {
          url = "https://github.com/hiasr/vim-zellij-navigator/releases/download/0.3.0/vim-zellij-navigator.wasm";
          hash = "sha256-d+Wi9i98GmmMryV0ST1ddVh+D9h3z7o0xIyvcxwkxY0=";
        };
      };
    })
  ];

  # homebrew installation manager
  nix-homebrew = {
    user = primaryUser;
    enable = true;
    autoMigrate = true;
  };

  # home-manager config
  home-manager = {
    users.${primaryUser} = {
      imports = [
        ../home
      ];
    };
    extraSpecialArgs = {
      inherit inputs self primaryUser;
    };
  };

  # macOS-specific settings
  system.primaryUser = primaryUser;
  users.users.${primaryUser} = {
    home = "/Users/${primaryUser}";
    shell = pkgs.fish;
  };
  environment = {
    systemPath = [
      "/opt/homebrew/bin"
    ];
    pathsToLink = [ "/Applications" ];
  };
}
