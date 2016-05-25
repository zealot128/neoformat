function! neoformat#formatters#c#enabled()
   return ['uncrustify', 'clangformat', 'astyle']
endfunction

function! neoformat#formatters#c#uncrustify()
    return {
           \ 'exe': 'uncrustify',
           \ 'args': ['-q', '-l C', '-f']
           \ }
endfunction

function! neoformat#formatters#c#clangformat()
    return {'exe': 'clang-format'}
endfunction

function! neoformat#formatters#c#astyle()
    return {
            \ 'exe': 'astyle',
            \ 'args': ['--mode=c'],
            \ 'replace': 1
            \ }
endfunction
