{
  description = "My system configuration";
  inputs = {
    # personal config: home-manager aspects (shell, git, neovim, zellij, ...)
    # https://github.com/pkolios/inc-2 is private, so fetch over ssh
    inc-2.url = "git+ssh://git@github.com/pkolios/inc-2";

    # same nixpkgs & home-manager as inc-2, so its aspects build as there
    nixpkgs.follows = "inc-2/nixpkgs";
    home-manager.follows = "inc-2/home-manager";

    # system-level software and settings (macOS)
    darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    # declarative homebrew management
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      darwin,
      ...
    }@inputs:
    let
      primaryUser = "paris";
    in
    {
      # build darwin flake using:
      # $ darwin-rebuild build --flake .#<name>
      darwinConfigurations."athena" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./darwin
          ./hosts/athena/configuration.nix
        ];
        specialArgs = { inherit inputs self primaryUser; };
      };

    };
}
