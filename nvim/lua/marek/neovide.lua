if vim.g.neovide then
    -- colors and font
    vim.cmd("colorscheme gruvbox")
    vim.o.background = "light"
    vim.o.guifont = "Iosevka Nerd Font:h14"
    -- padding and fullscreen
    vim.g.neovide_padding_top = 1
    vim.g.neovide_padding_bottom = 1
    vim.g.neovide_padding_right = 1
    vim.g.neovide_padding_left = 1
    vim.g.neovide_fullscreen = true
    -- disable cursor animation
    vim.g.neovide_cursor_animation_length = 0.00
    -- add copying and pasting
    -- vim.keymap.set('v', '<D-c>', '"+y')    -- Copy
    vim.keymap.set('n', '<D-v>', '"+P')    -- Paste normal mode
    vim.keymap.set('v', '<D-v>', '"+P')    -- Paste visual mode
    vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
    vim.keymap.set('i', '<D-v>', '<C-R>+') -- Paste insert mode
end
