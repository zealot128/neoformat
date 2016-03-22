"/Users/sloth/documents/example.vim
let s:fullfilepath = fnameescape(expand('%:p'))
" example
let s:basefilename = shellescape(expand('%:r'))
" example.vim
let s:fullfilename = shellescape(expand('%'))


" Python
let g:neoformat#python#yapf = {
            \ 'exe': 'yapf'
            \ }

let g:neoformat#python#autopep8 = {
            \ 'exe': 'autopep8'
            \ }

let g:neoformat#enabled#python = ['yapf', 'autopep8']


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
let g:neoformat#html#tidy = {
            \ 'exe': 'tidy',
            \ 'flags': ['-quiet', '--indent auto', '--indent-spaces 4',
            \           '--vertical-space yes', '--tidy-mark no']
            \ }

let g:neoformat#enabled#html = ['htmlbeautify', 'tidy']

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

" SQL
let g:neoformat#sql#sqlformat = {
            \ 'exe': 'sqlformat',
            \ 'flags': ['--reindent']
            \ }

let g:neoformat#enabled#sql = ['sqlformat']

" C
let g:neoformat#c#uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'flags': ['-q', '-f']
            \ }

let g:neoformat#enabled#c = ['uncrustify']

" C++
let g:neoformat#cpp#uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'flags': ['-q', '-f']
            \ }

let g:neoformat#enabled#cpp = ['uncrustify']

" C#
let g:neoformat#cs#uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'flags': ['-q', '-f']
            \ }

let g:neoformat#enabled#cs = ['uncrustify']

" Objective-C
let g:neoformat#objc#uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'flags': ['-q', '-f']
            \ }

let g:neoformat#enabled#objc = ['uncrustify']

" D
let g:neoformat#d#dfmt = {
            \ 'exe': 'dfmt'
            \ }

let g:neoformat#d#uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'flags': ['-q', '-f']
            \ }

let g:neoformat#enabled#d = ['uncrustify', 'dfmt']

" Pawn
let g:neoformat#pawn#uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'flags': ['-q', '-f']
            \ }

let g:neoformat#enabled#pawn = ['uncrustify']

" VALA
let g:neoformat#vala#uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'flags': ['-q', '-f']
            \ }

let g:neoformat#enabled#vala = ['uncrustify']

" Elm
let g:neoformat#elm#elmformat = {
            \ 'exe': 'elm-format'
            \ }

let g:neoformat#enabled#elm = ['elmformat']

" Haskell
let g:neoformat#haskell#stylishhaskell = {
            \ 'exe': 'stylish-haskell'
            \ }

let g:neoformat#enabled#haskell = ['stylishhaskell']

" Typescript
let g:neoformat#typescript#tsfmt = {
            \ 'exe': 'tsfmt'
            \ }

let g:neoformat#enabled#typescript = ['tsfmt']

" Pug
let g:neoformat#pug#pugbeautifier = {
            \ 'exe': 'pug-beautifier'
            \ }

let g:neoformat#enabled#pug = ['pugbeautifier']

" Jade
let g:neoformat#jade#pugbeautifier = {
            \ 'exe': 'pug-beautifier'
            \ }

let g:neoformat#enabled#jade = ['pugbeautifier']

" XML
let g:neoformat#xml#tidy = {
            \ 'exe': 'tidy',
            \ 'flags': ['-quiet', '-xml', '--indent auto', '--indent-spaces 4',
            \           '--vertical-space yes', '--tidy-mark no']
            \ }

let g:neoformat#enabled#xml = ['tidy']

" XHTML
let g:neoformat#xhtml#tidy = {
            \ 'exe': 'tidy',
            \ 'flags': ['-quiet', '-asxhtml', '--indent auto', '--indent-spaces 4',
            \           '--vertical-space yes', '--tidy-mark no']
            \ }

let g:neoformat#enabled#xhtml = ['tidy']
