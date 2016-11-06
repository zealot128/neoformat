function! neoformat#formatters#sh#enabled() abort
    return ['shfmt']
endfunction

function! neoformat#formatters#sh#shfmt() abort
    return {'exe': 'shfmt'}
endfunction
