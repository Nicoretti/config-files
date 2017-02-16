"=========================================================
" File:     init.vim
" Autor:    Nicola Coretti
" Contact:  nico.coretti@gmail.com
" Version:  0.1.0
"=========================================================
"
" TODO's:
" ======
" * Add build detection and automatically adjust makeprg
" * Add Syntastic for Syntax error detection
" * Add Plugin to switch between Header and Source File
" * Add Template Plugin
" * Add Suround Plugin
" * Add latest rust plugin
" * Add automation for header guard insertion

"=========================================================
" Plug (Plugin manager settings)
"=========================================================
call plug#begin('~/.local/share/nvim/plugged')
    " --- Color Scheme's ---
    Plug 'junegunn/seoul256.vim'
    Plug 'https://github.com/vim-scripts/Guardian.git'
    Plug 'https://github.com/vim-scripts/Distinguished.git'
    Plug 'https://github.com/vim-scripts/Solarized.git'
    Plug 'https://github.com/vim-scripts/autoSolarize.git'
    Plug 'https://github.com/vim-scripts/Railscasts-Theme-GUIand256color.git'
    Plug 'https://github.com/vim-scripts/jellybeans.vim.git'
    " --- Status line ---
    Plug 'bling/vim-airline'
    " --- Outline ---
    Plug 'Tagbar'
    " --- Rust ---
    Plug 'rust-lang/rust.vim'
    " -- Autocompletion / Code-Navigation ---
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'https://github.com/Valloric/YouCompleteMe.git', {'on': 'YcmCompleter' , 'do': './install.py --all'}
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    " LLVm support plugin (Syntax files for Table gen etc.)
     Plug 'https://github.com/llvm-mirror/llvm.git',  {'rtp': '/utils/vim'}
    " --- Git ---
    Plug 'https://github.com/tpope/vim-fugitive.git'
    Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'
    " --- Misc ---
    Plug 'tpope/vim-surround'
call plug#end()

"=========================================================
" Settings
"=========================================================
" change color scheme
colo seoul256
" set line lenght indicator
set colorcolumn=120

" Disable backup and swapfiles
set backupdir=~/.tmp
set nobackup
set noswapfile

" set up omni-completion
filetype plugin on
set ofu=syntaxcomplete#Complete

" adjust how whitespace is shown if (set list) is used
set listchars=eol:$,tab:^T,trail:^,extends:>,precedes:<

" setup faster grep
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
endif

" Activate command line completion
set wildmenu

" Activate syntax-highlighting
syntax enable

" Highlight while typing search pattern
set incsearch

" Highlighting search
 set hlsearch

" background: Is a "light" or "dark" background used?
 set background=dark

" The error bell
 set noerrorbells

" Allow "hidden" buffers
 set hidden

" Status line
 set laststatus=2

" Show the column an row number of the ruler
 set ruler

" Highlights the current cursor line
set cursorline

" Show mode of the cursor (color)
 set showmode

" customize the status line
 set statusline=Buffer[%n]\ File:%F%=ASCII-Value:hex(0x%02B),dez(%03b)\ Position:\ %l,%-4c\ --%P--

" show the linenumbers
 set number
 set relativenumber

" show the active mode
 set showmode

" disable case-sensitivity for searches
 set ignorecase

"look in the current directory for "tags", and work up the tree
"towards root until one is found.
set tags=tags;/

" smart ident safter linebreak
set smartindent

" set the number of spaces a tab stop use
 set tabstop=4

" more indention stuff
set shiftwidth=4
set softtabstop=4

" No tabs (use the appropriate number of spaces for a tab)
set expandtab

"=========================================================
" Abbreviations
"=========================================================
" TODO marker
iab Atd TODO NiCo:
" FIXME marker
iab Afix FIXME NiCo:
" INFO marker
iab Ainf INFO:

" Section separator
iab Asep =========================================================

" The lower letter alphabet
iab Aalpha abcdefghijklmnopqrstuvwxyz

" The upper letter alphabet
iab AALPHA ABCDEFGHIJKLMNOPQRSTUVWXYZ

" The ten digits
iab Adigit 1234567890

" Important constants
iab Api 3.1415926535897932384626433832795028841972
iab Ae 2.7182818284590452353602874713526624977573

"=========================================================
" Mappings
"=========================================================
" Refine leader
let mapleader = ","

"****************************************
" Normal-Mode Mappings
"****************************************
" Open .vimrc
nnoremap <Leader>v :vsplit $MYVIMRC<CR>
"set spell checking language to american english
nnoremap <Leader>e :set spell spelllang=en_us<CR>
"toggle highlighted search
nnoremap <Leader>h :set hlsearch!<CR>
" toggle use whitespaces insted of tabs
nnoremap <Leader>t :set expandtab!<CR>
" toggle show whitespace characters
nnoremap <Leader>w :set list! <CR>
" Toggle Tagbar
nnoremap <Leader>o :TagbarToggle<CR>
" grep for word under the cursor
nnoremap <Leader>g :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" clang format integration
 nnoremap <Leader>f :pyf /usr/local/share/clang/clang-format.py<cr>

" *******************
" - C/C++ Mappings  -
" *******************
nnoremap <Leader>u :r !header uuid<CR>
nnoremap <Leader>ug :r !header guard<CR>
nnoremap <Leader>uh :r !header template<CR>

" *******************
" - Quickfix Window -
" *******************
" open quickfix window
nnoremap <Leader>q :cope<CR>
" close quick fix window
nnoremap <Leader>qc :ccl<CR>
" move to next erorr
nnoremap <Leader>j :cnext<CR>
" move to previous erorr
nnoremap <Leader>k :cprevious<CR>
" move to error under the cursor
nnoremap <Leader>, :.cc<CR>

" **********************
" - HexEditor Settings -
" **********************
" Enable Hex-Editor-Mode
nnoremap <Leader>X :%!xxd <CR>
" Enable Hex-Editor-Mode
nnoremap <Leader>x :%!xxd -r <CR>
" toggle binary mode  (used to save files without newline)
nnoremap <Leader>b :set binary! <CR>

" ****************
" - YCM Settings -
" ****************
"let g:ycm_rust_src_path = '/usr/local/rust/rustc-1.5.0/src'
nnoremap <Leader>d :YcmCompleter GetDoc<CR>
nnoremap <Leader><enter> :YcmCompleter GoToInclude<CR>
nnoremap <Leader>T :YcmCompleter GetType<CR>

" ***********************
" - NerdTree  Settings -
" ***********************
" Toggle Nerd-Tree
nnoremap <Leader>n :NERDTreeToggle<CR>

" ******************************
" - Misc Normal Mode Settings -
" ******************************
" use enter to insert linebreak in normal mode
nnoremap <ENTER> A<CR><ESC>

" *****************
" - FZF  Settings -
" *****************
" Open FZF (Fuzzy File Search)
nnoremap <Leader>p :FZF<CR>

"*************************
" - Visual-Mode Mappings -
"*************************
" Soround selected visual block with ""
vnoremap <Leader>" ox<esc>i"<esc>pa"<esc>
" clang format integration
vnoremap <Leader>f :pyf /usr/local/share/clang/clang-format.py<cr>

"*************************
" - Checkfile           -
"*************************
nnoremap <leader>c :cexpr system('checkfile ' . shellescape(expand('%')))<cr>:copen <cr>
"*************************
" - Fixfile              -
"*************************
nnoremap <leader>F :!fixfile %<cr>

"*************************
" - Insert-Mode Mappings -
"*************************
" leave insert mode with the shortcut jk
inoremap jk <Esc>

"*************************
" - Rust-Settings        -
"*************************
let g:ycm_rust_src_path ='~/.multirust/toolchains/stable-x86_64-apple-darwin//lib/rustlib/src/rust'
let g:rustfmt_autosave = 1
autocmd BufRead *.rs :setlocal tags=rusty-tags.vi;/
autocmd BufWrite *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&"
