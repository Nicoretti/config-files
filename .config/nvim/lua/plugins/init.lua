local plugins = {
    'plugins/git',
    'plugins/nerdtree',
    'plugins/nerdtree-git',
    'plugins/status-line',
    'plugins/seoul256',
    'plugins/fuzzy-search',
    'plugins/fzf-vim',
}

local load_plugins = function(plugins) 
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

return load_plugins(plugins)
