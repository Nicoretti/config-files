" " Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rust-analyzer'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'python3': ['/usr/local/bin/pyls'],
    \ }

nnoremap <Leader><SPACE> :call LanguageClient_contextMenu()<CR>
nnoremap <Leader>f :call LanguageClient#textDocument_formatting()<CR>
nnoremap <Leader>d :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <Leader>r :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <Leader>i :call LanguageClient#textDocument_hover()<CR>

let g:deoplete#enable_at_startup = 1

call deoplete#custom#source('LanguageClient',
            \ 'min_pattern_length',
            \ 2)
