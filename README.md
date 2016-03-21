# Neoformat

A [Neovim](https://neovim.io) plugin for formatting code.

Neoformat uses a variety of formatters for differing filetypes. Currently, Neoformat
will run a formatter _asynchronously_, and on success it will update the current
buffer with the formatted text. On a formatter failure, Neoformat will try the next
formatter defined for the filetype.

The job control is based off of [vim-go's](https://github.com/fatih/vim-go).

## Basic Usage

Format the current file using its filetype

```vimscript
:Neoformat
```

Or specify a filetype

```vimscript
:Neoformat python
```

## Current Limitation(s)

In order to preserve marks, jumps, etc., Neoformat uses Vim's `setline()` function
to insert the formatted text. If the buffer is changed before the formatter has
completed, then the updated text will be put into the current buffer.

To prevent this, format jobs are cancelled when changing / closing the buffer.

**So don't switch buffers before the the formatting is complete!**

## Config [Optional]

Define custom formatters.

```vimscript
let g:neoformat_python_autopep8 = {
            \ 'exe': 'autopep8'
            \ }

let g:neoformat_enabled_python = ['autopep8']
```

Enable basic formatting when a filetype is not found. Disabled by default.

```vimscript
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
```

## Supported Filetypes

- CSS
  - [css-beautify](https://github.com/senchalabs/cssbeautify)
- Go
  - [gofmt](https://golang.org/cmd/gofmt/), [goimports](https://godoc.org/golang.org/x/tools/cmd/goimports)
- HTML
  - [html-beautify](https://github.com/beautify-web/js-beautify#css--html)
- Java
  - [uncrustify](http://uncrustify.sourceforge.net)
- Javascript
  - [js-beautify](https://github.com/beautify-web/js-beautify)
- JSON
  - [js-beautify](https://github.com/beautify-web/js-beautify)
- Markdown
  - [remark](https://github.com/wooorm/remark)
- Python
  - [autopep8](https://github.com/hhatto/autopep8)
- Ruby
  - [ruby-beautify](https://github.com/erniebrodeur/ruby-beautify)
- SASS
  - [sass-convert](http://sass-lang.com/documentation/#executables)
- SCSS
  - [sass-convert](http://sass-lang.com/documentation/#executables)
- SQL
  - [sqlformat](https://github.com/andialbrecht/sqlparse) ships with sqlparse
