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
silent! colorscheme gruvbox

" Настройка темы для airline
let g:airline_theme = 'gruvbox'

