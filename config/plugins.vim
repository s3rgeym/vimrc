" Установка vim-plug если отсутствует
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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

" Поддержка LSP
Plug 'prabirshrestha/vim-lsp'
" Автотатическая настройка языковых серверов для vim-lsp
Plug 'mattn/vim-lsp-settings'

" Автодополнение
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Поддержка .editorconfig
Plug 'editorconfig/editorconfig-vim'

" Красивый статус
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Иконки
Plug 'ryanoasis/vim-devicons'

" Темы
Plug 'morhetz/gruvbox'

call plug#end()

" NERDTree
let NERDTreeShowHidden = 1

augroup nerdtree_config
  autocmd!
  autocmd VimEnter * NERDTree | wincmd p
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup END

" fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6 } }

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

  call SetupLspKeymaps()

  " Форматирование
  autocmd BufWritePre <buffer> LspDocumentFormat
endfunction

augroup lsp_config
  autocmd!
  autocmd User lsp_buffer_enabled call s:setup_lsp()
augroup END

" asyncompolete
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
