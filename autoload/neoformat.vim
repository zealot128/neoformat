let s:current_formatter_index = 0

function! neoformat#Neoformat(user_formatter) abort
    if !has('nvim')
        return neoformat#utils#warn('Neovim is currently required to run this plugin')
    endif

    if !empty(a:user_formatter)
        let formatter = a:user_formatter
    else
        let formatters = s:get_enabled_formatters(&filetype)
        if formatters == []
            call neoformat#utils#msg('formatter not defined for ' . &filetype . ' filetype')
            return neoformat#format#BasicFormat()
        endif

        if s:current_formatter_index >= len(formatters)
            call neoformat#utils#msg('attempted all formatters available for current filetype')
            return neoformat#format#BasicFormat()
        endif

        let formatter = formatters[s:current_formatter_index]
    endif

    if exists('g:neoformat_' . &filetype . '_' . formatter)
        let definition = g:neoformat_{&filetype}_{formatter}
    elseif exists('g:neoformat#' . &filetype . '#' . formatter)
        let definition =  g:neoformat#{&filetype}#{formatter}
    else
        call neoformat#utils#log('definition not found for formatter: ' . formatter)
        if !empty(a:user_formatter)
            call neoformat#utils#msg('formatter definition for ' . a:user_formatter . ' not found')
            return neoformat#format#BasicFormat()
        endif
        return neoformat#NextNeoformat()
    endif

    let cmd = neoformat#cmd#generate(definition)
    if cmd == {}
        if !empty(a:user_formatter)
            return neoformat#utils#log('user specified formatter failed')
        endif
        return neoformat#NextNeoformat()
    endif

    return neoformat#run#Neoformat(cmd)
endfunction

function! s:get_enabled_formatters(filetype) abort
    if exists('g:neoformat_enabled_' . a:filetype)
        return g:neoformat_enabled_{a:filetype}
    elseif exists('g:neoformat#enabled#' . a:filetype)
        return g:neoformat#enabled#{a:filetype}
    endif
    return []
endfunction

function! neoformat#CompleteFormatters(ArgLead, CmdLine, CursorPos)
    if a:ArgLead =~ '[^A-Za-z0-9]'
        return []
    endif
    return filter(s:get_enabled_formatters(&filetype),
                \ "v:val =~? '^" . a:ArgLead ."'")
endfunction

function! neoformat#NextNeoformat() abort
    call neoformat#utils#log('trying next formatter')
    let s:current_formatter_index += 1
    return neoformat#Neoformat('')
endfunction
