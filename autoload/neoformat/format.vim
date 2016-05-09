function! neoformat#format#UpdateFile(job) abort
    let l:data           = a:job.stdout
    let l:formatter_name = a:job.name

    if a:job.replace == 1
        let l:data = readfile(a:job.path)
    endif

    if len(l:data) < 1
        echom 'Neoformat: no data was provided by ' . l:formatter_name
        return
    endif

    let l:last = len(l:data) - 1
    let l:end  = l:data[l:last]

    " needed for some formatters that add empty new lines at the end of files
    " ex: remark
    if l:end ==# ''
        let l:datalen = len(l:data)
    else
        let l:datalen = len(l:data) + 1
    endif

    " cleanup the end of the file
    while l:datalen <= line('$')
        call setline(l:datalen, '')
        let l:datalen += 1
    endwhile

    call neoformat#format#TrimTrailingNewLines()

    " remove extra newlines at the end of formatted file data
    if l:end ==# ''
        call remove(l:data, l:last)
    endif

    " ensure file needs to be changed
    let l:lines = getbufline(bufnr('%'), 1, '$')
    if l:data ==# l:lines
        echom 'Neoformat: no change necessary with ' . l:formatter_name
        return
    endif

    " setline() is used instead of writefile() so that marks, jumps, etc. are kept
    call setline(1, l:data)

    echom 'Neoformat: formatted file with ' . l:formatter_name
endfunction


function! neoformat#format#BasicFormat() abort
    echom 'Neoformat: no formatters found for the current filetype'

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
        echom 'Neoformat: aligning with basic formatter'
        let l:v = winsaveview()
        silent! execute 'normal gg=G'
        call winrestview(l:v)
    endif
    if g:neoformat_basic_format_retab
        echom 'Neoformat: converting tabs with basic formatter'
        retab
    endif
    if g:neoformat_basic_format_trim
        echom 'Neoformat: trimming whitespace with basic formatter'
        " http://stackoverflow.com/q/356126
        let l:search = @/
        let l:view = winsaveview()
        " vint: -ProhibitCommandRelyOnUser -ProhibitCommandWithUnintendedSideEffect
        silent! %s/\s\+$//e
        " vint: +ProhibitCommandRelyOnUser +ProhibitCommandWithUnintendedSideEffect
        let @/=l:search
        call winrestview(l:view)
    endif
endfunction


function! neoformat#format#TrimTrailingNewLines() abort
    let l:search = @/
    let l:view = winsaveview()
    " http://stackoverflow.com/a/7496112/3720597
    " vint: -ProhibitCommandRelyOnUser -ProhibitCommandWithUnintendedSideEffect
    silent! %s#\($\n\)\+\%$##
    " vint: +ProhibitCommandRelyOnUser +ProhibitCommandWithUnintendedSideEffect
    let @/=l:search
    call winrestview(l:view)
endfunction
