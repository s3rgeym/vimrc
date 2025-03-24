" отключаем реждим совместимости с vi
set nocompatible

if !exists('$MYVIMRC')
  let $MYVIMRC = expand('<sfile>:p')
endif

" чтобы открыть файл под курсором используй gf
source ~/.vim/plugins.vim

" основные настройки должны идти после плагинов, тк в них многое переопределяется
source ~/.vim/settings.vim
source ~/.vim/keymaps.vim
source ~/.vim/theme.vim
source ~/.vim/misc.vim
