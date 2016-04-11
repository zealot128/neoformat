let s:jobs = {}

" stores the current formatter being used among the formatters defined for the filetype
let g:neoformat#run#formatterscur = 0

function! neoformat#run#Neoformat(cmd) abort

    let l:job = {
                \ 'stderr' : [],
                \ 'stdout' : [],
                \ 'on_stdout': function('s:on_stdout'),
                \ 'on_stderr': function('s:on_stderr'),
                \ 'on_exit' : function('s:on_exit'),
                \ }

    try
        let l:id = jobstart(a:cmd, l:job)
    catch
        echom 'Neoformat: trying next formatter'
        call neoformat#Neoformat(g:neoformat#run#formatterscur + 1)
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
    call neoformat#format#UpdateFile(l:job.stdout)

    unlet s:jobs[a:job_id]
endfunction


function! neoformat#run#KillAll() abort
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
