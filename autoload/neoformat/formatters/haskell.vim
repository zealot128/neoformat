function! neoformat#formatters#haskell#enabled()
    return ['stylishhaskell']
endfunction

function! neoformat#formatters#haskell#stylishhaskell()
    return {
        \ 'exe': 'stylish-haskell'
        \ }
endfunction
