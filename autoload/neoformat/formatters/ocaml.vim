function! neoformat#formatters#ocaml#enabled()
    return ['ocpindent']
endfunction

function! neoformat#formatters#ocaml#ocpindent()
    return {
        \ 'exe': 'ocp-indent',
        \ }
endfunction
