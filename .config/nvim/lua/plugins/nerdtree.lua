local M = { 'preservim/nerdtree' }

M.dependencies = {
    { "Xuyuanp/nerdtree-git-plugin" }
}

vim.keymap.set("n", "<leader>n", ":NERDTreeToggle<CR>", { noremap = true })

return M
