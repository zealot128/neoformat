function! neoformat#formatters#cs#enabled()
    return ['uncrustify', 'astyle']
endfunction

function! neoformat#formatters#cs#uncrustify()
    return {
        \ 'exe': 'uncrustify',
        \ 'args': ['-q', '-l CS', '-f']
        \ }
endfunction

function! neoformat#formatters#cs#astyle()
    return {
        \ 'exe': 'astyle',
        \ 'args': ['--mode=cs'],
        \ 'replace': 1
        \ }
endfunction
