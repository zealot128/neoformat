function! neoformat#cmd#GenCmd(definition) abort

    if has_key(a:definition, 'exe')
        let l:cmd = get(a:definition, 'exe')
        if !executable(l:cmd)
            echom 'Neoformat: executable ' . l:cmd . ' not found'
            return ''
        endif
    else
        echom 'Neoformat: exe was not found in formatter definition'
        return ''
    endif

    if has_key(a:definition, 'flags')
        let l:flags = get(a:definition, 'flags')
    else
        " default stdin is disabled
        let l:flags = []
    endif

    if has_key(a:definition, 'noappend')
        let l:noappend = get(a:definition, 'noappend')
    else
        " default to appending filename
        let l:noappend = 0
    endif

    if !exists('g:neoformat_read_from_buffer')
        let g:neoformat_read_from_buffer = 1
    endif

    let l:filename = expand('%')

    let l:data = getbufline(bufnr(l:filename), 1, '$')

    if isdirectory('/tmp/') && g:neoformat_read_from_buffer == 1
        let l:tempfile = '/tmp/' . fnameescape(l:filename)

        call writefile(l:data, l:tempfile)
        let l:fullfilepath = l:tempfile
    else
        "/Users/sloth/documents/example.vim
        let l:fullfilepath = fnameescape(expand('%:p'))
    endif

    if l:noappend
        let s:path = ''
    else
        let s:path = l:fullfilepath
    endif

    let l:_fullcmd = l:cmd . ' ' . join(l:flags) . ' ' . s:path
    " make sure there aren't any double spaces in the cmd
    let l:fullcmd = join(split(l:_fullcmd))

    return l:fullcmd
endfunction
