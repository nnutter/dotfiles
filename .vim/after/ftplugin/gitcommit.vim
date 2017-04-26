augroup DisableLastPositionJump
    autocmd! BufWinEnter <buffer> execute 'normal! gg0' | autocmd! DisableLastPositionJump BufWinEnter <buffer>
augroup END
