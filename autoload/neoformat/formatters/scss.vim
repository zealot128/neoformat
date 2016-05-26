function! neoformat#formatters#scss#enabled()
   return ['sassconvert', 'stylefmt', 'prettydiff', 'csscomb']
endfunction

function! neoformat#formatters#scss#sassconvert()
    return {
            \ 'exe': 'sass-convert',
            \ 'args': ['-T scss']
            \ }
endfunction

function! neoformat#formatters#scss#csscomb()
    return neoformat#formatters#css#csscomb()
endfunction

function! neoformat#formatters#scss#prettydiff()
    return neoformat#formatters#css#prettydiff()
endfunction

function! neoformat#formatters#scss#stylefmt()
    return neoformat#formatters#css#stylefmt()
endfunction
