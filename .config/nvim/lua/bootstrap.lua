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


local function _log(level, msg) 
    print(level .. ": " .. msg)
end


-- make logging globaly available
log = {
    debug = function(msg, level) _log("DEBUG", msg) end,
    info = function(msg, level) _log("INFO", msg) end,
    warning = function(msg, level) _log("WARNING", msg) end,
    error = function(msg, level) _log("ERROR", msg) end,
}



local _load = function(packages) 
    local modules = {}
    for _, name in ipairs(packages) do
        ok, module = pcall(require, name)
        if not ok then
            log.warning("Error while loading " .. "'" .. name .. "'")
        else
            table.insert(modules, module)
        end
    end
    return modules
end

local stage0 = {
    load = load_
}

return stage0
