" Все настройки можно посмотреть с помощью :set
" Увеличить историю команд до 1000
set history=1000

" Разрешить переключение буферов без сохранения
set hidden

" Отключить звуковые сигналы ошибок
set noerrorbells

" Отключить визуальные сигналы ошибок
set novisualbell

" Не ограничивать длину строки
set textwidth=0


" Отображение интерфейса
" Показывать номера строк
set number

" Отображение специальных символов (например, табы и пробелы)
set list listchars=tab:→\ ,trail:·,nbsp:␣,extends:❯,precedes:❮

" Подсвечивать текущую строку
set cursorline

" Подсвечивать заданные колонки (например, для ограничения длины строки)
set cc=81

" Показывать частичные команды в строке состояния
set showcmd

" Включить поддержку всплывающих подсказок в терминальных версиях Vim
set balloonevalterm


" Отступы и форматирование
" Установить количество пробелов для отображения символа табуляции
set tabstop=4

" Установить ширину отступа в пробелах при автоформатировании
set shiftwidth=2

" Установить количество пробелов, вставляемых при нажатии Tab
set softtabstop=2

" Преобразовывать символы табуляции в пробелы
set expandtab

" Сохранять отступ предыдущей строки
set autoindent

" Автоматически добавлять отступ для вложенных блоков кода
set smartindent

" Использовать стиль отступов для C-подобных языков
set cindent

" Включить поддержку отступов и плагинов для типов файлов
filetype plugin indent on


" Поиск
" Игнорировать регистр символов при поиске
set ignorecase

" Учитывать регистр, если запрос содержит заглавные буквы
set smartcase

" Подсвечивать все совпадения найденного текста
set hlsearch

" Показывать совпадения по мере ввода поискового запроса
set incsearch


" Работа с файлами
" Установить кодировку текста редактора в UTF-8
set encoding=utf-8

" Fix: E21: Cannot make changes, 'modifiable' is off:
if !&readonly && &modifiable
  " Установить кодировку сохраняемых файлов в UTF-8
  set fileencoding=utf-8
endif

" Определить список кодировок для автоматического определения файла
set fileencodings=utf-8,cp1251,koi8-r,cp866

" Автоматически перечитывать файлы, если они изменены извне
set autoread

" Отключает создание резервных копий, swap-файлов и временных файлов
set nobackup nowritebackup noswapfile noundofile

" Установить задержку в миллисекундах для записи swap-файлов и события CursorHold
set updatetime=300

" Обновлять содержимое буфера при переключении окон или изменении фокуса
autocmd FocusGained,BufEnter * checktime


" Командная строка
" Включить автодополнение в командной строке
set wildmenu

" Настроить поведение автодополнения (наиболее длинный, затем полный путь)
set wildmode=longest,full

" Игнорировать указанные типы файлов при автодополнении
set wildignore=*.pyc,*.o,*.obj,*~


" Управление окнами
" Открывать новые окна ниже текущего
set splitbelow

" Открывать новые окна справа от текущего
set splitright


" Прокрутка и перенос строк
" Включить перенос строк
set wrap

" Переносить строки по словам
set linebreak

" Установить символ, отображаемый при переносе строки
set showbreak=↪\

" Оставлять n строк вокруг курсора при вертикальной прокрутке
set scrolloff=3


" Настройки, влияющие на производительность
" Указать, что соединение с терминалом быстрое (ускоряет отрисовку)
set ttyfast

" Откладывать перерисовку экрана для ускорения работы при выполнении макросов
set lazyredraw


" Мышь и клавиатура
" Включить поддержку мыши
set mouse=a

" Фиксит неправильную обработку кликов мыши
set ttymouse=sgr

" Использовать системный буфер обмена
set clipboard=unnamedplus

" Убираем артефакты терминала
" https://github.com/kovidgoyal/kitty/issues/1536
set t_RV=

" Изменять курсор в зависимости от режима
let &t_SI = "\e[6 q" " INSERT mode
let &t_SR = "\e[4 q" " REPLACE mode
let &t_EI = "\e[2 q" " NORMAL mode

" Установить задержку в миллисекундах для сочетаний клавиш
set timeoutlen=500

" Включить выделение текста с помощью Shift и стрелок
set keymodel=startsel,stopsel

" Разрешить переход курсора между строками с помощью h, l, <, >, [, ]
set whichwrap+=h,l,<,>,[,]

" Встроенная русская раскладка Vim решает проблему с нерабочими горячими клавишами при смене системной
" Для переключения используем Ctrl-^ (Ctrl+6)
set keymap=russian-jcukenwin

" Установить английскую раскладку по умолчанию
set iminsert=0

" Установить английский язык поиска по умолчанию
set imsearch=0


" SpellCheck
set spell spelllang=en_us,ru_ru


" Работа с конфигами
" Применяем изменения в конфиге
au! BufWritePost $MYVIMRC source $MYVIMRC

" Перезапускаем kitty при изменении конфига
autocmd BufWritePost ~/.config/kitty/kitty.conf silent !pkill -SIGUSR1 kitty
