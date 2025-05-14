" Включаем поддержку truecolor, если доступна
if exists('+termguicolors')
  set termguicolors
else
  set t_Co=256
endif

" Включаем подсветку синтаксиса и задаём тёмную тему
syntax enable
set background=dark

" Применяем цветовую схему, подавляя ошибки, если она недоступна
silent! colorscheme catppuccin_macchiato

if has('gui_running')
  set guifont=JetBrainsMono\ Nerd\ Font:h11
else
  " В том же gVim прозрачность не работает
  hi Normal ctermbg=NONE guibg=NONE
endif

" Настройка темы для airline (если автоматически не определяет)
"let g:airline_theme = 'gruvbox'

