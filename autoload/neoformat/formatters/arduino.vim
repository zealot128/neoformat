function! neoformat#formatters#arduino#enabled()
   return ['uncrustify', 'clangformat', 'astyle']
endfunction

function! neoformat#formatters#arduino#uncrustify()
    return neoformat#formatters#cpp#uncrustify()
endfunction

function! neoformat#formatters#arduino#clangformat()
    return neoformat#formatters#c#clangformat()
endfunction

function! neoformat#formatters#arduino#astyle()
    return neoformat#formatters#c#astyle()
endfunction
