vim.api.nvim_set_option_value("background", "dark", {})
vim.cmd([[colorscheme retrobox]])

return {
    'rust-lang/rust.vim',
    'tpope/vim-fugitive',
    'ruanyl/vim-gh-line',
    { 'echasnovski/mini.ai', opts = {} },
    { 'echasnovski/mini.pairs', opts = {} },
    { 'lewis6991/gitsigns.nvim', opts = {} },
    { 'xiyaowong/transparent.nvim' },
}
