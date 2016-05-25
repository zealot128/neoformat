function! neoformat#formatters#csv#enabled()
   return ['prettydiff']
endfunction

function! neoformat#formatters#csv#prettydiff()
    return {
            \ 'exe': 'prettydiff',
            \ 'args': ['mode:"beautify"',
                     \ 'lang:"csv"',
                     \ 'readmethod:"filescreen"',
                     \ 'endquietly:"quiet"',
                     \ 'source:"%:p"'],
            \ 'no_append': 1
            \ }
endfunction
