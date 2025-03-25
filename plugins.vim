" Установка vim-plug если отсутствует
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Автоустановка плагинов
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \| PlugInstall --sync | source $MYVIMRC
      \| endif

" Инициализация плагинов
call plug#begin('~/.vim/plugged')

" Базовые плагины
Plug 'tpope/vim-sensible'

" Файловый менеджер
Plug 'preservim/nerdtree'

" Нечеткий поиск по буферам и файлам
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Автоматическое закрытие парных скобок
Plug 'jiangmiao/auto-pairs'

" gc, gcc — для комментаривания
Plug 'tpope/vim-commentary'

" Git интеграция
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" LSP
Plug 'prabirshrestha/vim-lsp'

" Автотатическая настройка языковых серверов для vim-lsp
Plug 'mattn/vim-lsp-settings'

" Автодополнение
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'

" Debugger

" Поддержка .editorconfig
Plug 'editorconfig/editorconfig-vim'

" Красивый статус
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Иконки
Plug 'ryanoasis/vim-devicons'

" Темы
Plug 'morhetz/gruvbox'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'joshdick/onedark.vim'

call plug#end()

" NERDTree
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

augroup nerdtree_config
  autocmd!
  autocmd VimEnter * NERDTree | wincmd p
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup END

" fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6 } }
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>r :Rg<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>/ :BLines<CR>

" editorconfig
if executable('editorconfig')
  let g:EditorConfig_core_mode = 'external_command'
  let g:EditorConfig_exec_path = exepath('editorconfig')
endif

" Настройка LSP
function! s:setup_lsp() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

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

  " Форматирование
  autocmd BufWritePre <buffer> LspDocumentFormatSync
endfunction

augroup lsp_config
  autocmd!
  autocmd User lsp_buffer_enabled call s:setup_lsp()
augroup END

" autocompolete
let g:asyncomplete_auto_completeopt = 1

" А эти настройки лучше бы смотрелись в keymaps.vim, но так будет непонятно к
" какому плагину они относятся
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup() : "\<CR>"
imap <C-@> <Plug>(asyncomplete_force_refresh)

call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'allowlist': ['*'],
    \ 'blocklist': ['go'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ 'config': {
    \    'max_buffer_size': 5000000,
    \  },
    \ }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'allowlist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

" airline
set noshowmode
set laststatus=2
set showtabline=2

let g:airline_powerline_fonts = 1
" Эту настройку я в тему вынес
"let g:airline_theme = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#keymap#enabled = 1

" devicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
