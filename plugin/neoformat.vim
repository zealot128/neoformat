command! -nargs=? Neoformat call g:neoformat#Neoformat(0, <q-args>)

autocmd! BufWipeout,BufDelete,BufLeave,BufWinLeave,QuitPre <buffer> call g:neoformat#KillAll()
