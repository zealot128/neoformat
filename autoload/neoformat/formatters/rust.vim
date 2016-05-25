function! neoformat#formatters#rust#enabled()
    return ['rustfmt']
endfunction

function! neoformat#formatters#rust#rustfmt()
    return {
        \ 'exe': 'rustfmt',
        \ 'replace': 1
        \ }
endfunction
