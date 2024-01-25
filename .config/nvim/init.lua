local ok, util = pcall(require, 'util')

if not ok then
    local msg = 'lua/util.lua not found.'
    vim.notify(msg, vim.log.levels.ERROR)
    return
end

util.load_module('config.abbreviations')
util.load_module('config.autocmds')
util.load_module('config.keymaps')
util.load_module('config.options')
util.load_module('plugin-manager')
