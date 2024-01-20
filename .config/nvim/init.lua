local bootstrap = require("bootstrap")
local plugins = require("plugins/init")
local lazy = require("lazy").setup(plugins)
local mappings = require("mappings/init")

vim.cmd.colorscheme("seoul256")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
