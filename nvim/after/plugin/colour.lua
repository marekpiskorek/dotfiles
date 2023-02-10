local dim_blue = "#485e7d"
-- vim.opt.background = "light"
-- vim.cmd("colorscheme catppuccin-frappe")
vim.cmd("colorscheme kanagawa")
-- vim.cmd("colorscheme gruvbox")
-- Italic comments has to be defined after the colorscheme
-- This does not work unless tmux is configured correctly to allow italics
vim.api.nvim_set_hl(0, 'Comment', { italic = true, fg = dim_blue })
