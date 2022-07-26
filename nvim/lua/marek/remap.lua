-- Use Control + HJKL to move between splits
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')

-- This unsets the "last search pattern" register by hitting return
vim.keymap.set('n', '<CR>', ':noh<CR><CR>')

-- Open nvimrc file
vim.keymap.set("n", "<Leader>v", "<cmd>vsp $MYVIMRC<CR>")
-- Source nvimrc file
vim.keymap.set("n", "<Leader>sv", "<cmd>source $MYVIMRC<CR>")
