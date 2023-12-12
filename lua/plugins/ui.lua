return {
    {
        'dracula/vim',
        as = 'dracula',
        config = function()
--            vim.cmd([[colorscheme dracula]])
        end
    },
    {
        'craftzdog/solarized-osaka.nvim',
        config = function()
            vim.cmd([[colorscheme solarized-osaka-night]])
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                section_separators = { left = '', right = ''},
            }
        }
    },
    'nvim-tree/nvim-web-devicons'
}
