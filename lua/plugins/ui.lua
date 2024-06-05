return {
    {
        "f-person/auto-dark-mode.nvim",
        dependencies = { 'folke/tokyonight.nvim' },
        config = {
            update_interval = 1000,
            set_dark_mode = function()
                vim.cmd([[colorscheme tokyonight-moon]])
            end,
            set_light_mode = function()
                vim.cmd([[colorscheme tokyonight-day]])
            end,
        },
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {}
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },
}

