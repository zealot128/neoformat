function! neoformat#utils#log(string) abort
    if !exists('g:neoformat_verbose')
        let g:neoformat_verbose = 0
    endif
    if &verbose || g:neoformat_verbose
        echom 'Neoformat: ' . a:string
    endif
endfunction

function! neoformat#utils#warn(string) abort
    echohl WarningMsg | echom 'Neoformat: ' . a:string | echohl NONE
endfunction
