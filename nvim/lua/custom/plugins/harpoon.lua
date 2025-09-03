local harpoon = require 'harpoon'
harpoon:setup {
  settings = {
    save_on_toggle = true,
    save_on_change = true,
    enter_on_sendcmd = false,
    excluded_filetypes = { 'harpoon', 'toggleterm', 'TelescopePrompt' },
  },
}

vim.keymap.set('n', '<C-e>', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Open harpoon window' })
vim.keymap.set('n', '<leader>a', function()
  harpoon:list():add()
end, { desc = '[A]dd current file to harpoon' })

vim.keymap.set('n', '<leader>1', function()
  harpoon:list():select(1)
end, { desc = '[1] Select first harpoon file' })
vim.keymap.set('n', '<leader>2', function()
  harpoon:list():select(2)
end, { desc = '[2] Select second harpoon file' })
vim.keymap.set('n', '<leader>3', function()
  harpoon:list():select(3)
end, { desc = '[3] Select third harpoon file' })
vim.keymap.set('n', '<leader>4', function()
  harpoon:list():select(4)
end, { desc = '[4] Select fourth harpoon file' })

return {} -- to avoid the return value error
