let g:mapleader = "\<Space>"

" Переключение в режим для вставки текста без автоматического форматирования
set pastetoggle=<F2>

" Различные сочетания клавиш
" Чтобы проверить не задано ли пльзовательское сочетание можно использовать
" `:map x` или `:verbose map x`, и `:help ctrl-n` для встроенных.

" Чтобы лишний раз Shift не нажимать
" Может конфликтовать с vim-sneak
nnoremap ; :

" Копировать всю строку
"nnoremap Y y$

" Смена раскладки
inoremap <C-L> <C-^>

" Выделить только что вставленный текст
nnoremap <leader>V V`]

" Убрать подсветку результатов поиска
" silent скрывает вывод команды
nnoremap <silent> <leader>h :nohl<cr>

" Переход в нормальный режим
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>

" Выделение всего текста
nnoremap <C-a> ggVG
inoremap <C-a> <Esc>ggVG

" Добавление и удаление отступов
nnoremap > >>
nnoremap < <<
vnoremap < <gv
vnoremap > >gv

" Выбор окна с зажатым Ctrl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Разбиение окон
nnoremap <leader><CR> :vsplit<CR>

" Хотя gt, gT для табов легко запомнить
nnoremap <C-Up> :tabprevious<CR>
nnoremap <C-Down> :tabnext<CR>
nnoremap <C-Right> :bn<CR>
nnoremap <C-Left> :bp<CR>

" Изменение размеров окна
nnoremap <A-Up> <C-w>-
nnoremap <A-Down> <C-w>+
nnoremap <A-Right> <C-w><
nnoremap <A-left> <C-w>>

" Выбрать буфер из списка
nnoremap <leader>l :ls<CR>:b<Space>

" Закрыть буфер
noremap <C-q> :bd!<CR>
inoremap <C-q> <Esc>:bd!<CR>

" Открыть новую вкладку
nnoremap <leader>t :tabnew<CR>

" Список вкладок
nnoremap <leader>tl :tabs<CR>

" Закрыть текущую вкладку
nnoremap <leader>tc :tabclose<CR>

" Закрыть все вкладки, кроме текущей
nnoremap <leader>to :tabonly<CR>

" Переместить текущую вкладку
nnoremap <leader>tm :tabmove<CR>

" Открыть файл в новой вкладке
nnoremap <leader>te :tabedit<Bar>

" Выбор вкладки
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

" Скрыть/раскрыть блок кода
nnoremap <leader>z za

" Сохранение и закрытие
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa<CR>

" Сохранить файлов с sudo
cmap w!! w !sudo tee > /dev/null %

" Редактирование конфига в новой вкладке
nnoremap <leader>ev :tabedit $MYVIMRC<CR>

" Применить конфиг
nnoremap <leader>sv :so $MYVIMRC<CR>

" Показать все текущие сопоставления клавиш
"nnoremap <Leader>m :<C-u>map<CR>

" Работа с терминалом
"nnoremap <leader>tt :<C-u>term<CR>
" tags все равно никто не использует
nnoremap <C-t> :<C-u>term<CR>

" Выход из режима редактирования во встроенном терминале
" На <Esc> эту связку почему-то нельзя повесить
tnoremap <C-[> <C-\><C-n>

" Скрыть/показать боковую панель с файлами
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

" Поиск по файлам
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>r :Rg<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>/ :BLines<CR>

" Настройка клавиш для LSP
function! SetupLspKeymaps() abort
  " Навигация
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

  " Прокрутка
  nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
  nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
endfunction

" Автодополнение
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup() : "\<CR>"
imap <C-@> <Plug>(asyncomplete_force_refresh)
