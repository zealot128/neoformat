function! neoformat#formatters#pug#enabled()
   return ['pugbeautifier']
endfunction

function! neoformat#formatters#pug#pugbeautifier()
    return {
        \ 'exe': 'pug-beautifier'
        \ }
endfunction
