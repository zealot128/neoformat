function! neoformat#formatters#pawn#enabled()
    return ['uncrustify']
endfunction

function! neoformat#formatters#pawn#uncrustify()
    return {
        \ 'exe': 'uncrustify',
        \ 'args': ['-q', '-l PAWN', '-f']
        \ }
endfunction

