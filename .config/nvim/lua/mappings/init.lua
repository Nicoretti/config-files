vim.g.mapleader = ","
return { 
	require("mappings/normal-mode"),
	require("mappings/insert-mode"),
	require("mappings/visual-mode"),
}
