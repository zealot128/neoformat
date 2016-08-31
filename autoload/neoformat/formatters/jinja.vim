function! neoformat#formatters#jinja#enabled()
    return ['prettydiff', 'htmlbeautify']
endfunction

function! neoformat#formatters#jinja#htmlbeautify()
    return neoformat#formatters#html#htmlbeautify()
endfunction

function! neoformat#formatters#jinja#prettydiff()
    return neoformat#formatters#html#prettydiff()
endfunction
