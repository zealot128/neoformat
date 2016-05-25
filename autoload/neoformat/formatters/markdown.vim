function! neoformat#formatters#markdown#enabled()
   return ['remark']
endfunction

function! neoformat#formatters#markdown#remark()
    return {
            \ 'exe': 'remark',
            \ 'args': ['--no-color', '--silent']
            \ }
endfunction
