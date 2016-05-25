function! neoformat#formatters#xhtml#enabled()
   return ['tidy', 'prettydiff']
endfunction

function! neoformat#formatters#xhtml#tidy()
    return {
            \ 'exe': 'tidy',
            \ 'args': ['-quiet',
            \          '-asxhtml',
            \          '--indent auto',
            \          '--indent-spaces 4',
            \          '--vertical-space yes',
            \          '--tidy-mark no'
            \         ]
            \ }
endfunction

function! neoformat#formatters#xhtml#prettydiff()
    return neoformat#formatters#html#prettydiff()
endfunction
