require("lsp-format").setup {}

local on_attach = require "lsp-format".on_attach
-- Every LSP server we want to have autoformatting for needs to be listed here.
-- For sanity purposes this list is in the same order as the one in lua/marek/lsp.lua
require "lspconfig".tsserver.setup { on_attach = on_attach }
require "lspconfig".dockerls.setup { on_attach = on_attach }
require "lspconfig".gopls.setup { on_attach = on_attach }
require "lspconfig".html.setup { on_attach = on_attach }
require "lspconfig".jsonls.setup { on_attach = on_attach }
require "lspconfig".rust_analyzer.setup { on_attach = on_attach }
require "lspconfig".sqls.setup { on_attach = on_attach }
require "lspconfig".sumneko_lua.setup { on_attach = on_attach }

-- EFM setup for not supported LSPs
require "lspconfig".efm.setup {
    cmd = { "efm-langserver" },
    on_attach = on_attach,
    init_options = { documentFormatting = true },
    root_dir = vim.loop.cwd,
    settings = {
        rootMarkers = { ".git/" },
        lintDebounce = 100,
        languages = {
            python = {
                formatCommand = "black --fast -",
                formatStdin = true,
            }, {
                formatCommand = "isort --stdout --profile black -",
                formatStdin = true,
            },
            {
                lintCommand = "flake8 --max-line-length 160 --format '%(path)s:%(row)d:%(col)d: %(code)s %(code)s %(text)s' --stdin-display-name ${INPUT} -",
                lintStdin = true,
                lintIgnoreExitCode = true,
                lintFormats = { "%f:%l:%c: %t%n%n%n %m" },
                lintSource = "flake8",
            },
        },
    },
}
