function! neoformat#formatters#haskell#enabled() abort
    return ['hindent', 'stylishhaskell']
endfunction

function! neoformat#formatters#haskell#hindent() abort
    return {
        \ 'exe' : 'hindent',
        \ 'args': ['--indent-size ' . shiftwidth(), '--line-length 80'],
        \ 'stdin' : 1,
        \ }
endfunction

function! neoformat#formatters#haskell#stylishhaskell() abort
    return {
        \ 'exe': 'stylish-haskell',
        \ 'args': ['2>/dev/null'],
        \ 'stdin': 1,
        \ }
endfunction
