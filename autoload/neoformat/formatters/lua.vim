function! neoformat#formatters#lua#enabled()
    return ['luaformatter']
endfunction

function! neoformat#formatters#lua#luaformatter()
    return {
        \ 'exe': 'luaformatter'
        \ }
endfunction
