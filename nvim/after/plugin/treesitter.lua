require("nvim-treesitter.configs").setup {
  ensure_installed = { "lua", "python", "go", "typescript", "graphql" },
  auto_instann = true,
  highlight = { enable = true },
}
