vim.g.mapleader = ','
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.clipboard = 'unnamedplus'
vim.opt.shell = 'fish'
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.signcolumn = 'yes'
vim.keymap.set('i', 'jk', '<esc>')

vim.cmd('color sorbet')

vim.pack.add({
    { src = 'https://github.com/ruanyl/vim-gh-line' },
    { src = 'https://github.com/tpope/vim-fugitive' },
    { src = 'https://github.com/lewis6991/gitsigns.nvim' },
    { src = 'https://github.com/echasnovski/mini.ai' },
    { src = 'https://github.com/echasnovski/mini.pairs' },
    { src = 'https://github.com/williamboman/mason.nvim' }, -- dependency of: mason-lspconfig.nvim
    { src = 'https://github.com/williamboman/mason-lspconfig.nvim' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/hrsh7th/cmp-nvim-lsp' }, -- dependency of: nvim-cmp
    { src = 'https://github.com/hrsh7th/nvim-cmp' },
    { src = 'https://github.com/nvim-lua/plenary.nvim' }, -- dependency of: telescope
    { src = 'https://github.com/BurntSushi/ripgrep' }, -- dependency of: telescope
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' }, -- dependency of: telescope
    { src = 'https://github.com/nvim-telescope/telescope.nvim' },
    { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
    { src = 'https://github.com/folke/trouble.nvim' },
})

require('joao.utils').setup()
require('joao.telescope').setup()
require('joao.lsp').setup()
require('joao.tree').setup()

