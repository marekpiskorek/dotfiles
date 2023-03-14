-- Every LSP server we want to have autoformatting for needs to be listed here.
-- For sanity purposes this list is in the same order as the one in lua/marek/lsp.lua
-- require "lspconfig".tsserver.setup { on_attach = on_attach } -- commented out as the formatting rules differ from the ones on repo
require "lspconfig".dockerls.setup { on_attach = on_attach }
require "lspconfig".gopls.setup { on_attach = on_attach }
require "lspconfig".html.setup { on_attach = on_attach }
require "lspconfig".jsonls.setup { on_attach = on_attach }
require "lspconfig".sqls.setup { on_attach = on_attach }
require "lspconfig".lua_ls.setup { on_attach = on_attach }
