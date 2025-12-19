return {
    setup = function()
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

    end
}

