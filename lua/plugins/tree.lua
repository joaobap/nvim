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

return {
    {
        'nvim-tree/nvim-tree.lua',
        config = function()
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
        end,
        keys = {
            { "<leader>t", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
        },
    }
}

