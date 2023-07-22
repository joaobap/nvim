vim.g.coc_global_extensions = {
    'coc-pairs',
    'coc-tsserver',
    'coc-json',
    'coc-eslint',
    'coc-rust-analyzer'
}

vim.keymap.set('n', 'gd', '<Plug>(coc-definition)')
vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)')
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)')
vim.keymap.set('n', 'gr', '<Plug>(coc-references)')
