local on_attach = function(_, _)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
        vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    end

    return {
        {
            'williamboman/mason.nvim',
            opts = {},
        },
        {
            'williamboman/mason-lspconfig.nvim',
            dependencies = { 'williamboman/mason.nvim' },
            opts = {
                ensure_installed = {
                    'tsserver',
                    'pyright',
                    'rust_analyzer',
                    'lua_ls',
                },
                automatic_installation = true,
            }
        },
        {
            'neovim/nvim-lspconfig',
             config = function()
                vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, {
                    virtual_text = {
                        spacing = 4
                    },
                    signs = true,
                    update_in_insert = false,
                    float = {
                        prefix = function(diagnostic, i, total)
                            return "["..diagnostic.user_data.lsp.code.."] "
                        end
                    },
                })

                -- Servers
                local lspconfig = require('lspconfig')
                local capabilities = require('cmp_nvim_lsp').default_capabilities()

                lspconfig['tsserver'].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript' }
                })
                lspconfig['pyright'].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                })
                lspconfig['rust_analyzer'].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = {
                        ['rust-analyzers'] = {}
                    }
                })
            end,
        },
        {
            'hrsh7th/nvim-cmp',
            dependencies = { 'hrsh7th/cmp-nvim-lsp' },
            config = function()
                local cmp = require('cmp')
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true
                    }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                }),
            })
        end,
    }
}
