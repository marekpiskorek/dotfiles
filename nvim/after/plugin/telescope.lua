require("telescope").setup {
  extensions = {
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
    }
  }
}

function vim.getVisualSelection()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg('v')
  vim.fn.setreg('v', {})

  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ''
  end
end

local keymap = vim.keymap.set
local tb = require('telescope.builtin')
local opts = { noremap = true, silent = true }


require("telescope").load_extension('fzf')

-- telescope related mappings
keymap("n", "<Leader>/", function() require 'telescope.builtin'.current_buffer_fuzzy_find {} end) -- find in current buffer
keymap("n", "<Leader>bfs", function() require 'telescope.builtin'.find_files {} end)              -- all files
keymap("n", "<Leader>f", function() require 'telescope.builtin'.git_files {} end)                 -- git files
keymap("n", "<C-p>", "<cmd>Telescope<CR>")                                                        -- all the telescope builtins
keymap("n", "<C-y>", "<cmd>Telescope keymaps<CR>")                                                -- keymaps
keymap('n', '<space>g',
  function()
    require('telescope').extensions.live_grep_args.live_grep_args(
      { layout_strategy = 'vertical', layout_config = { width = 0.5 }
      })
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
keymap("n", "<Space>rr", function () require 'telescope.builtin'.resume {} end, opts)  -- resume last telescope search
