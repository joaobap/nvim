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


-- Plugins

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

-- Utilities
require('gitsigns').setup()
require('mini.ai').setup()
require('mini.pairs').setup()

local telescope = require('telescope')

telescope.setup({
    defaults = {
        path_display = { 'truncate' }
    },
    pickers = {
        lsp_references = {
            layout_strategy = "horizontal",
            show_line = false,
        }
    }
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, {})
vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, {})


telescope.setup()

-- LSP Config

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'ts_ls',
        'lua_ls',
        'eslint'
    },
    automatic_installation = true,
})
vim.diagnostic.config({ virtual_text = true })
vim.lsp.config('ts_ls', { filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript' } })
vim.lsp.config('eslint', {})
vim.lsp.config('lua_ls', { settings = { Lua = { diagnostics = { globals = { "vim" } } } } })
vim.lsp.enable('ts_ls')
vim.lsp.enable('eslint')
vim.lsp.enable('lua_ls')

-- Auto completions
local cmp = require('cmp')
require('cmp').setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-s>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    }),
})

-- nvim tree
local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5
local function open_nvim_tree(data)
    local directory = vim.fn.isdirectory(data.file) == 1
    if not directory then
        return
    end

    vim.cmd.cd(data.file)
    require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
require('nvim-tree').setup({
    hijack_netrw = true,
    disable_netrw = true,
    view = {
        float = {
            enable = true,
            open_win_config = function()
                local screen_w = vim.opt.columns:get()
                local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                local window_w = screen_w * WIDTH_RATIO
                local window_h = screen_h * HEIGHT_RATIO
                local window_w_int = math.floor(window_w)
                local window_h_int = math.floor(window_h)
                local center_x = (screen_w - window_w) / 2
                local center_y = ((vim.opt.lines:get() - window_h) / 2)
                - vim.opt.cmdheight:get()
                return {
                    border = 'rounded',
                    relative = 'editor',
                    row = center_y,
                    col = center_x,
                    width = window_w_int,
                    height = window_h_int,
                }
            end,
        },
    },
})

vim.keymap.set('n', "<leader>t", "<cmd>NvimTreeToggle<cr>", {})

