" ==============================================================================
"                       НАСТРОЙКИ КЛАВИШНЫХ СОЧЕТАНИЙ
" ==============================================================================

" -----------------------------------------------
"  Базовые настройки
" -----------------------------------------------

" Основной префикс для пользовательских команд
let g:mapleader = "\<Space>"

" Быстрое переключение в режим вставки без автоформатирования
set pastetoggle=<F2>

" Упрощение ввода команд (замена Shift+; на ;)
" Примечание: может конфликтовать с vim-sneak
nnoremap ; :

" -----------------------------------------------
"  Управление текстом и отступами
" -----------------------------------------------

" Работа с отступами
nnoremap > >>
nnoremap < <<
vnoremap < <gv
vnoremap > >gv

" Выделение всего текста в файле
nnoremap <C-a> ggVG
inoremap <C-a> <Esc>ggVG

" С помощью `source $VIMRUNTIME/mswin.vim` можно добавить все стандартные сочтения для Windows

" Выделение последнего вставленного текста
nnoremap <leader>V V`]

" -----------------------------------------------
"  Работа с файлами
" -----------------------------------------------

" Быстрое сохранение
nnoremap <C-s> :w<CR>
inoremap <C-s> <C-o>:w<CR>

" Сохранение с правами root
cmap w!! w !sudo tee > /dev/null %

" -----------------------------------------------
"  Навигация между окнами
" -----------------------------------------------

" Перемещение между окнами
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Изменение размеров окон
nnoremap <A-Up> <C-w>-
nnoremap <A-Down> <C-w>+
nnoremap <A-Right> <C-w><
nnoremap <A-Left> <C-w>>

" Разделение окон
nnoremap <leader>h :split<CR>
nnoremap <leader>- :split<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>\ :vsplit<CR>

" -----------------------------------------------
"  Управление вкладками
" -----------------------------------------------

" Навигация по вкладкам
" Можно использовать встроенные Ctrl + PageUp/PageDown
" По умолчанию на эти клавиши повешана прокрутка
nnoremap <C-Up> :tabprevious<CR>
nnoremap <C-Down> :tabnext<CR>

" Создание и управление вкладками
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>tl :tabs<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tm :tabmove<CR>
nnoremap <leader>te :tabedit<Bar>

" Быстрый переход по вкладкам (1-9)
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<CR>

" -----------------------------------------------
"  Работа с буферами
" -----------------------------------------------

" Навигация по буферам
" Эти клавиши используются для навигации по словам
"nnoremap <C-Right> :bn<CR>
"nnoremap <C-Left> :bp<CR>
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

" Просмотр и выбор буферов
nnoremap <leader>l :ls<CR>:b<Space>

" Закрытие окон
nnoremap Q :q!<CR>

" Удаление буферов
noremap <C-x> :bd!<CR>
inoremap <C-x> <Esc>:bd!<CR>

" -----------------------------------------------
"  Поиск
" -----------------------------------------------

" Отключение подсветки результатов поиска
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" -----------------------------------------------
"  Переключение режимов
" -----------------------------------------------

" Выход в нормальный режим
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>

" -----------------------------------------------
"  Конфигурация Vim
" -----------------------------------------------

" Редактирование конфигурации
nnoremap <leader>ev :tabedit $MYVIMRC<CR>

" Применение изменений конфигурации
nnoremap <leader>sv :so $MYVIMRC<CR>

" -----------------------------------------------
"  Интеграция с терминалом
" -----------------------------------------------

" Открытие встроенного терминала
nnoremap <C-t> :<C-u>term<CR>

" Выход из режима терминала
tnoremap <C-t> <C-\><C-n>

" ==============================================================================
"                       НАСТРОЙКИ ДЛЯ ПЛАГИНОВ
" ==============================================================================

" -----------------------------------------------
"  NERDTree
" -----------------------------------------------

nnoremap <silent> <leader>n :NERDTreeToggle<CR>

" -----------------------------------------------
"  fzf
" -----------------------------------------------

" Поиск по файлам
nnoremap <silent> <leader>f :Files<CR>

" Поиск по содержимому (ripgrep)
nnoremap <silent> <leader>r :Rg<CR>

" Поиск по открытым буферам
nnoremap <silent> <leader>b :Buffers<CR>

" Поиск по текущему файлу
nnoremap <silent> <leader>/ :BLines<CR>

" -----------------------------------------------
"  LSP (Language Server Protocol)
" -----------------------------------------------

function! SetupLspKeymaps() abort
  " Навигация по коду
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gs <plug>(lsp-document-symbol-search)
  nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)

  " Рефакторинг
  nmap <buffer> <leader>rn <plug>(lsp-rename)

  " Диагностика
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)

  " Прокрутка документации
  nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
  nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
endfunction

" -----------------------------------------------
"  Автодополнение
" -----------------------------------------------

" Навигация по меню автодополнения
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Подтверждение выбора
inoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup() : "\<CR>"

" Принудительное обновление автодополнения
imap <C-@> <Plug>(asyncomplete_force_refresh)
