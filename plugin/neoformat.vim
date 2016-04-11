command! -nargs=? Neoformat call neoformat#init#Neoformat(0, <q-args>)

autocmd! BufWipeout,BufDelete,BufLeave,BufWinLeave,QuitPre <buffer> call neoformat#run#KillAll()
