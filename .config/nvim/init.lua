local bootstrap = require("bootstrap")

vim.g.mapleader = ","

modules = {
    plugins = require("plugins/init"),
    keymaps = require("config/keymaps"),
    options = require("config/options"),
    autocmds = require("config/autocmds"),
    abbrevisations = require("config/abbreviations"),
}
lazy = require("lazy").setup(modules.plugins),

vim.cmd.colorscheme("seoul256")
--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
