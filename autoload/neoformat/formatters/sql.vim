function! neoformat#formatters#sql#enabled()
    return ['sqlformat']
endfunction

function! neoformat#formatters#sql#sqlformat()
    return {
        \ 'exe': 'sqlformat',
        \ 'args': ['--reindent']
        \ }
endfunction
