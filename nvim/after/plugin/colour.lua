-- local dim_blue = "#485e7d"
-- vim.opt.background = "dark"
-- vim.cmd("colorscheme midnight")
-- vim.cmd("colorscheme catppuccin-macchiato")
-- vim.cmd("colorscheme kanagawa")
require("zenburn").setup()

-- Italic comments has to be defined after the colorscheme
-- This does not work unless tmux is configured correctly to allow italics
vim.api.nvim_set_hl(0, 'Comment', { italic = true, fg = dim_blue })
