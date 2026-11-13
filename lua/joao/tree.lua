return {
    setup = function()
        require('mini.icons').setup({
            style = 'ascii'
        })

        local minifiles = require('mini.files')
        minifiles.setup()
        vim.keymap.set('n', '<leader>t', minifiles.open, nil)

        -- set transparent bg on floats
        vim.api.nvim_set_hl(0, "NormalFloat", { bg="" })
    end
}

