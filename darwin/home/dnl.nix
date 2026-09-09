# DNL local development environment (dependable builds).
{ config, pkgs, ... }:
let
  dnlRoot = "${config.home.homeDirectory}/dnl";
  dnlLocal = "${dnlRoot}/dnl_local";
in
{
  home.packages = with pkgs; [
    git-crypt
    git-lfs # keeps the LFS filter runnable outside a mise context, e.g. a fresh clone
  ];

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
    # annex_reader tracks models with LFS, and `make deps-mise-root` runs
    # `git lfs install`, which wants the filter.lfs section in the global git
    # config. That file is read-only here, so declare the section up front:
    # git-lfs skips the write when the values already match. It only accepts
    # the plain `git-lfs ...` form, hence package = null; the binary comes from
    # home.packages above and from mise inside the checkouts.
    lfs = {
      enable = true;
      package = null;
    };
    settings.url."git@github.com:".insteadOf = [
      "https://github.com/"
      "git+https://github.com/"
    ];
    # nix-direnv's cache directory inside checkouts that `use flake`
    ignores = [ ".direnv" ];
  };
}
