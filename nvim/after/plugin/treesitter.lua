require("nvim-treesitter.configs").setup {
  ensure_installed = { "lua", "python", "go", "typescript", "graphql" },
  auto_install = true,
  highlight = {
        enable = true,
        additional_vim_regex_highlighting = true
    },
}
