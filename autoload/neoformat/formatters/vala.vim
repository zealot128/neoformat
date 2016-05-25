function! neoformat#formatters#vala#uncrustify()
    return {
        \ 'exe': 'uncrustify',
        \ 'args': ['-q', '-l VALA', '-f']
        \ }
endfunction

function! neoformat#formatters#vala#enabled()
    return ['uncrustify']
endfunction
