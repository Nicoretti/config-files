local M = {}

local _load_module = function(name)
    ok, module = pcall(require, name)
    if not ok then
        msg = "Error while loading " .. "'" .. name .. "'"
        vim.notify(msg, vim.log.levels.ERROR)
        return nil
    end
    return module
end

M.load_module = _load_module

return M
