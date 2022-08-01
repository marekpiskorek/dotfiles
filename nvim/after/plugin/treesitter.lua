require("nvim-treesitter.configs").setup {
    ensure_installed = {"lua", "python", "go"},
    auto_instann = true,
    highlight = {enable = true},
}
