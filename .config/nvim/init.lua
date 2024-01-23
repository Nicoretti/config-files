nvim = require("bootstrap")

--if version.minor <= 9:
local version_check = function()
    local _current_version = vim.version()
    local _required_version = { major = 0, minor = 9, patch = 0 }
    if not (_current_version.major >= _required_version.major and _current_version.minor >= _required_version.minor) then 
        error(string.format("This configuration requires Neovim version >= %d.%d.%d, but the used version is: %d.%d.%d",
            _required_version.major, _required_version.minor, _required_version.patch,
            _current_version.major, _current_version.minor, _current_version.patch
        ))
    end
end

-- make sure we execute a compatible version of nvim
version_check()



-- TODO: Consider replacing this in the future which actual code detecting plugin files
--       based on their location (/lua/plugins/*.lua).
local plugins = {
    'plugins/git',
    'plugins/nerdtree',
    'plugins/nerdtree-git',
    'plugins/status-line',
    'plugins/seoul256',
    'plugins/fuzzy-search',
    'plugins/fzf-vim',
}
nvim.init(plugins)
