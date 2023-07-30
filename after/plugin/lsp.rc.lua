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
  }
)

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.flow.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript' },
}
lspconfig.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        ['rust-analyzer']  = {}
    }
}

