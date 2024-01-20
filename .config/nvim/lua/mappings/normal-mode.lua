-- ** NERDTree **--
vim.keymap.set("n", "<leader>n", ":NERDTreeToggle<CR>", {noremap=true})

-- ** Built in HexEditor ** --
-- Convert to hex view
vim.keymap.set("n", "<leader>X", ":%!xxd<CR>", {noremap=true})
-- Convert to normal view
vim.keymap.set("n", "<leader>x", ":%!xxd -r<CR>", {noremap=true})
-- toggle binary mode
vim.keymap.set("n", "<leader>b", ":set binary!<CR>", {noremap=true})
