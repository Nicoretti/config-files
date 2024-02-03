vim.g.mapleader = ","
-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Normal Mode >>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 
-- Convert to hex view
vim.keymap.set("n", "<leader>X", ":%!xxd<CR>", {noremap=true, desc="Switch to Hex-Mode"})
-- Convert to normal view
vim.keymap.set("n", "<leader>x", ":%!xxd -r<CR>", {noremap=true, desc="Switch to Text-Mode"})
-- toggle binary mode
vim.keymap.set("n", "<leader>b", ":set binary!<CR>", {noremap=true})

-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Insert Mode >>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 
vim.keymap.set("i", "jk", "<ESC>", {noremap=true})
vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", {noremap=true})


-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Visual Mode >>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 

