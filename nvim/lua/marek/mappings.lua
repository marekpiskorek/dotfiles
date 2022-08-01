local nnoremap = require("marek.keymap").nnoremap

-- Use Control + HJKL to move between splits
nnoremap('<C-h>', '<cmd>wincmd h<CR>')
nnoremap('<C-j>', '<cmd>wincmd j<CR>')
nnoremap('<C-k>', '<cmd>wincmd k<CR>')
nnoremap('<C-l>', '<cmd>wincmd l<CR>')

-- This unsets the "last search pattern" register by hitting return
nnoremap('<CR>', '<cmd>noh<CR><CR>')

-- https://neovim.discourse.group/t/reload-init-lua-and-all-require-d-scripts/971/11
nnoremap('<leader>sv', "<cmd>lua ReloadConfig()<CR>")
