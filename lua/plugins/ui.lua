return {
--     {
--         'morhetz/gruvbox',
--         config = function()
--             vim.g.gruvbox_contrast_dark = "hard"
--             vim.g.gruvbox_italic = true
--             vim.cmd([[colorscheme gruvbox]])
--         end
--     },
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
            vim.cmd([[colorscheme solarized-osaka-storm]])
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                section_separators = { left = '', right = ''},
            }
        }
    }
}
