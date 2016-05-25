function! neoformat#formatters#d#enabled()
    return ['uncrustify', 'dfmt']
endfunction

function! neoformat#formatters#d#dfmt()
    return {
        \ 'exe': 'dfmt'
        \ }
endfunction

function! neoformat#formatters#d#uncrustify()
    return {
        \ 'exe': 'uncrustify',
        \ 'args': ['-q', '-l D', '-f']
        \ }
endfunction
