# Neoformat

A [Neovim](https://neovim.io) plugin for formatting code.

Neoformat uses a variety of formatters for differing filetypes. Currently, Neoformat
will run a formatter _asynchronously_, and on success it will update the current
buffer with the formatted text. On a formatter failure, Neoformat will try the next
formatter defined for the filetype.

The job control is based off of [vim-go's](https://github.com/fatih/vim-go).

## Basic Usage

Format the current file using its filetype

```viml
:Neoformat
```

Specify a filetype

```viml
:Neoformat python
```

Or specify a certain formatter

```viml
:Neoformat javascript/js-beautify
```

## Install

[vim-plug](https://github.com/junegunn/vim-plug)

```viml
Plug 'sbdchd/neoformat'
```

## Current Limitation(s)

In order to preserve marks, jumps, etc., Neoformat uses Vim's `setline()` function
to insert the formatted text. If the buffer is changed before the formatter has
completed, then the updated text will be put into the current buffer.

To prevent this, format jobs are cancelled when changing / closing the buffer.

**So don't switch buffers before the the formatting is complete!**

Also, Neoformat reads from the current file, not the current buffer, so save current
changes before formatting.

## Config [Optional]

Define custom formatters.

```viml
let g:neoformat_python_autopep8 = {
            \ 'exe': 'autopep8'
            \ }

let g:neoformat_enabled_python = ['autopep8']
```

Enable basic formatting when a filetype is not found. Disabled by default.

```viml
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
```

## Supported Filetypes

- Arduino
  - [uncrustify](http://uncrustify.sourceforge.net)
- C
  - [uncrustify](http://uncrustify.sourceforge.net)
- C#
  - [uncrustify](http://uncrustify.sourceforge.net)
- C++
  - [uncrustify](http://uncrustify.sourceforge.net)
- CSS
  - css-beautify (ships with [js-beautify](https://github.com/beautify-web/js-beautify))
- D
  - [uncrustify](http://uncrustify.sourceforge.net), [dfmt](https://github.com/Hackerpilot/dfmt)
- Elm
  - [elm-format](https://github.com/avh4/elm-format)
- Go
  - [gofmt](https://golang.org/cmd/gofmt/), [goimports](https://godoc.org/golang.org/x/tools/cmd/goimports)
- Haskell
  - [stylish-haskell](https://github.com/jaspervdj/stylish-haskell)
- HTML
  - html-beautify (ships with [js-beautify](https://github.com/beautify-web/js-beautify))
- Jade
  - [pug-beautifier](https://github.com/vingorius/pug-beautifier)
- Java
  - [uncrustify](http://uncrustify.sourceforge.net)
- Javascript
  - [js-beautify](https://github.com/beautify-web/js-beautify)
- JSON
  - [js-beautify](https://github.com/beautify-web/js-beautify)
- Markdown
  - [remark](https://github.com/wooorm/remark)
- Objective-C
  - [uncrustify](http://uncrustify.sourceforge.net)
- Pawn
  - [uncrustify](http://uncrustify.sourceforge.net)
- Perl
  - [perltidy](http://perltidy.sourceforge.net)
- Pug (formally Jade)
  - [pug-beautifier](https://github.com/vingorius/pug-beautifier)
- Python
  - [yapf](https://github.com/google/yapf), [autopep8](https://github.com/hhatto/autopep8)
- Ruby
  - [ruby-beautify](https://github.com/erniebrodeur/ruby-beautify)
- SASS
  - [sass-convert](http://sass-lang.com/documentation/#executables)
- SCSS
  - [sass-convert](http://sass-lang.com/documentation/#executables)
- SQL
  - sqlformat (ships with [sqlparse](https://github.com/andialbrecht/sqlparse))
- Typescript
  - [tsfmt](https://github.com/vvakame/typescript-formatter)
- VALA
  - [uncrustify](http://uncrustify.sourceforge.net)
- XHTML
  - [tidy](http://www.html-tidy.org)
- XML
  - [tidy](http://www.html-tidy.org)
