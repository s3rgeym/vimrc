" Основные настройки
" Увеличить историю команд до 1000
set history=1000

" Разрешить переключение буферов без сохранения
set hidden

" Отключить звуковые сигналы ошибок
set noerrorbells

" Отключить визуальные сигналы ошибок
set novisualbell


" Интерфейс
" Показывать номера строк
set number

" Отображать специальные символы (пробелы, табы и т.п.)
set list listchars=tab:→\ ,trail:·,nbsp:␣,extends:❯,precedes:❮

" Подсвечивать текущую строку
set cursorline

" Красная линия
set cc=+1

" Показывать частичные команды в строке состояния
set showcmd

" Всплывающие подсказки в терминале
if has('balloon_eval_term')
  set balloonevalterm
endif


" Отступы и форматирование
" Количество пробелов, соответствующих табуляции
set tabstop=4

" Отступ при автоформатировании
set shiftwidth=2

" Пробелы при нажатии Tab
set softtabstop=2

" Табуляции заменяются на пробелы
set expandtab

" Сохранять отступ предыдущей строки
set autoindent

" Автоматический отступ на основе кода
set smartindent

" Стиль отступа для C-подобных языков
set cindent

" Включить поддержку типов файлов и их отступов
filetype plugin indent on

" Ширина строки — максимум 80 символов
set textwidth=80

" Включить перенос строк (soft wrap)
set wrap

" Переносить строки по словам, а не по символам
set linebreak

" Отображаемый символ при переносе строки
set showbreak=↪\


" Поиск
" Игнорировать регистр символов
set ignorecase

" Но учитывать регистр, если есть заглавные
set smartcase

" Подсвечивать найденный текст
set hlsearch

" Искать по мере ввода
set incsearch


" Работа с файлами
" Установить кодировку интерфейса
set encoding=utf-8

" Список кодировок для автоопределения
set fileencodings=utf-8,cp1251,koi8-r,cp866

" Перезагружать файл, если он изменился извне
set autoread

" Отключаем бекапы (file.txt~) и своп-файлы (*.swp)
set nobackup nowritebackup noswapfile

" Делаем возможным постоянный undo
set undofile

" Максимальное количество шагов для отката
set undolevels=1000

" Путь до каталога с undo-файлами
let &undodir = expand('$VIMHOME/undo')

" Убедимся, что директория для undo существует
if !isdirectory($VIMHOME . '/undo')
  call mkdir($VIMHOME . '/undo', 'p')
endif

" Настроим viminfo
set viminfofile=$VIMHOME/viminfo
set viminfo='1000,<1000,s100,h

" Восстанавливаем последнюю позицию курсора при открытии файла
augroup restore_cursor_position
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   execute "normal! g`\"" |
        \ endif
augroup END

" Задержка перед записью swap и перед отображением всплывающих (CursorHold)
set updatetime=300

" Обновлять буфер при фокусе
autocmd FocusGained,BufEnter * checktime


" Командная строка
" Использовать меню автодополнения в командной строке (`:e <Tab>`)
set wildmenu

" Автодополнение до общего префикса, а затем показываем меню и в цикле перебираем варианты
set wildmode=longest:full,full

" Исключить некоторые файлы из wildmenu
let g:my_wildignore = join([
      \   '*.py[co]', '*.obj', '*.o', '*~',
      \   '.git/**', 'node_modules/**', '__pycache__/**', 'dist/**', 'build/**',
      \   '*.docx', '*.xlsx', '*.pdf', '*.jpg', '*.jpeg', '*.gif', '*.png',
      \   '*.webp', '*.mp3', '*.mp4',
      \   '*.zip', '*.gzip', '*.gz', '*.bz2', '*.xz', '*.zst', '*.7z', '*.rar'
      \ ], ',')

exec 'set wildignore=' . g:my_wildignore

" Работа с окнами
" Открывать новые окна снизу
set splitbelow

" Открывать новые окна справа
set splitright


" Производительность
" Быстрое соединение с терминалом
set ttyfast

" Отложенная перерисовка (ускоряет макросы и скрипты)
set lazyredraw


" Мышь и клавиатура
" Поддержка мыши во всех режимах
set mouse=a

" Правильная обработка мыши в терминале
set ttymouse=sgr

" Использовать системный буфер обмена
set clipboard=unnamedplus

" Убрать артефакты в терминале kitty
" https://github.com/kovidgoyal/kitty/issues/63
set t_RV=

" Изменение курсора в зависимости от режима
let &t_SI = "\e[6 q"  " INSERT mode
let &t_SR = "\e[4 q"  " REPLACE mode
let &t_EI = "\e[2 q"  " NORMAL mode

" Подчеркивание с undercurl не работает в новом Vim
" https://github.com/vim/vim/issues/4737
let &t_Cs="\<Esc>[4:3m"

" Задержка для сочетаний
set timeoutlen=500

" Выделение стредками с зажатым Shift
" stopsel конфликтует с Ctrl-V
"set keymodel=startsel,stopsel
set keymodel=startsel

" Разрешить переход курсора между строками с помощью h, l, <, >, [, ]
set whichwrap+=h,l,<,>,[,]

" Встроенная русская раскладка Vim решает проблему с нерабочими горячими клавишами при смене системной
" Для переключения используем Ctrl-^ (Ctrl+6)
set keymap=russian-jcukenwin

" Использовать английский язык по умолчанию
set iminsert=0
set imsearch=0


" Орфография
" Включить проверку орфографии для английского и русского
set spelllang=en,ru
"set spell  " Включать вручную при необходимости


" Автокоманды
" При сохранении конфига kitty — перезапуск
"autocmd BufWritePost ~/.config/kitty/kitty.conf silent !pkill -SIGUSR1 kitty

" При сохранении vimrc можно использовать:
" au! BufWritePost $MYVIMRC source $MYVIMRC
