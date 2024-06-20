require("tokyonight").setup({
	style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	light_style = "day", -- The theme is used when the background is set to light
	dim_inactive = true,
})

vim.o.termguicolors = true
vim.cmd.colorscheme("tokyonight-storm")
vim.cmd.hi("Comment gui=none")
