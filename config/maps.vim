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
nnoremap <C-s> :w<cr>
inoremap <C-s> <C-o>:w<cr>

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
" nnoremap <C-Left> <C-w>h
" nnoremap <C-Down> <C-w>j
" nnoremap <C-Up> <C-w>k
" nnoremap <C-Right> <C-w>l

" Изменение размеров окон
nnoremap <A-Up> <C-w>-
nnoremap <A-Down> <C-w>+
nnoremap <A-Right> <C-w><
nnoremap <A-Left> <C-w>>

" Разделение окон
" <leader>s неудобно использовать, так как он есть сочетание с <leader>sv и
" вместо применения конфига, часто будет просходить разбиение экрана
nnoremap <leader>s :split<cr>
"nnoremap <leader>- :split<cr>
nnoremap <leader>v :vsplit<cr>
"nnoremap <leader>\ :vsplit<cr>

" -----------------------------------------------
"  Управление вкладками
" -----------------------------------------------

" Навигация по вкладкам
" Для переключения между табами можно использовать Ctrl + PageUp/PageDown
nnoremap <Tab> :tabnext<cr>
nnoremap <S-Tab> :tabprev<cr>

" Создание и управление вкладками
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>tl :tabs<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tm :tabmove<cr>
nnoremap <leader>te :tabedit<bar>

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
nnoremap <leader>0 :tablast<cr>

" -----------------------------------------------
"  Работа с буферами
" -----------------------------------------------

" Навигация по буферам
" По умолчанию на эти клавиши повешана прокрутка
" Ctrl + Left/Right для перемещения по словам используется, что удобно
nnoremap <C-Up> :bp<cr>
nnoremap <C-Down> :bn<cr>

" Просмотр и выбор буферов
"nnoremap <leader>b :ls<cr>:b<Space>

" Закрытие буфера
nnoremap bd :bd!<cr>

" -----------------------------------------------
"  Поиск
" -----------------------------------------------

" Отключение подсветки результатов поиска
nnoremap <silent> <leader>h :nohl<cr>

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
nnoremap <leader>e :edit $MYVIMRC<cr>

" Применение изменений конфигурации
nnoremap <leader>r :so $MYVIMRC<cr>

" -----------------------------------------------
"  Интеграция с терминалом
" -----------------------------------------------

" Открытие встроенного терминала
nnoremap <C-t> :<C-u>term<cr>

" Выход из режима терминала
tnoremap <C-t> <C-\><C-n>

" ==============================================================================
"                       НАСТРОЙКИ ДЛЯ ПЛАГИНОВ
" ==============================================================================

" -----------------------------------------------
"  NERDTree
" -----------------------------------------------

nnoremap <silent> <leader>n :NERDTreeToggle<cr>

" -----------------------------------------------
"  fzf
" -----------------------------------------------

" Поиск по файлам
nnoremap <silent> <leader>p :Files<cr>

" Поиск по содержимому (ripgrep)
nnoremap <silent> <leader>f :Rg<cr>

" Выбор буфера
nnoremap <silent> <leader>b :Buffers<cr>

" Поиск по текущему файлу
nnoremap <silent> <leader>/ :BLines<cr>

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
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() : "\<CR>"

" Принудительное обновление автодополнения
imap <C-@> <Plug>(asyncomplete_force_refresh)
