require("lsp-format").setup {}
require "lspconfig".tsserver.setup { on_attach = require "lsp-format".on_attach }
require "lspconfig".dockerls.setup { on_attach = require "lsp-format".on_attach }
require "lspconfig".gopls.setup { on_attach = require "lsp-format".on_attach }
require "lspconfig".html.setup { on_attach = require "lsp-format".on_attach }
require "lspconfig".jsonls.setup { on_attach = require "lsp-format".on_attach }
require "lspconfig".pyright.setup { on_attach = require "lsp-format".on_attach }
require "lspconfig".rust_analyzer.setup { on_attach = require "lsp-format".on_attach }
require "lspconfig".sqls.setup { on_attach = require "lsp-format".on_attach }
require "lspconfig".sumneko_lua.setup { on_attach = require "lsp-format".on_attach }
