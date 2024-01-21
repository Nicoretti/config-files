-- Show the line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Smart indent after linebreak
vim.opt.smartindent = true

-- Set the number of spaces a tab stop use
vim.opt.tabstop = 4

-- More indentation stuff
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- No tabs (use the appropriate number of spaces for a tab)
vim.opt.expandtab = true

-- Activate mouse support
vim.opt.mouse = 'a'

-- Activate command line completion
vim.opt.wildmenu = true

-- Activate syntax-highlighting
vim.opt.syntax = "enable"

-- Highlight while typing search pattern
vim.opt.incsearch = true

-- Highlighting search
vim.opt.hlsearch = true

-- Background: Is a "light" or "dark" background used?
vim.opt.background = 'dark'

-- The error bell
vim.opt.errorbells = false

-- Allow "hidden" buffers
vim.opt.hidden = true

-- Status line
vim.opt.laststatus = 2

-- Show the column and row number of the ruler
vim.opt.ruler = true

-- Highlights the current cursor line
vim.opt.cursorline = true

-- Show mode of the cursor (color)
vim.opt.showmode = true

-- Show the active mode
vim.opt.showmode = true

-- Disable case-sensitivity for searches
vim.opt.ignorecase = true

-- Adjust how whitespace is shown if (list) is enabled
vim.opt.listchars = { eol='$', tab='^T', extends='>', precedes='<', space='.'}

