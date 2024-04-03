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
         opts = {
             options = {
                 section_separators = { left = '', right = ''},
             }
         }
    },
}

