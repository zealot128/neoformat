function! neoformat#formatters#objc#enabled()
    return ['uncrustify', 'clangformat', 'astyle']
endfunction

function! neoformat#formatters#objc#uncrustify()
    return {
        \ 'exe': 'uncrustify',
        \ 'args': ['-q', '-l OC+', '-f']
        \ }
endfunction

function! neoformat#formatters#objc#clangformat()
    return neoformat#formatters#c#clangformat()
endfunction

function! neoformat#formatters#objc#astyle()
    return neoformat#formatters#c#astyle()
endfunction

