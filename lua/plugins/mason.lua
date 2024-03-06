local ensure_installed = {
    'tsserver',
    'rust_analyzer',
    'ruff_lsp',
    'lua_ls',
    'jsonls',
    'html',
    'cssls',
    'bashls',
    'terraformls',
    'dockerls'
}

require("fidget").setup({})
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = ensure_installed,
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end,
})

local wk = require('which-key')
wk.register({
    g = {
        name = "Go to",
        d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
        D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
        r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
        i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
    },
    K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    ["<leader>"] = {
        v = {
            name = "LSP",
            d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Open Diagnostics" },
            c = {
                name="Code Action",
                a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" }
            },
            r = {
                r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
                n = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
            },
            w = {
                s = { "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", "Workspace Symbols" },
            },
        }
    }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    view = {
        docs = {
            auto_open = true
        }
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
        { name = 'buffer' }
    }),
})

-- Set up lspconfig.
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities(client_capabilities)

local lua_langauge_support = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
}

for _, server in ipairs(ensure_installed) do
    if server == 'lua_ls' then
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        require('lspconfig')['lua_ls'].setup({
            capabilities = capabilities,
            settings = lua_langauge_support
        })
    else
        require('lspconfig')[server].setup({
            capabilities = capabilities
        })
    end
end

vim.diagnostic.config({
    update_in_insert = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = ""
    }
})

