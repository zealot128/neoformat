function! neoformat#formatters#scala#enabled()
    return ['scalariform']
endfunction

function! neoformat#formatters#scala#scalariform()
    return {
        \ 'exe': 'scalariform',
        \ 'args': ['--stdout']
        \ }
endfunction
