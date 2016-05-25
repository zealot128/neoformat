function! neoformat#formatters#perl#enabled()
   return ['perltidy']
endfunction

function! neoformat#formatters#perl#perltidy()
    return {
            \ 'exe': 'perltidy',
            \ 'args': ['--standard-output']
            \ }
endfunction
