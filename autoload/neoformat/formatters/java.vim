function! neoformat#formatters#java#enabled()
   return ['uncrustify', 'astyle', 'clang-format']
endfunction

function! neoformat#formatters#java#uncrustify()
     return {
            \ 'exe': 'uncrustify',
            \ 'args': ['-q', '-l JAVA', '-f']
            \ }
endfunction


function! neoformat#formatters#java#astyle()
    return {
            \ 'exe': 'astyle',
            \ 'args': ['--mode=java'],
            \ 'replace': 1
            \ }
endfunction


function! neoformat#formatters#java#clangformat()
    return {'exe': 'clang-format'}
endfunction


