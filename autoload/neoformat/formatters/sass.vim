function! neoformat#formatters#sass#enabled()
   return ['sassconvert', 'csscomb']
endfunction

function! neoformat#formatters#sass#sassconvert()
    return {
            \ 'exe': 'sass-convert',
            \ 'args': ['-T sass']
            \ }
endfunction

function! neoformat#formatters#sass#csscomb()
    return neoformat#formatters#css#csscomb()
endfunction

