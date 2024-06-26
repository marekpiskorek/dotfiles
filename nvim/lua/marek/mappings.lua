-- Use Control + HJKL to move between splits
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>")

-- This unsets the "last search pattern" register by hitting return
vim.keymap.set("n", "<CR>", "<cmd>noh<CR><CR>")

-- https://neovim.discourse.group/t/reload-init-lua-and-all-require-d-scripts/971/11
-- vim.keymap.set("n", "<leader>sv", "<cmd>lua ReloadConfig()<CR>")

-- LSP keybindings come here - they didn't work on config initialization and there is no need
-- for them to be limited to LSP start - they will simply have no result when LSP is stopped.
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "<Leader>vws", "<cmd>vim.lsp.buf.workspace_symbol()<CR>")
vim.keymap.set("n", "<Leader>vd", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
vim.keymap.set("n", "<Leader>vca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
vim.keymap.set("n", "<Leader>vrn", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "H", "<cmd>lua vim.lsp.buf.signature_help()<CR>")

vim.keymap.set("n", "<Leader>c", "<cmd>CopyRelPath<CR>")
-- vim.keymap.set("v", "<Leader>y", "<cmd>OSCYankVisual<CR>") -- initial ESC is required to move from visual back to normal mode

-- format file
vim.keymap.set("n", "<C-F>", "<cmd>lua vim.lsp.buf.format()<CR>")

-- old version of ripgrep: now we use silver searcher!
-- vim.keymap.set('n', '<Leader>rg', function () require 'telescope_setup'.live_grep_in_glob {} end)

-- FZF replacing Telescope mappings.
-- vim.keymap.set("n", "<Leader>f", "<cmd>:Files<CR>")
-- vim.keymap.set("n", "<Leader>rg", "<cmd>:Ag<CR>")

vim.keymap.set("n", "<C-K>", "<cmd>TmuxNavigateUp<CR>")
vim.keymap.set("n", "<C-J>", "<cmd>TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-H>", "<cmd>TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-L>", "<cmd>TmuxNavigateRight<CR>")

-- OSCYank mappings
-- vim.keymap.set('n', '<leader>y', require('osc52').copy_operator, {expr = true})
-- vim.keymap.set('n', '<leader>yy', '<leader>c_', {remap = true})
-- vim.keymap.set('v', '<leader>y', require('osc52').copy_visual)
