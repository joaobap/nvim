return {
    {
        'morhetz/gruvbox',
        config = function()
            vim.g.gruvbox_contrast_dark = "hard"
            vim.g.gruvbox_italic = true
            vim.cmd([[colorscheme gruvbox]])
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        opts = {}
    }
}
