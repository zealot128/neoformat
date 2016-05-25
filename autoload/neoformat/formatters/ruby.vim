function! neoformat#formatters#ruby#enabled()
   return ['rubybeautify']
endfunction

function! neoformat#formatters#ruby#rubybeautify()
     return {
        \ 'exe': 'ruby-beautify',
        \ 'args': ['--spaces', '-c 2']
        \ }
endfunction
