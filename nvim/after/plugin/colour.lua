-- vim.opt.background = "light"
vim.cmd("colorscheme tokyonight-moon")
-- Italic comments has to be defined after the colorscheme
-- This does not work unless tmux is configured correctly to allow italics
vim.api.nvim_set_hl(0, 'Comment', { italic = true })
