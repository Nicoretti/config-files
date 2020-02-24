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
if executable('rg')
    set grepprg=rg
endif

" Activate mouse support
set mouse=a

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

