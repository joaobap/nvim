return {
    'rust-lang/rust.vim',
    'tpope/vim-fugitive',
    'ruanyl/vim-gh-line',
    { 'echasnovski/mini.ai', opts = {} },
    { 'echasnovski/mini.pairs', opts = {} },
    { 'lewis6991/gitsigns.nvim', opts = {} },
    {
        'craftzdog/solarized-osaka.nvim',
        opts  = {
            transparency = true
        }
    },
    {
        "f-person/auto-dark-mode.nvim",
        dependencies = { 'folke/tokyonight.nvim' },
        opts = {
            update_interval = 1000,
            set_dark_mode = function()
                vim.api.nvim_set_option_value("background", "dark", {})
                vim.cmd([[colorscheme retrobox]])
            end,
            set_light_mode = function()
                vim.api.nvim_set_option_value("background", "light", {})
                vim.cmd([[colorscheme retrobox]])
            end,
        },
    },
}
