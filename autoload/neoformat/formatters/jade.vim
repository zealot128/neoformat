function! neoformat#formatters#jade#enabled()
   return ['pugbeautifier']
endfunction

function! neoformat#formatters#jade#pugbeautifier()
    return neoformat#formatters#pug#pugbeautifier()
endfunction
