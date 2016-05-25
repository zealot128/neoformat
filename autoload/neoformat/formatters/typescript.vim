function! neoformat#formatters#typescript#enabled()
   return ['tsfmt']
endfunction

function! neoformat#formatters#typescript#tsfmt()
    return {
        \ 'exe': 'tsfmt'
        \ }
endfunction
