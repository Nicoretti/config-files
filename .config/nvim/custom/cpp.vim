" set UUID case to upper
let g:nuuid_case = "upper"
" set no mappings so we can customize ours
let g:nuuid_no_mappings = 1
function! GenIncludeGuard()
    let guard  = join(["INCLUDE_GUARD", substitute(NuuidNewUuid(), '-', '_', 'g')], "_")
    let ifndef = join(["#ifndef",   guard], " ")
    let define = join(["#define",   guard], " ")
    let endif  = join(["#endif //", guard], " ")
    " Extra empty strings included here to insert another newline before the endif
    return join([ifndef, define, "", "", "", endif], "\n")
endfunction

nnoremap <leader>u i<C-R>=GenIncludeGuard()<CR><Esc>

