return {
    { 'williamboman/mason.nvim', opts = {} },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim' },
        opts = {
            ensure_installed = {
                'ts_ls',
                'lua_ls',
                'eslint'
            },
            automatic_installation = true,
        }
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
            })

            vim.lsp.config('ts_ls', {
                filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript' }
            })
            vim.lsp.config('eslint', {})
            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            })

            vim.lsp.enable('tsserver')
            vim.lsp.enable('eslint')
            vim.lsp.enable('lua_ls')
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
                    ['<C-s>'] = cmp.mapping.complete(),
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
