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

" Изменение размеров окна
" Изменение вертикального размера не особо нужно
nnoremap + <C-w>>
nnoremap _ <C-w><
"nnoremap <M-Down> <C-w>+
"nnoremap <M-Up> <C-w>-

" Разбиение окон
nnoremap <leader><CR> :vsplit<CR>

" Хотя gt, gT для табов легко запомнить
nnoremap <M-Left> :tabprevious<CR>
nnoremap <M-Right> :tabnext<CR>

nnoremap <M-Up> :bp<CR>
nnoremap <M-Down> :bn<CR>

" Выбрать буфер из списка
nnoremap <leader>l :ls<CR>:b<Space>

" Закрыть буфер
" https://github.com/preservim/nerdtree/issues/400
noremap <C-x> :bp<cr>:bd #<cr>
inoremap <C-x> <Esc>:bp<cr>:bd #<cr>

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
nnoremap <leader>te :tabedit |

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
nnoremap <leader>ev :e $MYVIMRC<CR>

" Применить конфиг
nnoremap <leader>sv :so $MYVIMRC<CR>

" Показать все текущие сопоставления клавиш
"nnoremap <Leader>m :<C-u>map<CR>


" Работа с терминалом
nnoremap <leader>tt :<C-u>term<CR>

" Выход из режима редактирования во встроенном терминале
tnoremap <C-[> <C-\><C-n>

" Отладка
 nnoremap <leader>pd :tab term pudb %<CR>
