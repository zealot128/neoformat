function! neoformat#format#update_file(job) abort
    let data      = a:job.stdout
    let filetype  = a:job.filetype
    let formatter = a:job.name

    if a:job.replace
        let data = readfile(a:job.path)
    endif

    if len(data) < 1
        return neoformat#utils#log('no data was provided by ' . formatter)
    endif

    let last = len(data) - 1
    let end  = data[last]

    " needed for some formatters that add two new lines (\n\n) at the end of files
    " ex: remark
    if end == ''
        let datalen = len(data)
    else
        let datalen = len(data) + 1
    endif

    " cleanup the end of the file
    while datalen <= line('$')
        call setline(datalen, '')
        let datalen += 1
    endwhile

    call neoformat#format#trim_trailing_newlines()

    " remove extra newlines at the end of formatted file data
    if end == ''
        call remove(data, last)
    endif

    " ensure file needs to be changed
    let lines = getbufline(bufnr('%'), 1, '$')
    if data ==# lines
        echom 'Neoformat: no change necessary with ' . formatter . ' as ' . filetype
        return
    endif

    " setline() is used instead of writefile() so that marks, jumps, etc. are kept
    call setline(1, data)

    echom 'Neoformat: formatted file with ' . formatter . ' as ' . filetype
endfunction

function! neoformat#format#BasicFormat() abort
    if !exists('g:neoformat_basic_format_align')
        let g:neoformat_basic_format_align = 0
    endif

    if !exists('g:neoformat_basic_format_retab')
        let g:neoformat_basic_format_retab = 0
    endif

    if !exists('g:neoformat_basic_format_trim')
        let g:neoformat_basic_format_trim = 0
    endif

    if g:neoformat_basic_format_align
        call neoformat#utils#log('aligning with basic formatter')
        let v = winsaveview()
        silent! execute 'normal gg=G'
        call winrestview(v)
    endif
    if g:neoformat_basic_format_retab
        call neoformat#utils#log('converting tabs with basic formatter')
        retab
    endif
    if g:neoformat_basic_format_trim
        call neoformat#utils#log('trimming whitespace with basic formatter')
        " http://stackoverflow.com/q/356126
        let search = @/
        let view = winsaveview()
        " vint: -ProhibitCommandRelyOnUser -ProhibitCommandWithUnintendedSideEffect
        silent! %s/\s\+$//e
        " vint: +ProhibitCommandRelyOnUser +ProhibitCommandWithUnintendedSideEffect
        let @/=search
        call winrestview(view)
    endif
endfunction

function! neoformat#format#trim_trailing_newlines() abort
    let search = @/
    let view = winsaveview()
    " http://stackoverflow.com/a/7496112/3720597
    " vint: -ProhibitCommandRelyOnUser -ProhibitCommandWithUnintendedSideEffect
    silent! %s#\($\n\)\+\%$##
    " vint: +ProhibitCommandRelyOnUser +ProhibitCommandWithUnintendedSideEffect
    let @/=search
    call winrestview(view)
endfunction
