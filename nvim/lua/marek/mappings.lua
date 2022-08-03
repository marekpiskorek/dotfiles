-- Use Control + HJKL to move between splits
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>")

-- This unsets the "last search pattern" register by hitting return
vim.keymap.set("n", "<CR>", "<cmd>noh<CR><CR>")

-- https://neovim.discourse.group/t/reload-init-lua-and-all-require-d-scripts/971/11
vim.keymap.set("n", "<leader>sv", "<cmd>lua ReloadConfig()<CR>")
