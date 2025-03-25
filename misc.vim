" Перезапускаем kitty при изменении конфига
autocmd BufWritePost ~/.config/kitty/kitty.conf silent !pkill -SIGUSR1 kitty
