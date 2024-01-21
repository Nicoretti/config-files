local bootstrap = require("bootstrap")

vim.g.mapleader = ","
local plugins = require("plugins/init")
local keymaps = require("config/keymaps")
local options = require("config/options")
local autocmds = require("config/autocmds")
local abbrevisations = require("config/abbreviations")
local lazy = require("lazy").setup(plugins)

vim.cmd.colorscheme("seoul256")
--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
