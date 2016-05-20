let s:current_formatter_index = 0

function! neoformat#Neoformat(user_cmd) abort
    if !has('nvim')
        return neoformat#utils#warn('Neovim is currently required to run this plugin')
    endif

    try
        let definition = s:get_definition(a:user_cmd)
    catch /^error/
        call neoformat#utils#log('error caught when getting defintion')
        return neoformat#format#BasicFormat()
    endtry

    call neoformat#utils#log('definition.exe: ' . definition.exe)

    try
        let cmd = neoformat#cmd#generate(definition)
    catch /^error/
        if a:user_cmd != ''
            return neoformat#utils#log('user cmd did not work. exiting')
        endif
        call neoformat#utils#log('trying next formatter')
        let s:current_formatter_index += 1
        return neoformat#Neoformat('')
    endtry

    return neoformat#run#Neoformat(cmd)
endfunction

function! s:get_definition(user_cmd) abort
    call neoformat#utils#log('getting definition. user cmd: ' . a:user_cmd)
    if !empty(a:user_cmd)
        if exists('g:neoformat_' . &filetype . '_' . a:user_cmd)
            return g:neoformat_{&filetype}_{a:user_cmd}
        endif
        if exists('g:neoformat#' . &filetype . '#' . a:user_cmd)
            return g:neoformat#{&filetype}#{a:user_cmd}
        endif
        echom 'Neoformat: formatter definition for ' . a:user_cmd . ' not found'
        throw 'error'
    endif
    let i = s:current_formatter_index
    if exists('g:neoformat_enabled_' . &filetype)
        let formatters = g:neoformat_enabled_{&filetype}
        if i >= len(formatters)
            throw 'error'
        endif
        let formatter = formatters[i]
        return g:neoformat_{&filetype}_{formatter}
    elseif exists('g:neoformat#enabled#' . &filetype)
        let formatters = g:neoformat#enabled#{&filetype}
        if i >= len(formatters)
            throw 'error'
        endif
        let formatter = g:neoformat#enabled#{&filetype}[i]
        return g:neoformat#{&filetype}#{formatter}
    endif
    throw 'error'
endfunction
