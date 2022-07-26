vim.keymap.set("n", "<Leader>m", "<cmd>lua require'telescope.builtin'.oldfiles{}<CR>") -- recently used files
vim.keymap.set("n", "<Leader>/", "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>") -- find in current buffer
vim.keymap.set("n", "<Leader>f", "<cmd>lua require'telescope.builtin'.git_files{}<CR>") -- git files
vim.keymap.set("n", "<Leader>bfs", "<cmd>lua require'telescope.builtin'.find_files{}<CR>") -- all files
vim.keymap.set("n", "<Leader>rg", "<cmd>lua require'telescope.builtin'.live_grep{}<CR>") -- ripgrep like grep through dir
