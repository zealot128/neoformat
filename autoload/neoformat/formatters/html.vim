function! neoformat#formatters#html#enabled()
    return ['htmlbeautify', 'tidy', 'prettydiff']
endfunction

function! neoformat#formatters#html#tidy()
    return {
        \ 'exe': 'tidy',
        \ 'args': ['-quiet',
        \          '--indent auto',
        \          '--indent-spaces 4',
        \          '--vertical-space yes',
        \          '--tidy-mark no'
        \         ]
        \ }
endfunction

function! neoformat#formatters#html#htmlbeautify()
    return {'exe': 'html-beautify'}
endfunction

function! neoformat#formatters#html#prettydiff()
    return {
        \ 'exe': 'prettydiff',
        \ 'args': ['mode:"beautify"',
                 \ 'lang:"html"',
                 \ 'readmethod:"filescreen"',
                 \ 'endquietly:"quiet"',
                 \ 'source:"%:p"'],
        \ 'no_append': 1
        \ }
endfunction
