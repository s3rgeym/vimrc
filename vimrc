" https://ru.wikibooks.org/wiki/Vim (gx для открытия ссылки в браузере)
" отключаем режим совместимости с vi
set nocompatible

" Эта переменная окружения используется в текущих настройках, но может быть не
" задана
if !exists('$MYVIMRC')
  let $MYVIMRC = expand('<sfile>:p')
endif

" чтобы открыть файл под курсором используй gf
source ~/.vim/config/plugins.vim

" основные настройки должны идти после плагинов, тк в них многое может быть переопределено в плагинах
source ~/.vim/config/options.vim
source ~/.vim/config/mappings.vim
source ~/.vim/config/theme.vim
source ~/.vim/config/misc.vim
