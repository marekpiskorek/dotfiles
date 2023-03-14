require("telescope").setup {
  extensions = {
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
    }
  }
}

require("telescope").load_extension('fzf')

-- telescope related mappings
vim.keymap.set("n", "<Leader>/", function() require 'telescope.builtin'.current_buffer_fuzzy_find {} end) -- find in current buffer
vim.keymap.set("n", "<Leader>bfs", function() require 'telescope.builtin'.find_files {} end) -- all files
vim.keymap.set("n", "<Leader>f", function() require 'telescope.builtin'.git_files {} end) -- git files
vim.keymap.set("n", "<Leader>rg", function() require('telescope').extensions.live_grep_args.live_grep_args() end)
vim.keymap.set("n", "<C-p>", "<cmd>Telescope<CR>") -- all the telescope builtins
vim.keymap.set("n", "<C-y>", "<cmd>Telescope keymaps<CR>") -- keymaps
