" отключаем режим совместимости с vi
set nocompatible

" Эта переменная окружения используется в текущих настройках, но может быть не
" задана
if !exists('$MYVIMRC')
  " Эта переменная будет доступна в подключаемых через source скриптах
  let $MYVIMRC = expand('<sfile>:p')
endif

" gf откроет файл в редакторе
source ~/.vim/config/plugins.vim

" Основные настройки должны идти после плагинов, тк многое может быть переопределено в плагинах
source ~/.vim/config/options.vim
source ~/.vim/config/maps.vim
source ~/.vim/config/theme.vim
