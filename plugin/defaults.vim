"/Users/sloth/documents/example.vim
let s:fullfilepath = fnameescape(expand('%:p'))
" example
let s:basefilename = shellescape(expand('%:r'))
" example.vim
let s:fullfilename = shellescape(expand('%'))


" Python
let g:neoformat#python#autopep8 = {
            \ 'exe': 'autopep8'
            \ }

let g:neoformat#enabled#python = ['autopep8']


" Javascript
let g:neoformat#javascript#jsbeautify = {
            \ 'exe': 'js-beautify'
            \ }

let g:neoformat#enabled#javascript = ['jsbeautify']


" Go
let g:neoformat#go#gofmt = {
            \ 'exe': 'goimport'
            \ }

let g:neoformat#go#goimports = {
            \ 'exe': 'goimports'
            \ }

let g:neoformat#enabled#go = ['goimports', 'gofmt']

" Ruby
let g:neoformat#ruby#rubybeautify = {
            \ 'exe': 'ruby-beautify',
            \ 'flags': ['--spaces', '-c 2']
            \ }

let g:neoformat#enabled#ruby = ['rubybeautify']
