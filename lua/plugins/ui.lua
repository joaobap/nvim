return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        config = function()
            vim.cmd([[colorscheme catppuccin-mocha]])
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
        }
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },
}

