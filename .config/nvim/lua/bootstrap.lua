-- Logging --
local function _log(level, msg) 
    print(level .. ": " .. msg)
end

-- Make logging globaly available
log = {
    debug = function(msg, level) _log("Debug", msg) end,
    info = function(msg, level) _log("Info", msg) end,
    warning = function(msg, level) _log("Warning", msg) end,
    error = function(msg, level) _log("Error", msg) end,
}


-- Make sure lazy.nvim is available
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local _load_module = function(name)
    ok, module = pcall(require, name)
    if not ok then
        log.warning("Error while loading " .. "'" .. name .. "'")
        return nil
    end
    return module
end


local _load_modules = function(modules) 
    local m = {}
    for _, name in ipairs(modules) do
        module = _load_module(name)
        if module ~= nil then
            table.insert(m, module)
        end
    end
    return m
end

local _load_plugins = function(plugins) 
    local modules = {}
    for _, name in ipairs(plugins) do
        ok, module = pcall(require, name)
        if not ok then
            log.warning("Error while loading " .. "'" .. name .. "'")
        else
            table.insert(modules, module)
        end
    end
    return modules
end


local _init = function(plugins)
    -- make sure leader is defined before any mappings are done
    vim.g.mapleader = ","
    -- load/initalize all modules
    local modules = {
        plugins = _load_plugins(plugins),
        keymaps = _load_module("config/keymaps"),
        options = _load_module("config/options"),
        autocmds = _load_module("config/autocmds"),
        abbrevisations = _load_module("config/abbreviations"),
    }
    -- initalize lazy
    lazy = require("lazy").setup(modules.plugins)
end

local _post = function()
    _load_module('lualine').setup()
    vim.opt.colorcolumn = "100"
    vim.cmd.colorscheme("seoul256")
end

local config = {
    init = function(plugins)
        _init(plugins)
        _post()
    end,
}

return config
