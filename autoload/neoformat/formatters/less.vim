function! neoformat#formatters#less#enabled()
    return ['csscomb', 'prettydiff']
endfunction

function! neoformat#formatters#less#csscomb()
    return neoformat#formatters#css#csscomb()
endfunction

function! neoformat#formatters#less#prettydiff()
    return neoformat#formatters#css#prettydiff()
endfunction
