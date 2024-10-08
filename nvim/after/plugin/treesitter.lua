require("nvim-treesitter.configs").setup {
  -- Commented out because of every start caused some noise
  ensure_installed = { "lua", "go", "typescript", "python", "terraform", "markdown", "markdown_inline"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
}
