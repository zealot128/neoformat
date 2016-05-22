command! -nargs=? -bar -complete=customlist,neoformat#CompleteFormatters Neoformat
            \ call neoformat#Neoformat(<q-args>)

autocmd! BufWipeout,BufDelete,BufLeave,BufWinLeave,QuitPre <buffer>
            \ call neoformat#run#KillAll()
