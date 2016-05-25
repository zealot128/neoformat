function! neoformat#formatters#crystal#enabled()
    return ['crystalformat']
endfunction

function! neoformat#formatters#crystal#crystalformat()
    return {
        \ 'exe': 'crystal',
        \ 'args': ['tool', 'format'],
        \ 'replace': 1
        \ }
endfunction
