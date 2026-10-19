# cli tools on top of the inc-2 aspects
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    docker-compose
    gnumake
    p7zip
    tree
    wireguard-tools
    wireguard-ui
  ];

  programs.btop.enable = true;

  home.shellAliases = {
    dc = "${pkgs.docker-compose}/bin/docker-compose";

    # nix
    nix-clean = "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d";
    nix-gc = "sudo nix-collect-garbage --delete-old";
  };
}
