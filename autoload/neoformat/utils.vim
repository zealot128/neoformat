function! neoformat#utils#log(msg) abort
    if !exists('g:neoformat_verbose')
        let g:neoformat_verbose = 0
    endif
    if &verbose || g:neoformat_verbose
        return neoformat#utils#msg(a:msg)
    endif
endfunction

function! neoformat#utils#warn(msg) abort
    echohl WarningMsg | call neoformat#utils#msg(a:msg) | echohl NONE
endfunction

function! neoformat#utils#msg(msg) abort
    if type(a:msg) != type('')
        let msg = string(a:msg)
    else
        let msg = a:msg
    endif
    echom 'Neoformat: ' . msg
endfunction
