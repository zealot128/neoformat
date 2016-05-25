function! neoformat#formatters#css#enabled()
    return ['cssbeautify', 'csscomb', 'prettydiff']
endfunction

function! neoformat#formatters#css#cssbeautify()
    return { 'exe': 'css-beautify' }
endfunction

function! neoformat#formatters#css#csscomb()
    return {
            \ 'exe': 'csscomb',
            \ 'replace': 1
            \ }
endfunction

function! neoformat#formatters#css#prettydiff()
    return {
            \ 'exe': 'prettydiff',
            \ 'args': ['mode:"beautify"',
                     \ 'lang:"css"',
                     \ 'readmethod:"filescreen"',
                     \ 'endquietly:"quiet"',
                     \ 'source:"%:p"'],
            \ 'no_append': 1
            \ }
endfunction
