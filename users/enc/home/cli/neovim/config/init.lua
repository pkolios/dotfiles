-- [[ Based on https://github.com/nvim-lua/kickstart.nvim & https://github.com/dam9000/kickstart-modular.nvim ]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- ":Q" as ":q" etc
vim.cmd([[
  if has("user_commands")
    command! -bang -nargs=? -complete=file E e<bang> <args>
    command! -bang -nargs=? -complete=file W w<bang> <args>
    command! -bang -nargs=? -complete=file Wq wq<bang> <args>
    command! -bang -nargs=? -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
    command! -bang Wqa wqa<bang>
    command! -bang WQa wqa<bang>
  endif
]])

-- [[ Setting options ]]
require("options")

-- [[ Keymaps ]]
require("keymaps")

-- [[ Auto commands ]]
require("autocmds")

-- [[ Theme ]]
require("theme")

-- [[ Plugins ]]
require("plugins")
