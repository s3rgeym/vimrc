" Клавиша лидер для пользовательских сочетаний
let g:mapleader = " "

" Переключить автоформатирование при вставке
" F3-F11 использует vimspector
set pastetoggle=<F2>

" Q вызывает бесполезный Ex mode
nnoremap Q <nop>

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

" Перемещение окон
nnoremap <A-h> <C-w>H
nnoremap <A-j> <C-w>J
nnoremap <A-k> <C-w>K
nnoremap <A-l> <C-w>L

" Изменение размеров окон
nnoremap <A-Up> <C-w>-
nnoremap <A-Down> <C-w>+
nnoremap <A-Right> <C-w><
nnoremap <A-Left> <C-w>>

" Переключение между буферами
nnoremap <C-Up> :bn<cr>
nnoremap <C-Down> :bp<cr>

" Переключение между табами
noremap <Tab> :tabnext<cr>
nnoremap <S-Tab> :tabprevious<cr>

" Разделение окон
nnoremap <leader>h :split<cr>
nnoremap <leader>v :vsplit<cr>

" Закрыть только текущий буфер
" Из-за того, что NERDTree открывает файлы в сплитах, просто вызов :bd закрывает
" все буферы
nnoremap <C-q> :bp<bar>bd #<cr>

" Закрыть текущее окно
nnoremap <C-x> :q<cr>

" Убрать подсветку результатов поиска
" nnoremap <Esc> в Kitty не работает
" Это сочетание может в плагинах использоваться
nnoremap <silent> <leader>n :nohl<cr>

" Edit vimrc
nnoremap <leader>ev :edit $MYVIMRC<cr>

" Source vim
nnoremap <leader>sv :so $MYVIMRC<cr>

" Поиск и замена
" Замена слова под курсором
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" Замена выделенного текста
vnoremap <Leader>r "hy:%s/<C-r>h//gc<Left><Left><Left>

" Переключить проверку орфографии
nnoremap <leader>ss :setlocal spell!<CR>

" Интегрированный терминал
nnoremap <C-`> :<C-u>term<cr>
tnoremap <C-`> <C-\><C-n>:bd!<cr>

" NERDTree
nnoremap <C-n> :NERDTreeToggle<cr>

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

" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
