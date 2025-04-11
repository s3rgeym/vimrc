" Клавиша лидер для пользовательских сочетаний
let g:mapleader = " "

" Переключить автоформатирование при вставке
set pastetoggle=<F2>

" Переключить проверку орфографии
nnoremap <F6> :set spell!<CR>

" Q вызывает бесполезный Ex mode
" Удалить буфер
nnoremap Q :q<cr>

" Добавление отступов
nnoremap > >>
nnoremap < <<
vnoremap < <gv
vnoremap > >gv

" Выделить все
" NOTE: `source $VIMRUNTIME/mswin.vim` добавит все привычные сочетания
nnoremap <C-a> ggVG
inoremap <C-a> <Esc>ggVG

" Выделить вставленный текст
nnoremap <leader>V V`]

" Сохранение файлов
nnoremap <C-s> :w<cr>
inoremap <C-s> <C-o>:w<cr>
cmap w!! w !sudo tee > /dev/null %

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

" Переключение между буферами
" Можно использовать Ctrl+Up/Down, на которые навешена прокрутка
nnoremap <Tab> :bn<cr>
nnoremap <S-Tab> :bp<cr>

" Разделение окон
nnoremap <leader>s :split<cr>
nnoremap <leader>v :vsplit<cr>

" Закрыть только текущий буфер
"nnoremap <C-c> :bp<bar>bd #<cr>
nnoremap <leader>d :bp\|bd #<cr>

" Убрать подсветку результатов поиска
" nnoremap <Esc> в Kitty не работает
" Это сочетание может в плагинах использоваться
nnoremap <silent> <leader><leader> :nohl<cr>
nnoremap <silent> \\ :nohl<cr>

" Edit Vimrc
nnoremap <leader>ev :tabedit $MYVIMRC<cr>

" Realod Vimrc
nnoremap <leader>rv :so $MYVIMRC<cr>

" Интегрированный терминал
nnoremap <C-t> :<C-u>term<cr>
tnoremap <C-t> <C-\><C-n>

" NERDTree
nnoremap <silent> <leader>p :NERDTreeToggle<cr>

" Поиск
nnoremap <silent> <leader>f :Files<cr>
nnoremap <silent> <leader>/ :Rg<cr>
nnoremap <silent> <leader>b :Buffers<cr>

" LSP
function! SetupLspKeymaps() abort
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gs <plug>(lsp-document-symbol-search)
  nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)
  nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
  nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
endfunction

" Автодополнение
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() : "\<CR>"
imap <C-@> <Plug>(asyncomplete_force_refresh)
