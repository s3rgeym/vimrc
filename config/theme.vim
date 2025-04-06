" Цветовая палитра
if exists('+termguicolors')
  set termguicolors
else
  set t_Co=256
endif

syntax enable
set background=dark
silent! colorscheme gruvbox

let g:airline_theme = 'gruvbox'

