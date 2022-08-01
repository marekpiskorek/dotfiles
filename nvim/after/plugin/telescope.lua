local nnoremap = require("marek.keymap").nnoremap

nnoremap("<Leader>m", "<cmd>lua require'telescope.builtin'.oldfiles{}<CR>") -- recently used files
nnoremap("<Leader>/", "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>") -- find in current buffer
nnoremap("<Leader>f", "<cmd>lua require'telescope.builtin'.git_files{}<CR>", {noremap = true, silent = true}) -- git files
nnoremap("<Leader>bfs", function() require('telescope.builtin').find_files{} end) -- all files
-- nnoremap("<Leader>rg", function() require('telescope.builtin').live_grep{} end)
vim.keymap.set("n", "<Leader>rg", ":lua require'telescope.builtin'.live_grep{}<CR>", { noremap = true, silent = true }) -- ripgrep like grep through dir
-- nnoremap("<Leader>rg", "<cmd>lua require'telescope.builtin'.live_grep{}<CR>", {noremap = true, silent = true}) -- ripgrep like grep through dir
