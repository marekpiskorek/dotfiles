-- Current colorscheme
vim.cmd("colorscheme everforest")

-- Italic comments has to be defined after the colorscheme
-- This does not work unless tmux is configured correctly to allow italics
local dim_blue = "#485e7d"
vim.api.nvim_set_hl(0, 'Comment', { italic = true, fg = dim_blue })
