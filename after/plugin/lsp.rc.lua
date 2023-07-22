require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'tsserver',
        'pyright',
        'rust_analyzer',
        'lua_ls'
    },
    automatic_installation = true,
})

local on_attach = function(_, _)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end


local lspconfig = require('lspconfig')

lspconfig.tsserver.setup {
    on_attach = on_attach,
}
lspconfig.pyright.setup {
    on_attach = on_attach,
}
lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    settings = {
        ['rust-analyzer']  = {}
    }
}
