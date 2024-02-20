return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {
            view = {
                width = 50,
            },
            filters = {
                dotfiles = true,
            },
        }
            vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<cr>')
    end,
}
