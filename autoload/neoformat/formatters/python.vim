function! neoformat#formatters#python#enabled() abort
    return ['yapf', 'autopep8']
endfunction

function! neoformat#formatters#python#yapf() abort
    return {'exe': 'yapf'}
endfunction

function! neoformat#formatters#python#autopep8() abort
    return {'exe': 'autopep8'}
endfunction
