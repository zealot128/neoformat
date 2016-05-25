function! neoformat#formatters#php#enabled()
    return ['phpbeautifier']
endfunction

function! neoformat#formatters#php#phpbeautifier()
    return {
        \ 'exe': 'php_beautifier',
        \ }
endfunction
