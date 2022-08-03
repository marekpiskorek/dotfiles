require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    side = "left",
    width = 70,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
    custom = { "^.git$" },
  },
})

vim.keymap.set("n", "<leader>e", ":NvimTreeFindFile<CR>")
