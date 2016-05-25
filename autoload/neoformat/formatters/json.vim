function! neoformat#formatters#json#enabled()
    return ['jsbeautify', 'prettydiff']
endfunction

function! neoformat#formatters#json#jsbeautify()
    return neoformat#javascript#jsbeautify()
endfunction

function! neoformat#formatters#json#prettydiff()
    return neoformat#javascript#prettydiff()
endfunction
