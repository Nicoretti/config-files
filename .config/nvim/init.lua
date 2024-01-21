function init()
    -- make sure plugin manager is available (lazy.nvim)
    local bootstrap = require("bootstrap")
end

function conf()
    -- make sure leader is defined before any mappings are done
    vim.g.mapleader = ","
    
    -- load/initalize all modules
    local modules = {
        plugins = require("plugins/init"),
        keymaps = require("config/keymaps"),
        options = require("config/options"),
        autocmds = require("config/autocmds"),
        abbrevisations = require("config/abbreviations"),
    }
    -- initalize lazy
    lazy = require("lazy").setup(modules.plugins)
end

function post()
    require('lualine').setup()
    vim.cmd.colorscheme("seoul256")
end

init()
conf()
post()
