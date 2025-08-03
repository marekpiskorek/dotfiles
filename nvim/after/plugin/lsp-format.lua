vim.lsp.enable("dockerls")
vim.lsp.enable("gopls")
vim.lsp.enable("html")
vim.lsp.enable("jsonls")
vim.lsp.enable("sqlls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("terraformls")
vim.lsp.enable("lemminx")
vim.lsp.enable({ "ruff" })
vim.lsp.config.pyright = {
	cmd = { "pyright-langserver", "--stdio" },
}
vim.lsp.enable({ "pyright" })
