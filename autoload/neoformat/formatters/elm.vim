function! neoformat#formatters#elm#enabled()
    return ['elmformat']
endfunction

function! neoformat#formatters#elm#elmformat()
    return {
        \ 'exe': 'elm-format'
        \ }
endfunction


