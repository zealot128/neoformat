command! Neoformat call g:neoformat#Neoformat(0)

autocmd! BufWipeout,BufDelete,BufLeave,BufWinLeave <buffer> call g:neoformat#KillAll()
