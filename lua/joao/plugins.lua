local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'Raimondi/delimitMate'
    use 'pangloss/vim-javascript'
    use 'HerringtonDarkholme/yats.vim'
    use 'rust-lang/rust.vim'
    use { 'dracula/vim', as = 'dracula' }
    use {'neoclide/coc.nvim', branch = 'release'}
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.2', requires = { {'nvim-lua/plenary.nvim'} } }
end)

vim.cmd [[colorscheme dracula]]
