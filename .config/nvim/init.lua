nvim = require("bootstrap")
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
