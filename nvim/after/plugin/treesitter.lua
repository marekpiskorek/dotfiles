require("nvim-treesitter.configs").setup {
  -- Commented out because of every start caused some noise
  -- ensure_installed = { "lua", "go", "typescript", "graphql", "python" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
}
