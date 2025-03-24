if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Автоматически ставим отсутствующие плагины
" :PlugUpgrade — для обновления самого plug.vim
" :PlugClean — для удаления неиспользуемых плагинов
autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | source $MYVIMRC
      \| endif


call plug#begin('~/.vim/plugged')

" Добавляем плагины сюда
" Настройки по умолчанию для Vim
Plug 'tpope/vim-sensible'

" Файловый менеджер
Plug 'preservim/nerdtree'

" Нечеткий поиск
Plug 'junegunn/fzf.vim'

" Автоматическое закрытие скобок и кавычек
Plug 'jiangmiao/auto-pairs'

" Оборачивает текст по сочетанию клавиш кавычками, тегами и тп
Plug 'tpope/vim-surround'

" Комментирование строк кода (gc)
Plug 'tpope/vim-commentary'

" Показываем изменения в Git
Plug 'airblade/vim-gitgutter'

" Содержит команды для работы с Git
Plug 'tpope/vim-fugitive'

" Поддержка LSP
Plug 'prabirshrestha/vim-lsp'

" Автоматическая настройка языковых серверов для vim-lsp
Plug 'mattn/vim-lsp-settings'

" Автодополнение
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Задание настроек форматирования через .editorconfig
Plug 'editorconfig/editorconfig-vim'

" Дебаггер
Plug 'puremourning/vimspector'

" Строка статуса
Plug 'vim-airline/vim-airline'

" Тема для vim-airline
Plug 'vim-airline/vim-airline-themes'

" Иконки для файлов и папок
Plug 'ryanoasis/vim-devicons'

" Разноцветная подсветка скобок
Plug 'luochen1990/rainbow'

" Тема
Plug 'morhetz/gruvbox'

call plug#end()


" NERDTree
" Показать или скрыть файловый проводник
nnoremap <leader>t :NERDTreeToggle<CR>

" Показывать скрытые файлы
let NERDTreeShowHidden=1

augroup NERDTree
  " Запустить NERDTree и вернуть курсор в другое окно.
  autocmd VimEnter * NERDTree | wincmd p
  " Закрыть Vim, если NERDTree остался единственным окном в единственной вкладке.
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
  " Закрыть вкладку, если NERDTree остался единственным окном в ней.
  autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
augroup END


" fzf
" Размеры всплывающего окна для поиска
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6 } }

" Если вместо Ctrl-C нажать Esc, то чтобы вернуть фокус нужно нажать i
" Поиск по имени файла в текущем проекте
nnoremap <leader>f :Files<CR>

" Рекурсивный поиск по содержимому
nnoremap <leader>g :Rg<CR>

" Поиск в открытых буферах
nnoremap <leader>b :Buffers<CR>

" Поиск строк в текущем буфере
nnoremap <leader>/ :BLines<space><CR>


" Если установлен editorconfig, то используем его
if executable('editorconfig')
  let g:EditorConfig_core_mode = 'external_command'
  let g:EditorConfig_exec_path = exepath('editorconfig')
endif


" vim-lsp
" Например, для поддержки Python нужно установить сл пакеты:
" sudo pacman -S python-lsp-server autopep8 flake8 python-pylint python-rope
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
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

  "let g:lsp_format_sync_timeout = 1000
  "autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
  
  " refer to doc to add more commands
  autocmd BufWritePre * LspDocumentFormat
endfunction

augroup lsp_install
  " удаляет все ранее зарегистрированные события для группы lsp_install
  au!
  " call s:on_lsp_buffer_enabled only for languages that has the server registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


" autocompolete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" В vim не работает <C-Space>
imap <c-@> <Plug>(asyncomplete_force_refresh)


" vimspector
" Включаем сочетания клавиш для vimspector
let g:vimspector_enable_mappings = 'HUMAN'


" Включаем иконки для файлов и папок
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1


" Общие настройки для airline/lightline
" Не показывать текущий режим в строке статуса
set noshowmode

" Всегда показывать строку состояния
set laststatus=2

" Всегда показывать строку с вкладками
set showtabline=2

" Настройки для vim-airline
" Включаем отображение вкладок
let g:airline#extensions#tabline#enabled = 1

" Показывать номера буферов
let g:airline#extensions#tabline#buffer_nr_show = 1

" Включаем поддержку Powerline шрифтов
let g:airline_powerline_fonts = 1

" Включить отображение информации о сочетании клавиш
let g:airline#extensions#keymap#enabled = 1
