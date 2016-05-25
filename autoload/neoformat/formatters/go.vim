function! neoformat#formatters#go#enabled()
   return ['goimports', 'gofmt']
endfunction

function! neoformat#formatters#go#gofmt()
    return {'exe': 'gofmt'}
 endfunction

function! neoformat#formatters#go#goimports()
    return {'exe': 'goimports'}
endfunction

