-- Use Control + HJKL to move between splits
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>")

-- This unsets the "last search pattern" register by hitting return
vim.keymap.set("n", "<CR>", "<cmd>noh<CR><CR>")

-- https://neovim.discourse.group/t/reload-init-lua-and-all-require-d-scripts/971/11
vim.keymap.set("n", "<leader>sv", "<cmd>lua ReloadConfig()<CR>")

-- LSP keybindings come here - they didn't work on config initialization and there is no need
-- for them to be limited to LSP start - they will simply have no result when LSP is stopped.
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "<Leader>vws", "<cmd>vim.lsp.buf.workspace_symbol()<CR>")
vim.keymap.set("n", "<Leader>vd", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
vim.keymap.set("n", "<Leader>vca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
-- vim.keymap.set("n", "<Leader>vrr", "<cmd>lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "<Leader>vrn", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "H", "<cmd>lua vim.lsp.buf.signature_help()<CR>")

vim.keymap.set("", "<Leader>y", "<ESC><cmd>OSCYank<CR>") -- no one knows why the initial ESC is required but this doesn't work without it ¯\_(ツ)_/¯
