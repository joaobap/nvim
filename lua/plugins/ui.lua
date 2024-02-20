return {
    {
        "f-person/auto-dark-mode.nvim",
        dependencies = 'catppuccin/nvim',
        config = {
          update_interval = 100,
          set_dark_mode = function()
            vim.api.nvim_set_option("background", "dark")
            vim.cmd([[colorscheme catppuccin-mocha]])
          end,
          set_light_mode = function()
            vim.api.nvim_set_option("background", "light")
            vim.cmd([[colorscheme catppuccin-latte]])
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
