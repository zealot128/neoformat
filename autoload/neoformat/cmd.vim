function! neoformat#cmd#generate(definition) abort
    let cmd = get(a:definition, 'exe', '')
    if cmd == ''
        call neoformat#utils#log('no exe field in definition')
        return {}
    endif
    if !executable(cmd)
        call neoformat#utils#log('cmd: ' . cmd . ' is not an executable')
        return {}
    endif

    let args = get(a:definition, 'args', [])
    let args_expanded = []
    for a in args
        let args_expanded = add(args_expanded, s:expand_fully(a))
    endfor

    let replace   = get(a:definition, 'replace')
    let no_append = get(a:definition, 'no_append')

    if !exists('g:neoformat_read_from_buffer')
        let g:neoformat_read_from_buffer = 1
    endif

    if isdirectory('/tmp/') && g:neoformat_read_from_buffer
        if !isdirectory('/tmp/neoformat/')
            call mkdir('/tmp/neoformat/')
        endif

        " get the last path component, the filename
        let filename = expand('%:t')
        let path     = '/tmp/neoformat/' . fnameescape(filename)
        let data     = getbufline(bufnr('%'), 1, '$')
        call writefile(data, path)
    else
        " /Users/sloth/documents/example.vim
        let path = fnameescape(expand('%:p'))
    endif

    if no_append
        let path = ''
    endif

    let _fullcmd = cmd . ' ' . join(args_expanded) . ' ' . path
    " make sure there aren't any double spaces in the cmd
    let fullcmd = join(split(_fullcmd))

    return {
        \ 'exe':       fullcmd,
        \ 'name':      a:definition.exe,
        \ 'no_append': no_append,
        \ 'path':      path,
        \ 'replace':   replace,
        \ 'filetype':  &filetype
        \ }
endfunction

function! s:expand_fully(string) abort
    return substitute(a:string, '%\(:[a-z]\)*', '\=expand(submatch(0))', 'g')
endfunction
