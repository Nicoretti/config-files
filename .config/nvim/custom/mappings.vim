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
nnoremap <Leader>g :grep! <cword> <CR>:cw<CR>
" clang format integration
 nnoremap <Leader>f :pyf /usr/local/share/clang/clang-format.py<cr>

" *******************
" - Quickfix Window -
" *******************
" open quickfix window
nnoremap <Leader>q :cope<CR>
" close quick fix window
nnoremap <Leader>Q :ccl<CR>
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


"*************************
" - Visual-Mode Mappings -
"*************************
" Soround selected visual block with ""
vnoremap <Leader>" ox<esc>i"<esc>pa"<esc>
" clang format integration
nnoremap <Leader>f :Autoformat<cr>

"*************************
" - Checkfile           -
"*************************
nnoremap <leader>c :cexpr system('checkfile ' . shellescape(expand('%')))<cr>:copen <cr>
"*************************
" - Fixfile              -
"*************************
nnoremap <leader>F :% !trailing<cr>

"*************************
" - Insert-Mode Mappings -
"*************************
" leave insert mode with the shortcut jk
inoremap jk <Esc>
