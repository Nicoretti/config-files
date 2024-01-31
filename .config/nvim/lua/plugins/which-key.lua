local M = { "folke/which-key.nvim" }

function M.init()
    local bind = vim.keymap.set
    bind('n', '<leader>w', ":WhichKey<CR>")
    bind('i', '<F12>', ":WhichKey<CR>")
    vim.o.timeout = true
    vim.o.timeoutlen = 300
end

M.event = "VeryLazy"
M.opts = {}

return M
