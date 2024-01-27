local M = { 'preservim/tagbar' }

vim.keymap.set("n", "<leader>o", ":TagbarToggle<CR>", { noremap = true })

return M
