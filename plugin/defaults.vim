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

let g:neoformat#javascript#prettydiff = {
            \ 'exe': 'prettydiff',
            \ 'args': ['mode:"beautify"',
                     \ 'lang:"javascript"',
                     \ 'readmethod:"filescreen"',
                     \ 'endquietly:"quiet"',
                     \ 'source:"%:p"'],
            \ 'no_append': 1
            \ }

let g:neoformat#enabled#javascript = ['jsbeautify', 'clangformat', 'prettydiff']


" JSON
let g:neoformat#json#jsbeautify = {
            \ 'exe': 'js-beautify'
            \ }

let g:neoformat#json#prettydiff = g:neoformat#javascript#prettydiff

let g:neoformat#enabled#json = ['jsbeautify', 'prettydiff']

" HTML
let g:neoformat#html#htmlbeautify = {
            \ 'exe': 'html-beautify'
            \ }

let g:neoformat#html#tidy = {
            \ 'exe': 'tidy',
            \ 'args': ['-quiet', '--indent auto', '--indent-spaces 4',
            \           '--vertical-space yes', '--tidy-mark no']
            \ }

let g:neoformat#html#prettydiff = {
            \ 'exe': 'prettydiff',
            \ 'args': ['mode:"beautify"',
                     \ 'lang:"html"',
                     \ 'readmethod:"filescreen"',
                     \ 'endquietly:"quiet"',
                     \ 'source:"%:p"'],
            \ 'no_append': 1
            \ }

let g:neoformat#enabled#html = ['htmlbeautify', 'tidy', 'prettydiff']

" CSS
let g:neoformat#css#cssbeautify = {
            \ 'exe': 'css-beautify'
            \ }

let g:neoformat#css#csscomb = {
            \ 'exe': 'csscomb',
            \ 'replace': 1
            \ }

let g:neoformat#css#prettydiff = {
            \ 'exe': 'prettydiff',
            \ 'args': ['mode:"beautify"',
                     \ 'lang:"css"',
                     \ 'readmethod:"filescreen"',
                     \ 'endquietly:"quiet"',
                     \ 'source:"%:p"'],
            \ 'no_append': 1
            \ }

let g:neoformat#enabled#css = ['cssbeautify', 'csscomb', 'prettydiff']

" SCSS
let g:neoformat#scss#sassconvert = {
            \ 'exe': 'sass-convert',
            \ 'args': ['-T scss']
            \ }

let g:neoformat#scss#csscomb = {
            \ 'exe': 'csscomb',
            \ 'replace': 1
            \ }

let g:neoformat#scss#prettydiff = g:neoformat#css#prettydiff

let g:neoformat#enabled#scss = ['sassconvert', 'csscomb', 'prettydiff']

" SASS
let g:neoformat#sass#sassconvert = {
            \ 'exe': 'sass-convert',
            \ 'args': ['-T sass']
            \ }

let g:neoformat#sass#csscomb = {
            \ 'exe': 'csscomb',
            \ 'replace': 1
            \ }

let g:neoformat#enabled#sass = ['sassconvert', 'csscomb']

" Go
let g:neoformat#go#gofmt = {
            \ 'exe': 'gofmt'
            \ }

let g:neoformat#go#goimports = {
            \ 'exe': 'goimports'
            \ }

let g:neoformat#enabled#go = ['goimports', 'gofmt']


" Ruby
let g:neoformat#ruby#rubybeautify = {
            \ 'exe': 'ruby-beautify',
            \ 'args': ['--spaces', '-c 2']
            \ }

let g:neoformat#enabled#ruby = ['rubybeautify']


" Java
let g:neoformat#java#uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'args': ['-q', '-l JAVA', '-f']
            \ }

let g:neoformat#java#astyle = {
            \ 'exe': 'astyle',
            \ 'args': ['--mode=java'],
            \ 'replace': 1
            \ }

let g:neoformat#java#clangformat = {
            \ 'exe': 'clang-format',
            \ }

let g:neoformat#enabled#java = ['uncrustify', 'astyle', 'clang-format']

" Markdown
let g:neoformat#markdown#remark = {
            \ 'exe': 'remark',
            \ 'args': ['--no-color', '--silent']
            \ }

let g:neoformat#enabled#markdown = ['remark']

" SQL
let g:neoformat#sql#sqlformat = {
            \ 'exe': 'sqlformat',
            \ 'args': ['--reindent']
            \ }

let g:neoformat#enabled#sql = ['sqlformat']

" C
let g:neoformat#c#uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'args': ['-q', '-l C', '-f']
            \ }

let g:neoformat#c#clangformat = {
            \ 'exe': 'clang-format',
            \ }

let g:neoformat#c#astyle = {
            \ 'exe': 'astyle',
            \ 'args': ['--mode=c'],
            \ 'replace': 1
            \ }

let g:neoformat#enabled#c = ['uncrustify', 'clangformat', 'astyle']

" C++
let g:neoformat#cpp#uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'args': ['-q', '-l CPP', '-f']
            \ }

 let g:neoformat#cpp#clangformat = {
            \ 'exe': 'clang-format',
            \ }

let g:neoformat#cpp#astyle = {
            \ 'exe': 'astyle',
            \ 'args': ['--mode=c'],
            \ 'replace': 1
            \ }

let g:neoformat#enabled#cpp = ['uncrustify', 'clangformat', 'astyle']

" C#
let g:neoformat#cs#uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'args': ['-q', '-l CS', '-f']
            \ }

let g:neoformat#cs#astyle = {
            \ 'exe': 'astyle',
            \ 'args': ['--mode=cs'],
            \ 'replace': 1
            \ }

let g:neoformat#enabled#cs = ['uncrustify', 'astyle']

" Objective-C
let g:neoformat#objc#uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'args': ['-q', '-l OC+', '-f']
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
            \ 'args': ['-q', '-l D', '-f']
            \ }

let g:neoformat#enabled#d = ['uncrustify', 'dfmt']

" Pawn
let g:neoformat#pawn#uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'args': ['-q', '-l PAWN', '-f']
            \ }

let g:neoformat#enabled#pawn = ['uncrustify']

" VALA
let g:neoformat#vala#uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'args': ['-q', '-l VALA', '-f']
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
            \ 'args': ['-quiet', '-xml', '--indent auto', '--indent-spaces 4',
            \           '--vertical-space yes', '--tidy-mark no']
            \ }

let g:neoformat#xml#prettydiff = g:neoformat#html#prettydiff

let g:neoformat#enabled#xml = ['tidy', 'prettydiff']

" XHTML
let g:neoformat#xhtml#tidy = {
            \ 'exe': 'tidy',
            \ 'args': ['-quiet', '-asxhtml', '--indent auto', '--indent-spaces 4',
            \           '--vertical-space yes', '--tidy-mark no']
            \ }

let g:neoformat#xhtml#prettydiff = g:neoformat#html#prettydiff

let g:neoformat#enabled#xhtml = ['tidy', 'prettydiff']

" Perl
let g:neoformat#perl#perltidy = {
            \ 'exe': 'perltidy',
            \ 'args': ['--standard-output']
            \ }

let g:neoformat#enabled#perl = ['perltidy']

" Arduino
let g:neoformat#arduino#uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'args': ['-q', '-l CPP', '-f']
            \ }

let g:neoformat#arduino#clangformat = {
            \ 'exe': 'clang-format',
            \ }

let g:neoformat#arduino#astyle = {
            \ 'exe': 'astyle',
            \ 'args': ['--mode=c'],
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
            \ 'args': ['--stdout']
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

" Crystal
let g:neoformat#crystal#crystalformat = {
            \ 'exe': 'crystal',
            \ 'args': ['tool', 'format'],
            \ 'replace': 1
            \ }

let g:neoformat#enabled#crystal = ['crystalformat']

" LESS
let g:neoformat#less#csscomb = {
            \ 'exe': 'csscomb',
            \ 'replace': 1
            \ }

let g:neoformat#less#prettydiff = g:neoformat#css#prettydiff

let g:neoformat#enabled#less = ['csscomb', 'prettydiff']

" CSV
let g:neoformat#csv#prettydiff = {
            \ 'exe': 'prettydiff',
            \ 'args': ['mode:"beautify"',
                     \ 'lang:"csv"',
                     \ 'readmethod:"filescreen"',
                     \ 'endquietly:"quiet"',
                     \ 'source:"%:p"'],
            \ 'no_append': 1
            \ }

let g:neoformat#enabled#csv = ['prettydiff']
