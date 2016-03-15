# Neoformat

A [Neovim](https://neovim.io) plugin for formatting code.

Neoformat uses a variety of formatters for differing filetypes. Currently, Neoformat
will run a formatter *asynchronously*, and on success it will update the current
buffer with the formatted text. On a formatter failure, Neoformat will try the next
formatter defined for the filetype.

The job control is based off of [vim-go's](https://github.com/fatih/vim-go).

## Current Issues

In order to preserve marks, jumps, etc., Neoformat uses the `setline()` function in Vim to
input the formatted text. If the buffer is changed before the formatter has completed,
then the updated text will be put into the current buffer.

So don't switch buffers while formatting!

## Supported Filetypes

- javascript
  - [jsbeautify](https://github.com/beautify-web/js-beautify)
- python
  - [autopep8](https://github.com/hhatto/autopep8)
- go
  - [gofmt](https://golang.org/cmd/gofmt/), [goimports](https://godoc.org/golang.org/x/tools/cmd/goimports)
- ruby
  - [ruby-beautify](https://github.com/erniebrodeur/ruby-beautify)
