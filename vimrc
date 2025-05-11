" отключаем режим совместимости с vi
set nocompatible

" Путь до конфига
if empty($MYVIMRC) | let $MYVIMRC = expand('<sfile>:p') | endif

let $VIMHOME = expand('<sfile>:p:h')

execute 'source' expand('$VIMHOME/config/plugins.vim')
" Основные настройки могут быть переопределены в плагинах
execute 'source' expand('$VIMHOME/config/options.vim')
execute 'source' expand('$VIMHOME/config/keymaps.vim')
execute 'source' expand('$VIMHOME/config/theme.vim')
