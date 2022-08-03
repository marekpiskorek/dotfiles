-- Setup nvim-cmp.
local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<TAB>"] = cmp.mapping.confirm({ select = true }),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),

    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            return vim_item
        end,
    },
    sources = {
        { name = "nvim_lsp" },
    }
})

local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = function()
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
            -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
            -- vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end)
            vim.keymap.set("n", "<Leader>vca", function() vim.lsp.buf.code_action() end) -- for some reason the leader here is not being properly identified, thus those doesn't work. It's not the case for e.g. Harpoon / Telescope keybindings
            vim.keymap.set("n", "<Leader>vrr", function() vim.lsp.buf.references() end)
            vim.keymap.set("n", "<Leader>vrn", function() vim.lsp.buf.rename() end)
            vim.keymap.set("n", "H", function() vim.lsp.buf.signature_help() end)
        end,
    }, _config or {})
end

-- Setup the language servers
require("lspconfig").tsserver.setup(config())
require("lspconfig").dockerls.setup(config())
require("lspconfig").gopls.setup(config({
    cmd = { "gopls", "serve" },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}))
require("lspconfig").html.setup(config())
require("lspconfig").jsonls.setup(config())
require("lspconfig").pyright.setup(config())
require("lspconfig").rust_analyzer.setup(config())
require("lspconfig").sqls.setup(config())
require("lspconfig").sumneko_lua.setup(config())
