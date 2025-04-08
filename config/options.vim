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
set cc=81 

" Показывать частичные команды в строке состояния
set showcmd

" Всплывающие подсказки в терминале
set balloonevalterm


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

" Установить кодировку сохраняемых файлов (если можно)
if !&readonly && &modifiable
  set fileencoding=utf-8
endif

" Список кодировок для автоопределения
set fileencodings=utf-8,cp1251,koi8-r,cp866

" Перезагружать файл, если он изменился извне
set autoread

" Отключить бэкапы, временные и swap-файлы
set nobackup
set nowritebackup
set noswapfile
set noundofile

" Задержка перед записью swap и CursorHold
set updatetime=300

" Обновлять буфер при фокусе
autocmd FocusGained,BufEnter * checktime


" Командная строка  
" Меню автодополнения команд
set wildmenu

" Поведение автодополнения: сначала длиннейшее совпадение, потом все
set wildmode=longest,full

" Исключить некоторые файлы из wildmenu
set wildignore=*.pyc,*.o,*.obj,*~


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

" Выделение текста с помощью Shift + стрелки
set keymodel=startsel,stopsel

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
autocmd BufWritePost ~/.config/kitty/kitty.conf silent !pkill -SIGUSR1 kitty

" При сохранении vimrc можно использовать:
" au! BufWritePost $MYVIMRC source $MYVIMRC
