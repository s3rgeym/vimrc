" Цветовая палитра
if exists('+termguicolors')
    " Используем 24-битные цвета
    set termguicolors
else
    " Используем 256 цветов
    set t_Co=256
endif

" Включить подсветку синтаксиса
syntax enable

" Установить темный фон
set background=dark

" Установливаем тему, подавляя вывод ошибок, если та отсутствует
silent! colorscheme gruvbox

" А так же тему для airline
let g:airline_theme = 'gruvbox'
