return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
    },
    {
        'f-person/auto-dark-mode.nvim',
        config = {
            update_interval = 1000,
            set_dark_mode = function()
                vim.api.nvim_set_option("background", "dark")
                vim.cmd("colorscheme catppuccin")
            end,
            set_light_mode = function()
                vim.api.nvim_set_option("background", "light")
                vim.cmd("colorscheme catppuccin")
            end,
        },
    },
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                section_separators = { left = '', right = ''},
            }
        }
    },
}

