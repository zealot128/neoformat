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


" JSON
let g:neoformat#json#jsbeautify = {
            \ 'exe': 'js-beautify'
            \ }

let g:neoformat#enabled#json = ['jsbeautify']

" HTML
let g:neoformat#html#htmlbeautify = {
            \ 'exe': 'html-beautify'
            \ }

let g:neoformat#enabled#html = ['htmlbeautify']

" CSS
let g:neoformat#css#cssbeautify = {
            \ 'exe': 'css-beautify'
            \ }

let g:neoformat#enabled#css = ['cssbeautify']

" SCSS
let g:neoformat#scss#sassconvert = {
            \ 'exe': 'sass-convert',
            \ 'flags': ['-T scss']
            \ }

let g:neoformat#enabled#scss = ['sassconvert']

" SASS
let g:neoformat#sass#sassconvert = {
            \ 'exe': 'sass-convert',
            \ 'flags': ['-T sass']
            \ }

let g:neoformat#enabled#sass = ['sassconvert']

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


" Java
let g:neoformat#java#uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'flags': ['-q', '-f']
            \ }

let g:neoformat#enabled#java = ['uncrustify']

" Markdown
let g:neoformat#markdown#remark = {
            \ 'exe': 'remark',
            \ 'flags': ['--no-color', '--silent']
            \ }

let g:neoformat#enabled#markdown = ['remark']
