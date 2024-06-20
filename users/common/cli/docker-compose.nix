{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    docker-compose
  ];

  home.shellAliases = {
    dc = "${pkgs.docker-compose}/bin/docker-compose";
  };
}
