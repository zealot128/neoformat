let s:jobs = {}

" stores the current formatter being used among the formatters defined for the filetype
let s:formatters_cur = 0

function! g:neoformat#NeoformatRun(cmd) abort

    let l:job = {
                \ 'stderr' : [],
                \ 'stdout' : [],
                \ 'on_stdout': function('s:on_stdout'),
                \ 'on_stderr': function('s:on_stderr'),
                \ 'on_exit' : function('s:on_exit'),
                \ }

    if type(a:cmd) ==# type([])
        let l:cmd = a:cmd
    else
        let l:cmd = split(a:cmd)
    endif

    try
        let l:id = jobstart(l:cmd, l:job)
    catch
        echom 'Neoformat: trying next formatter'
        call g:neoformat#Neoformat(s:formatters_cur + 1)
        return
    endtry

    let l:job.id = l:id

    let s:jobs[l:id] = l:job
endfunction


function! s:on_stdout(job_id, data) abort
    if !has_key(s:jobs, a:job_id)
        return
    endif
    let l:job = s:jobs[a:job_id]

    call extend(l:job.stdout, a:data)
endfunction


function! s:on_stderr(job_id, data) abort
    if !has_key(s:jobs, a:job_id)
        return
    endif
    let l:job = s:jobs[a:job_id]

    call extend(l:job.stderr, a:data)
endfunction


function! s:on_exit(job_id, data) abort
    if !has_key(s:jobs, a:job_id)
        return
    endif
    let l:job = s:jobs[a:job_id]

    " take the output from the formatter and insert it into the file
    let l:data = l:job.stdout
    call s:UpdateFile(l:data)

    unlet s:jobs[a:job_id]
endfunction


function! g:neoformat#KillAll() abort
    if empty(s:jobs)
        return
    endif

    for l:id in keys(s:jobs)
        if l:id > 0
            silent! call jobstop(l:id)
        endif
    endfor

    let s:jobs = {}
endfunction


function! s:UpdateFile(data) abort
    if len(a:data) < 1
        echom 'Neoformat: no data was provided by formatter program'
        return
    endif

    let l:last = len(a:data)-1
    let l:end = a:data[l:last]

    " needed for some formatters that add empty new lines at the end of files
    " ex: remark
    if l:end ==# ''
        let l:datalen = len(a:data)
    else
        let l:datalen = len(a:data) + 1
    endif

    " cleanup the end of the file
    while l:datalen <= line('$')
        call setline(l:datalen, '')
        let l:datalen += 1
    endwhile

    call s:TrimTrailingNewLines()

    " remove extra newlines at the end of formatted file data
    if l:end ==# ''
        call remove(a:data, l:last)
    endif

    " ensure file needs to be changed
    let l:lines = getbufline(bufnr('%'), 1, '$')
    if a:data ==# l:lines
        echom 'Neoformat: no change necessary'
        return
    endif

    " setline() is used instead of writefile() so that marks, jumps, etc. are kept
    call setline(1, a:data)
    echom 'Neoformat: formatted file'
endfunction


function! s:genCmd(definition) abort

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

    "/Users/sloth/documents/example.vim
    let l:fullfilepath = fnameescape(expand('%:p'))

    if l:noappend
        let s:path = ''
    else
        let s:path = l:fullfilepath
    endif

    " make sure there aren't any double spaces in the cmd
    let l:_fullcmd = l:cmd . ' ' . join(l:flags) . ' ' . s:path
    let l:fullcmd = join(split(l:_fullcmd))

    return l:fullcmd
endfunction


function! s:BasicFormat() abort
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
        execute 'normal gg=G'
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
        %s/\s\+$//e
        " vint: +ProhibitCommandRelyOnUser +ProhibitCommandWithUnintendedSideEffect
        let @/=l:search
        call winrestview(l:view)
    endif
endfunction


function! s:TrimTrailingNewLines() abort
    let l:search = @/
    let l:view = winsaveview()
    " http://stackoverflow.com/a/7496112/3720597
    " vint: -ProhibitCommandRelyOnUser -ProhibitCommandWithUnintendedSideEffect
    silent! %s#\($\n\)\+\%$##
    " vint: +ProhibitCommandRelyOnUser +ProhibitCommandWithUnintendedSideEffect
    let @/=l:search
    call winrestview(l:view)
endfunction


function! s:getFormatter(arg) abort
    let l:s = split(a:arg, '/', 1)

    if len(l:s) > 1
        let l:formatter = l:s[1]
        " need to remove all `-` since vim's variable definitions can't use
        " them
        return substitute(l:formatter, '-', '','g')
    endif

    return ''
endfunction


function! s:getFiletype(arg) abort
    if a:arg ==# ''
        return &filetype
    endif
    let l:s = split(a:arg, '/', 1)

    return l:s[0]
endfunction


function! g:neoformat#Neoformat(start, userCMD) abort
    if !has('nvim')
        echom 'Neoformat: Neovim is currently required to run this plugin'
        return
    endif

    " start argument is used for selecting different formatters
    " usually after the first one fails
    let l:index = a:start !=? '' ? a:start : 0

    let l:fmter = s:getFormatter(a:userCMD)

    let l:filetype = s:getFiletype(a:userCMD)

    let s:formatters_cur = l:index

    " Check the current filetype for formatters
    " check user defined formatters
    if exists('g:neoformat_enabled_' . l:filetype)

        let l:formatters = g:neoformat_enabled_{l:filetype}

        " check for user specified formatter first
        if l:fmter !=# ''
            let l:formatter = l:fmter
        elseif get(l:formatters, l:index, -1) != -1
            let l:formatter = l:formatters[l:index]
        else
            echom 'Neoformat: no formatter found at list index ' . l:index
            return
        endif

        let l:definition = g:neoformat_{l:filetype}_{l:formatter}

    " check for default formatters
    elseif exists('g:neoformat#enabled#' . l:filetype)

        let l:formatters = g:neoformat#enabled#{l:filetype}

        " check for user specified formatter first
        if l:fmter !=# ''
            let l:formatter = l:fmter
        elseif get(l:formatters, l:index, -1) != -1
            let l:formatter = l:formatters[l:index]
        else
            echom 'Neoformat: no formatter found at list index ' . l:index
            return
        endif

        let l:definition = g:neoformat#{l:filetype}#{l:formatter}

    else
        call s:BasicFormat()

        return
    endif

    let l:cmd = s:genCmd(l:definition)
    if l:cmd ==# ''
        echom 'Neoformat: error creating cmd'
        return
    endif

    call g:neoformat#NeoformatRun(l:cmd)
endfunction
