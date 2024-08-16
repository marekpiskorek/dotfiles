local keymap = vim.keymap.set
-- Use Control + HJKL to move between splits
keymap("n", "<C-h>", "<cmd>wincmd h<CR>")
keymap("n", "<C-j>", "<cmd>wincmd j<CR>")
keymap("n", "<C-k>", "<cmd>wincmd k<CR>")
keymap("n", "<C-l>", "<cmd>wincmd l<CR>")

-- This unsets the "last search pattern" register by hitting return
keymap("n", "<CR>", "<cmd>noh<CR><CR>")


-- LSP keybindings come here - they didn't work on config initialization and there is no need
-- for them to be limited to LSP start - they will simply have no result when LSP is stopped.
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
keymap("n", "<Leader>vws", "<cmd>vim.lsp.buf.workspace_symbol()<CR>")
keymap("n", "<Leader>vd", "<cmd>lua vim.diagnostic.open_float()<CR>")
keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
keymap("n", "<Leader>vca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
keymap("n", "<Leader>vrn", "<cmd>lua vim.lsp.buf.rename()<CR>")
keymap("n", "H", "<cmd>lua vim.lsp.buf.signature_help()<CR>")

keymap("n", "<Leader>c", "<cmd>CopyRelPath<CR>")

-- format file
keymap("n", "<C-F>", "<cmd>lua vim.lsp.buf.format()<CR>")

-- old version of ripgrep: now we use silver searcher!
-- keymap('n', '<Leader>rg', function () require 'telescope_setup'.live_grep_in_glob {} end)

-- FZF replacing Telescope mappings.
-- keymap("n", "<Leader>f", "<cmd>:Files<CR>")
-- keymap("n", "<Leader>rg", "<cmd>:Ag<CR>")

-- Use hjkl to navigate between tmux panes as well as vim splits:
-- commenting out as it doesn't work when tmux is ran locally and nvim on container
-- keymap("n", "<C-K>", "<cmd>TmuxNavigateUp<CR>")
-- keymap("n", "<C-J>", "<cmd>TmuxNavigateDown<CR>")
-- keymap("n", "<C-H>", "<cmd>TmuxNavigateLeft<CR>")
-- keymap("n", "<C-L>", "<cmd>TmuxNavigateRight<CR>")

-- OSCYank mappings
-- keymap('n', '<leader>y', require('osc52').copy_operator, {expr = true})
-- keymap('n', '<leader>yy', '<leader>c_', {remap = true})
-- keymap('v', '<leader>y', require('osc52').copy_visual)

keymap("n", "<leader>e", "<cmd>NvimTreeFindFile<CR>")
-- You probably also want to set a keymap to toggle aerial
keymap("n", "<leader>o", "<cmd>AerialToggle!<CR>")

-- Harpoon keybindings
keymap("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<CR>")
keymap("n", "<C-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>")
keymap("n", "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>")
keymap("n", "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>")
keymap("n", "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>")
keymap("n", "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>")

-- OSCYank copy
-- keymap('n', '<leader>y', '"+y')
-- keymap('n', '<leader>yy', '"+yy')

-- telescope related mappings
keymap("n", "<Leader>/", function() require 'telescope.builtin'.current_buffer_fuzzy_find {} end) -- find in current buffer
keymap("n", "<Leader>bfs", function() require 'telescope.builtin'.find_files {} end)              -- all files
keymap("n", "<Leader>f", function() require 'telescope.builtin'.git_files {} end)                 -- git files
keymap("n", "<C-p>", "<cmd>Telescope<CR>")                                                        -- all the telescope builtins
keymap("n", "<C-y>", "<cmd>Telescope keymaps<CR>")                                                -- keymaps
keymap('n', '<space>g',
  function()
    require('telescope').extensions.live_grep_args.live_grep_args(
      { layout_strategy = 'vertical', layout_config = { width = 0.5 }}
    )
  end,
  opts)      -- fuzzy find
keymap('v', '<space>g',
  function() -- fuzzy find visually selected text
    local text = vim.getVisualSelection()
    require('telescope').extensions.live_grep_args.live_grep_args({
      layout_strategy = 'vertical',
      layout_config = { width = 0.5 },
      default_text =
          text
    })
    -- tb.live_grep({ default_text = text })
  end, opts)
keymap('n', 'gr',
  function() require 'telescope.builtin'.lsp_references { layout_strategy = 'vertical', layout_config = { width = 0.5 } } end,
  opts)
keymap("n", "<Space>rr", function() require 'telescope.builtin'.resume {} end, opts)  -- resume last telescope search
