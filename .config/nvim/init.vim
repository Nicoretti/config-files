"=========================================================
" Plug (Plugin manager settings)
"=========================================================
call plug#begin('~/.local/share/nvim/plugged')
    " --- Color Scheme's ---
    Plug 'junegunn/seoul256.vim'
    Plug 'https://github.com/vim-scripts/Solarized.git'
    Plug 'https://github.com/vim-scripts/jellybeans.vim.git'
    " --- Status line ---
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " --- Outline ---
    Plug 'majutsushi/tagbar'
    " --- Rust ---
    Plug 'rust-lang/rust.vim'
    " --- C/CPP ---
    Plug 'kburdett/vim-nuuid'
    " -- Autocompletion / Code-Navigation ---
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " --- Git ---
    Plug 'https://github.com/tpope/vim-fugitive.git'
    Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'
    " --- Misc ---
    Plug 'tpope/vim-surround'
call plug#end()

" Refine leader
let mapleader = ","

runtime custom/settings.vim
runtime custom/abbrev.vim
runtime custom/mappings.vim
runtime custom/color.vim
runtime custom/fzf.vim
runtime custom/cpp.vim
runtime custom/rust.vim
runtime custom/lang_server.vim
