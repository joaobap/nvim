return {
    setup = function ()
        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = {
                'ts_ls',
                'lua_ls',
                'eslint'
            },
            automatic_installation = true,
        })
        vim.diagnostic.config({ virtual_text = true })
        vim.lsp.config('ts_ls', { filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript' } })
        vim.lsp.config('eslint', {})
        vim.lsp.config('lua_ls', { settings = { Lua = { diagnostics = { globals = { "vim" } } } } })
        vim.lsp.enable('ts_ls')
        vim.lsp.enable('eslint')
        vim.lsp.enable('lua_ls')

        -- Auto completions
        local cmp = require('cmp')
        require('cmp').setup({
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

    end
}

