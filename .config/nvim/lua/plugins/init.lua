return { 
	-- Nerdtree & git
	"plugins/nerdtree",
	"Xuyuanp/nerdtree-git-plugin",
	"tpope/vim-fugitive",
	"vim-airline/vim-airline",
	{ "junegunn/fzf", run= function() vim.fn['fzf#install']() end },
	"junegunn/fzf.vim",
	-- Color schemes
	"junegunn/seoul256.vim",
	 
}
