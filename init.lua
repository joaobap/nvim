vim.g.mapleader = ','

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
vim.opt.relativenumber = true
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.termguicolors = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.shell = 'fish'
vim.opt.completeopt = "menuone,noinsert,noselect"

vim.keymap.set('i', 'jk', '<esc>')

vim.g.delimitMate_expand_cr = true

require('joao.plugins')

