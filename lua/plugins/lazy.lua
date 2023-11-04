return {
    'wbthomason/packer.nvim',
    'Raimondi/delimitMate',
    'pangloss/vim-javascript',
    'HerringtonDarkholme/yats.vim',
    'rust-lang/rust.vim',
    {
        'morhetz/gruvbox',
        config = function()
            vim.g.gruvbox_contrast_dark = "hard"
            vim.g.gruvbox_italic = true
            vim.cmd([[colorscheme gruvbox]])
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end
    },
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup()
        end
    }
}
