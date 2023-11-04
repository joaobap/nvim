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

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')

