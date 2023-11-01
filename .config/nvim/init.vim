let g:powerline_loaded = 1
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
    " --- Nix ---
    Plug 'LnL7/vim-nix'
    " --- Just ---
    Plug 'NoahTheDuke/vim-just'
    " --- Caddy File Syntax Support --
    Plug 'isobit/vim-caddyfile'
    " -- Autocompletion / Code-Navigation ---
    Plug 'preservim/nerdtree'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
    " --- Git ---
    Plug 'https://github.com/tpope/vim-fugitive.git'
    Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'
    " --- Misc ---
    Plug 'tpope/vim-surround'
    if (executable("go"))
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
    endif
call plug#end()

" Refine leader
let mapleader = ","

runtime custom/settings.vim
runtime custom/abbrev.vim
runtime custom/mappings.vim
runtime custom/color.vim
runtime custom/fzf.vim
runtime custom/rust.vim
runtime custom/lang_server.vim
runtime custom/cpp.vim
