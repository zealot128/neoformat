function! neoformat#cmd#Generate(definition) abort
    if has_key(a:definition, 'exe')
        let l:cmd = get(a:definition, 'exe')
        if !executable(l:cmd)
            echom 'Neoformat: executable ' . l:cmd . ' not found'
            return {}
        endif
    else
        echom 'Neoformat: `exe` was not found in formatter definition'
        return {}
    endif



    let l:args = []
    if has_key(a:definition, 'args')
        let l:args = get(a:definition, 'args')
    endif
    let l:args_expanded = []
    for l:a in l:args
        let l:args_expanded = add(l:args_expanded, s:expand_fully(l:a))
    endfor

    let l:replace = 0
    if has_key(a:definition, 'replace')
        let l:replace = get(a:definition, 'replace')
    endif

    let l:no_append = 0
    if has_key(a:definition, 'no_append')
        let l:no_append = get(a:definition, 'no_append')
    endif

    if !exists('g:neoformat_read_from_buffer')
        let g:neoformat_read_from_buffer = 1
    endif

    if isdirectory('/tmp/') && g:neoformat_read_from_buffer == 1
        if !isdirectory('/tmp/neoformat/')
            call mkdir('/tmp/neoformat/')
        endif

        " get the last path component, the filename
        let l:filename = expand('%:t')
        let l:path = '/tmp/neoformat/' . fnameescape(l:filename)
        let l:data     = getbufline(bufnr('%'), 1, '$')
        call writefile(l:data, l:path)
    else
        " /Users/sloth/documents/example.vim
        let l:path = fnameescape(expand('%:p'))
    endif

    if l:no_append
        let l:path = ''
    endif

    let l:_fullcmd = l:cmd . ' ' . join(l:args_expanded) . ' ' . l:path
    " make sure there aren't any double spaces in the cmd
    let l:fullcmd = join(split(l:_fullcmd))

    return {
        \ 'exe':       l:fullcmd,
        \ 'name':      a:definition.exe,
        \ 'no_append': l:no_append,
        \ 'path':      l:path,
        \ 'replace':   l:replace
        \ }
endfunction

function! s:expand_fully(string) abort
    return substitute(a:string, '%\(:[a-z]\)*',
                            \ '\=expand(submatch(0))', 'g')
endfunction
