let s:jobs = {}

function! s:job_id(job)
    " 8 is the type Job
    if type(a:job) == 8
        let i = job_getchannel(a:job)
    else
        let i = a:job
    endif
    return split(i)[1]
endfunction

function! neoformat#run#Neoformat(cmd) abort

    if has('nvim')
        let id = jobstart(a:cmd.exe, {
            \ 'on_stdout': function('s:on_stdout'),
            \ 'on_exit':   function('s:on_exit'),
            \ })
    else
        let id = s:job_id(job_start(a:cmd.exe, {
          \ 'out_cb': function('s:on_stdout_vim'),
          \ })
          \ )
    endif

    let job          = {}
    let job.stdout   = []
    let job.name     = a:cmd.name
    let job.replace  = a:cmd.replace
    let job.path     = a:cmd.path
    let job.filetype = a:cmd.filetype

    let s:jobs[id]   = job
endfunction

function! s:on_stdout(job_id, data) abort
    if !has_key(s:jobs, a:job_id)
        return
    endif
    let job = s:jobs[a:job_id]

    call extend(job.stdout, a:data)
endfunction

function! s:on_stdout_vim(job, data)
    let id = s:job_id(a:job)

    if !has_key(s:jobs, id)
        return
    endif

    let job = s:jobs[id]

    if a:data == 'DETACH'
        return s:on_exit(id, job.stdout)
    endif

    call extend(job.stdout, [a:data])
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
