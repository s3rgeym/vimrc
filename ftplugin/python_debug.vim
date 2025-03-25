" Отладка Python с pdb
nnoremap <buffer> <F5> :w<CR>:term python -m pdb -c continue %<CR>
nnoremap <buffer> <F9> :call ToggleBreakpoint()<CR>
nnoremap <buffer> <F10> :%s/^\s*breakpoint()\s*$//e<CR>:w<CR>

" Функция для переключения брейкпоинта
function! ToggleBreakpoint()
  let line = getline('.')
  if line =~# '^\s*breakpoint()'
    execute "silent! .d"
    echo "Breakpoint removed"
  else
    execute "normal! Obreakpoint()"
    echo "Breakpoint added"
  endif
  write
endfunction
