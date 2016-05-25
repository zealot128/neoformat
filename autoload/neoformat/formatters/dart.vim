function! neoformat#formatters#dart#enabled()
    return ['dartfmt']
endfunction

function! neoformat#formatters#dart#dartfmt()
    return {
        \ 'exe': 'dartfmt',
        \ }
endfunction
