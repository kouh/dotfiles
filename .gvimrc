set background=dark
set guifont=Ricty:h16
set lines=40 columns=140
" 行番号の色を設定
hi Visual gui=reverse
hi LineNr guifg=#8A8A8A
set cursorline

function! ToggleTransparence()
  if &transparency > 0
    set transparency=0
  else
    set transparency=25
  endif
endfunction
" call ToggleTransparence()
nnoremap <silent> <D-u> :call ToggleTransparence()<CR>
