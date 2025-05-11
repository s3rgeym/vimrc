" Задаем путь до конфига, если тот не был задан
" Переменные в верхнем регистре являются глобальными
if empty($MYVIMRC) | let $MYVIMRC = expand('<sfile>:p') | endif

let s:script_dir = expand('<sfile>:p:h')
let $VIMHOME = s:script_dir

" отключаем режим совместимости с vi
set nocompatible

" В Vim 9 можно через рантайм подлючать скрипты в текущей директории
" gf чтобы открыть файл (gx — ссылку)
runtime config/plugins.vim
" Основные настройки могут быть переопределены в плагинах
runtime config/options.vim
runtime config/keymaps.vim
runtime config/theme.vim
