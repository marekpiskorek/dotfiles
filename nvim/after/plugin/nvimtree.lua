require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        side = "left",
        width = 50,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
        custom = { "^.git$", "^__pycache__$" },
    },
})

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFindFile<CR>")
