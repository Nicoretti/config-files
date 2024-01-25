local M = { 'nvim-lualine/lualine.nvim' }

M.dependencies = {
    'nvim-tree/nvim-web-devicons'
}

function M.config()
    local util = require('util')
    local lualine = util.load_module('lualine')
    lualine.setup()
end

return M
