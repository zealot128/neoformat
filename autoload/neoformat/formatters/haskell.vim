function! neoformat#formatters#haskell#enabled() abort
    return ['stylishhaskell']
endfunction

function! neoformat#formatters#haskell#stylishhaskell() abort
    return {
        \ 'exe': 'stylish-haskell',
        \ 'stdin': 1,
        \ 'filter': '2>/dev/null',
        \ }
endfunction
