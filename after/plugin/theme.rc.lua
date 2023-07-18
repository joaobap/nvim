local status = pcall(require, "monokai")
if (not status) then return end

vim.cmd[[colorscheme monokai_pro]]

