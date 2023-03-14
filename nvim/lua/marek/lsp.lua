-- Setup nvim-cmp.
local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<TAB>"] = cmp.mapping.confirm({ select = true }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
  }),
})

-- Setup the language servers
require("lspconfig").tsserver.setup({})
require("lspconfig").dockerls.setup({})
require("lspconfig").html.setup({})
require("lspconfig").jsonls.setup({})
require("lspconfig").pyright.setup({})
require("lspconfig").rust_analyzer.setup({})
require("lspconfig").sqls.setup({})
require("lspconfig").lua_ls.setup({})
require("lspconfig").terraformls.setup {}
require("lspconfig").tflint.setup {}


-- This snippet is copied from Bernardo's dotfiles.
require("lspconfig").gopls.setup({
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod" },
  settings = {
    gopls = {
      ["local"] = "samsaradev.io",
      usePlaceholders = true,
      memoryMode = "DegradeClosed",
    },
  },
})
