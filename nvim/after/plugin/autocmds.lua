local api = vim.api

local yankGroup = api.nvim_create_augroup("YankHighlight", { clear = true })
-- highlight on yank
api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank({ timeout = 500 })", group = yankGroup
})

-- Understanding the terraform filetypes
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])

-- autosave and align setting files
vim.cmd([[let g:terraform_fmt_on_save=1]])
vim.cmd([[let g:terraform_align=1]])

-- custom commands
-- Fixme: this doesn't need to be the total path starting with /
api.nvim_create_user_command("CopyRelPath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

api.nvim_create_user_command(
  'Notes',
  function()
    require('telescope.builtin').find_files({ cwd = "~/Documents/personal-notes" })
  end,
  {}
)
api.nvim_create_user_command(
  'NotesFuzzyFind',
  function()
    require('telescope.builtin').live_grep({ cwd = "~/Documents/personal-notes" })
  end,
  {}
)
