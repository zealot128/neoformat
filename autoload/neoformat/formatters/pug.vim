function! neoformat#formatters#pug#enabled()
   return ['pugbeautifier']
endfunction

function! neoformat#formatters#pug#pugbeautifier()
    return {
        \ 'exe': 'pug-beautifier',
        \ 'args': ['-s 2']
        \ }
endfunction
