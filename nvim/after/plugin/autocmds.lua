local api = vim.api

local yankGroup = api.nvim_create_augroup("YankHighlight", { clear = true })
-- highlight on yank
api.nvim_create_autocmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank({ timeout = 500 })", group = yankGroup
})
