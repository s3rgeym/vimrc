## README

### О конфиге

Мой конфиг, который превращает Vim в IDE. Я долгое время пользовался пустым конфигом с `Plug 'tpope/vim-sensible'`. Потом решил настроить работу с `Coc.nvim` и `ALE`. Но я так и не смог запомнить все сочетания клавиш, мне не нужна была большая часть функционала, поэтому я остановился на связке `vim-lsp` + `autocomplete`.

Чтобы скопировать себе:

```sh
git clone https://github.com/s3rgeym/vimrc.git ~/.vim
```

### LSP

**LSP** — это протокол, придуманный в Microsoft... Он предоставляет линтинг, автодополнение и рефакторинг. Для поддержки LSP в моем конфиге используется `vim-lsp`. Однако, он требует ручной настройки различных language server'ов. Для автоматической же я использую `vim-lsp-settings`. Для вывода результатов автоподстановки нужны `asyncomplete.vim` и `asyncomplete-lsp.vim`.

Для поддержки Python нужно поставить [python-lsp-server](https://github.com/python-lsp/python-lsp-server) и его зависимости:

```sh
sudo pacman -S python-lsp-server autopep8 flake8 python-pylint python-rope
```

Для VimScript, если подключен репозиторий `archlinuxcn` или `chaotic-aur`:

```sh
sudo pacman -S vim-language-server
```

Языковые сервера так же можно ставить прямо из Vim: 

```vim
:LspInstallServer vim-language-server
```

Но я считаю способ через пакетный менеджер самым предпочтительным. Через него можно так же ставить плагины для Vim, но в репозиториях арча нет всех нужных.

### Поиск по файлам, буферам

```sh
sudo pacman -S fzf ripgrep
```

### Переключение раскладки

В Vim неудобно постоянно переключать системную раскладку при редактировании, так как на русской перестают работать привязки. Решением является использование встроенной поддержки русской раскладки. Переключиться в нее можно с помощью `<C-^>` (`Ctrl-6`), при этом все привязки будут работать.

### Отладка

#### Встроенный дебаггер

Для отладки C кода есть встроенный `thermdebug`, который нужно включить:

```vim
packadd thermdebug
```

> В vim давно есть поддержка плагинов, но до сих пор приходиться пользоваться сторонними, так как нет поддержки обновления плагинов

Он работает с `gdb`.

#### Python

Для использования встроенного отладчика питон я добавил [самописный плагин](./ftplugin/python_debug.vim) со сл сочетаниями:

* `F5` — запустить отладчик.
* `F9` — добавить/удалить breakpoint.
* `F10` — удалить все breakpoint'ы.

---

* [Python Debugging With Pdb](https://realpython.com/python-debugging-pdb/) (статья написана не индусом, что уже ее делает хорошей)

Так же можно использовать [pudb](https://documen.tician.de/pudb/) — лучший отладчик питоновского кода для терминала.

Его лучше поставить через `pipx` так как версия в репозитории арча, внезапно, нерабочая:

```sh
pipx install --system-site-packages pudb
```

* `--system-site-packages` позволяет использовать системные пакеты внутри виртуального окружения в которое был установлен `pudb`.

Для его запуска можно использовать привязку:

```vim
nnoremap <leader>pd :term pudb %<CR>
```

Для более сложных случаев лучше использовать более универсальные решения.

#### vimspector

[vimspector](https://github.com/puremourning/vimspector) — это порт стандартного отладчика VSCode для Vim. Главным его недостатком является использование **Node.js**, а достоинством — универсальность.

```vim
Plug 'puremourning/vimspector'
```

И используем стандартные сочетания клавиш VSCode:

```vim
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
```

| Сочетание | Описание |
| --- | --- |
| `F5` | Начать/продолжить отладку |
| `Shift-F5` | Прервать |
| `F9` | поставить breakpoint |


* [Сочетания клавиш](https://github.com/puremourning/vimspector?tab=readme-ov-file#visual-studio--vscode)

Для отладки кода на Python нужен `debugpy`. Его нужно установить через vim:

```vim
:VimspectorInstall debugpy
```

Для запуска отладчика нужен конфиг. Пример для Python:

`.vimspector.json`
```json
{
  "configurations": {
    "Python: Current File": {
      "adapter": "debugpy",
      "configuration": {
        "type": "python",
        "request": "launch",
        "program": "${file}",
        "console": "integratedTerminal"
      },
      "breakpoints": {
        "exception": {
          "raised": "",
          "uncaught": "Y",
          "userUnhandled": "N"
        }
      }
    }
  }
}
```

### Заметки

* [Кратко о Vim](https://ru.wikibooks.org/wiki/Vim)
* [Vimscript за 5 минут](https://learnxinyminutes.com/vimscript/)
* [Как пользоваться макросами](https://learnbyexample.github.io/vim_reference/Macro.html)

Ссылки можно отывать из vim с помощью `gx`.
