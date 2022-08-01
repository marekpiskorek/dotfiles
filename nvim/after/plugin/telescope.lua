vim.keymap.set("n", "<Leader>m", "<cmd>lua require'telescope.builtin'.oldfiles{}<CR>") -- recently used files
vim.keymap.set("n", "<Leader>/", "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>") -- find in current buffer
vim.keymap.set("n", "<Leader>f", "<cmd>lua require'telescope.builtin'.git_files{}<CR>", {noremap = true, silent = true}) -- git files
vim.keymap.set("n", "<Leader>bfs", function() require('telescope.builtin').find_files{} end) -- all files
vim.keymap.set("n", "<Leader>rg", "<cmd>lua require'telescope.builtin'.live_grep{}<CR>", { noremap = true, silent = true }) -- ripgrep like grep through dir
vim.keymap.set("n", "<C-p>", "<cmd>Telescope<CR>", { noremap = true, silent = true }) -- ripgrep like grep through dir
