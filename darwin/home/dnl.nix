# DNL local development environment (dependable builds).
{ config, pkgs, ... }:
let
  dnlRoot = "${config.home.homeDirectory}/dnl";
  dnlLocal = "${dnlRoot}/dnl_local";
in
{
  home.packages = with pkgs; [ git-crypt ];

  home.sessionVariables = {
    DNL_ROOT = dnlRoot;
    DNL_LOCAL = dnlLocal;
    DNL_TOOLS = "${dnlLocal}/tools";
    DNL_CA_ROOT = "${dnlLocal}/ca_root";
  };

  programs.mise = {
    enable = true;
    globalConfig.settings = {
      # Every mise.toml under $DNL_ROOT carries an [env] block, so each one would
      # otherwise ask for `mise trust`. Trusting the tree once is the same grant
      # `direnv allow` already makes per checkout.
      trusted_config_paths = [ dnlRoot ];
    };
  };

  # Defines dnl_init_direnv, which every DNL .envrc calls.
  xdg.configFile."direnv/direnvrc".source =
    config.lib.file.mkOutOfStoreSymlink "${dnlLocal}/direnv/direnvrc";

  programs.git = {
    settings.url."git@github.com:".insteadOf = [
      "https://github.com/"
      "git+https://github.com/"
    ];
    # nix-direnv's cache directory inside checkouts that `use flake`
    ignores = [ ".direnv" ];
  };
}
