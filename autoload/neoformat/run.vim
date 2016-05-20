let s:jobs = {}

function! neoformat#run#Neoformat(cmd) abort
    let job = {
        \ 'stderr':    [],
        \ 'stdout':    [],
        \ 'on_stdout': function('s:on_stdout'),
        \ 'on_stderr': function('s:on_stderr'),
        \ 'on_exit':   function('s:on_exit'),
        \ }

    let id = jobstart(a:cmd.exe, job)

    let job.id       = id
    let job.name     = a:cmd.name
    let job.replace  = a:cmd.replace
    let job.path     = a:cmd.path
    let job.filetype = a:cmd.filetype

    let s:jobs[id] = job
endfunction

function! s:on_stdout(job_id, data) abort
    if !has_key(s:jobs, a:job_id)
        return
    endif
    let job = s:jobs[a:job_id]

    call extend(job.stdout, a:data)
endfunction

function! s:on_stderr(job_id, data) abort
    if !has_key(s:jobs, a:job_id)
        return
    endif
    let job = s:jobs[a:job_id]

    call extend(job.stderr, a:data)
endfunction

function! s:on_exit(job_id, data) abort
    if !has_key(s:jobs, a:job_id)
        return
    endif
    let job = s:jobs[a:job_id]

    call neoformat#format#update_file(job)

    unlet s:jobs[a:job_id]
endfunction

function! neoformat#run#KillAll() abort
    if empty(s:jobs)
        return
    endif

    for id in keys(s:jobs)
        if id > 0
            silent! call jobstop(id)
        endif
    endfor

    let s:jobs = {}
endfunction
