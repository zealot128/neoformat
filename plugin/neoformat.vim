command! Neoformat call g:neoformat#Neoformat(0)

autocmd! BufWipeout,BufDelete,BufLeave,BufWinLeave,QuitPre <buffer> call g:neoformat#KillAll()
