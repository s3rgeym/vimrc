" Совместимость с Kitty

" Убираем артефакты терминала
" https://github.com/kovidgoyal/kitty/issues/1536
set t_RV=

" Перезапускаем kitty при изменении конфига
autocmd BufWritePost ~/.config/kitty/kitty.conf silent !pkill -SIGUSR1 kitty
