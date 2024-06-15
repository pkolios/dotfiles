{ config, pkgs, ... }:

{
  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };

  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      # Search
      fzf
      ripgrep
      # LSP
      pyright
      nodePackages.typescript-language-server
      # Formatters / Linters
      nixfmt
      prettierd
      ruff
      stylua
    ];

    plugins = with pkgs.vimPlugins; [
      tokyonight-nvim
      vim-sleuth
      comment-nvim
      gitsigns-nvim
      which-key-nvim
      telescope-nvim
      plenary-nvim
      telescope-fzf-native-nvim
      telescope-ui-select-nvim
      nvim-web-devicons
      nvim-lspconfig
      conform-nvim
      nvim-cmp
      luasnip
      friendly-snippets
      cmp_luasnip
      cmp-nvim-lsp
      cmp-path
      cmp-buffer
      todo-comments-nvim
      mini-nvim
      indent-blankline-nvim
      nvim-lint
      nvim-autopairs
      committia-vim
      vim-tmux-navigator
      nvim-treesitter.withAllGrammars
    ];
  };
}
