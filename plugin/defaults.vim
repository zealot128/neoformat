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

let g:neoformat#javascript#clangformat = {
            \ 'exe': 'clang-format',
            \ }

let g:neoformat#enabled#javascript = ['jsbeautify', 'clangformat']


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
            \ 'flags': ['-q', '-l JAVA', '-f']
            \ }

let g:neoformat#java#astyle = {
            \ 'exe': 'astyle',
            \ 'flags': ['--mode=java'],
            \ 'replace': 1
            \ }

let g:neoformat#java#clangformat = {
            \ 'exe': 'clang-format',
            \ }

let g:neoformat#enabled#java = ['uncrustify', 'astyle', 'clang-format']

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
            \ 'flags': ['-q', '-l C', '-f']
            \ }

let g:neoformat#c#clangformat = {
            \ 'exe': 'clang-format',
            \ }

let g:neoformat#c#astyle = {
            \ 'exe': 'astyle',
            \ 'flags': ['--mode=c'],
            \ 'replace': 1
            \ }

let g:neoformat#enabled#c = ['uncrustify', 'clangformat', 'astyle']

" C++
let g:neoformat#cpp#uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'flags': ['-q', '-l CPP', '-f']
            \ }

 let g:neoformat#cpp#clangformat = {
            \ 'exe': 'clang-format',
            \ }

let g:neoformat#cpp#astyle = {
            \ 'exe': 'astyle',
            \ 'flags': ['--mode=c'],
            \ 'replace': 1
            \ }

let g:neoformat#enabled#cpp = ['uncrustify', 'clangformat', 'astyle']

" C#
let g:neoformat#cs#uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'flags': ['-q', '-l CS', '-f']
            \ }

let g:neoformat#cs#astyle = {
            \ 'exe': 'astyle',
            \ 'flags': ['--mode=cs'],
            \ 'replace': 1
            \ }

let g:neoformat#enabled#cs = ['uncrustify', 'astyle']

" Objective-C
let g:neoformat#objc#uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'flags': ['-q', '-l OC+', '-f']
            \ }

let g:neoformat#objc#clangformat = {
            \ 'exe': 'clang-format',
            \ }

let g:neoformat#enabled#objc = ['uncrustify', 'clangformat']

" D
let g:neoformat#d#dfmt = {
            \ 'exe': 'dfmt'
            \ }

let g:neoformat#d#uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'flags': ['-q', '-l D', '-f']
            \ }

let g:neoformat#enabled#d = ['uncrustify', 'dfmt']

" Pawn
let g:neoformat#pawn#uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'flags': ['-q', '-l PAWN', '-f']
            \ }

let g:neoformat#enabled#pawn = ['uncrustify']

" VALA
let g:neoformat#vala#uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'flags': ['-q', '-l VALA', '-f']
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

" Perl
let g:neoformat#perl#perltidy = {
            \ 'exe': 'perltidy',
            \ 'flags': ['--standard-output']
            \ }

let g:neoformat#enabled#perl = ['perltidy']

" Arduino
let g:neoformat#arduino#uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'flags': ['-q', '-l CPP', '-f']
            \ }

let g:neoformat#arduino#clangformat = {
            \ 'exe': 'clang-format',
            \ }

let g:neoformat#arduino#astyle = {
            \ 'exe': 'astyle',
            \ 'flags': ['--mode=c'],
            \ 'replace': 1
            \ }

let g:neoformat#enabled#arduino = ['uncrustify', 'clangformat', 'astyle']

" Lua
let g:neoformat#lua#luaformatter = {
            \ 'exe': 'luaformatter'
            \ }

let g:neoformat#enabled#lua = ['luaformatter']

" Scala
let g:neoformat#scala#scalariform = {
            \ 'exe': 'scalariform',
            \ 'flags': ['--stdout']
            \ }

let g:neoformat#enabled#scala = ['scalariform']

" OCaml
let g:neoformat#ocaml#ocpindent = {
            \ 'exe': 'ocp-indent',
            \ }

let g:neoformat#enabled#ocaml = ['ocpindent']

" PHP
let g:neoformat#php#phpbeautifier = {
            \ 'exe': 'php_beautifier',
            \ }

let g:neoformat#enabled#php = ['phpbeautifier']

" Dart
let g:neoformat#dart#dartfmt = {
            \ 'exe': 'dartfmt',
            \ }

let g:neoformat#enabled#dart = ['dartfmt']

" Rust
let g:neoformat#rust#rustfmt = {
            \ 'exe': 'rustfmt',
            \ 'replace': 1
            \ }

let g:neoformat#enabled#rust = ['rustfmt']

" Proto
let g:neoformat#proto#clangformat = {
            \ 'exe': 'clang-format',
            \ }

let g:neoformat#enabled#proto = ['clangformat']
