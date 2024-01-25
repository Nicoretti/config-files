local M = { 'AlexvZyl/nordic.nvim' }

M.lazy = false
M.priority = 1000

function M.config()
    local util = require('util')
    util.load_module('nordic').load()
end

return M
