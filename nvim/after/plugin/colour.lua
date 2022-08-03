vim.opt.background = "dark"
vim.cmd("colorscheme gruvbox-material")
-- Italic comments has to be defined after the colorscheme
vim.highlight.create('Comment', {cterm='italic', gui='italic'}, false)

