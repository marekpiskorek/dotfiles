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


-- api.nvim_set_hl(0, "LspReferenceText", { fg = "#111111", bg = "#333333" })
-- api.nvim_set_hl(0, "LspReferenceRead", { fg = "#111111", bg = "#333333" })
-- api.nvim_set_hl(0, "LspReferenceWrite", { fg = "#111111", bg = "#333333" })

-- local cursorGroup = api.nvim_create_augroup("HighlighCursor", { clear = true })
-- api.nvim_create_autocmd("CursorHold", { command = "silent! lua vim.lsp.buf.document_highlight()", group = cursorGroup })
-- api.nvim_create_autocmd("CursorHoldI", { command = "silent! lua vim.lsp.buf.document_highlight()", group = cursorGroup })
-- api.nvim_create_autocmd("CursorMoved", { command = "silent! lua vim.lsp.buf.clear_references()", group = cursorGroup })
