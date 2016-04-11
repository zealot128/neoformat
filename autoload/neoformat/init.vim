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


function! neoformat#init#Neoformat(start, userCMD) abort
    if !has('nvim')
        echom 'Neoformat: Neovim is currently required to run this plugin'
        return
    endif

    " start argument is used for selecting different formatters
    " usually after the first one fails
    let l:index = a:start !=? '' ? a:start : 0

    let l:fmter = s:getFormatter(a:userCMD)

    let l:filetype = s:getFiletype(a:userCMD)

    let g:neoformat#run#formatterscur = l:index

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
        call neoformat#format#BasicFormat()
        return
    endif

    let l:cmd = neoformat#cmd#GenCmd(l:definition)
    if l:cmd ==# ''
        echom 'Neoformat: error creating cmd'
        return
    endif

    call neoformat#run#Neoformat(l:cmd)
endfunction
