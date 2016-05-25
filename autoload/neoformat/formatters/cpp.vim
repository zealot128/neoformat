function! neoformat#formatters#cpp#enabled()
   return ['uncrustify', 'clangformat', 'astyle']
endfunction

function! neoformat#formatters#cpp#uncrustify()
    return {
           \ 'exe': 'uncrustify',
           \ 'args': ['-q', '-l CPP', '-f']
           \ }
endfunction

function! neoformat#formatters#cpp#clangformat()
    return neoformat#formatters#c#clangformat()
endfunction

function! neoformat#formatters#cpp#astyle()
    return neoformat#formatters#c#astyle()
endfunction

