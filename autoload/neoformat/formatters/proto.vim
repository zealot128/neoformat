function! neoformat#formatters#proto#enabled()
    return ['clangformat']
endfunction

function! neoformat#formatters#proto#clangformat()
    return neoformat#formatters#c#clangformat()
endfunction
