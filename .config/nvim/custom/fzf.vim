" Open FZF (Fuzzy File Search)
nnoremap <Leader>p :FZF -m<CR>
nnoremap <Leader>fg :Rg <C-r><C-w><CR>
nnoremap <Leader>fb :Buffers<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Using floating windows of Neovim to start fzf
if has('nvim-0.4.0')
  let $FZF_DEFAULT_OPTS .= '--color=bg:#20242C --border --layout=reverse'
  function! FloatingFZF()
    let width = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
      \ 'row': (&lines - height) / 2,
      \ 'col': (&columns - width) / 2,
      \ 'width': width,
      \ 'height': height,
      \ 'style': 'minimal'
      \}
    let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:TabLine')
  endfunction
  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif
