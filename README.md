## README

Мой конфиг, который превращает Vim в IDE (vim-lsp + autocomplete вместо громоздких ale + coc.nvim).

Чтобы скопировать себе:

```sh
git clone https://github.com/s3rgeym/vimrc.git ~/.vim
```

### Зависимости

Нечеткий поиск:

```sh
sudo pacman -S fzf
```

Поддержка Python:

```sh
sudo pacman -S python-lsp-server autopep8 flake8 python-pylint python-rope
```

pipx (arch не позволяет ставить пакеты через pip):

```sh
sudo pacman -S python-pipx
```

### Переключение раскладки

В Vim неудобно постоянно переключать системную раскладку при редактировании, так как на русской перестают работать привязки. Решением является использование встроенной поддержки русской раскладки. Переключиться в нее можно с помощью `<C-^>` (`Ctrl-2`), при этом все привязки будут работать.

### Отладка

#### Использование встроенных возможностей

Для отладки C кода есть встроенный `thermdebug`, который нужно включить:

```vim
packadd thermdebug
```

Он работает с `gdb`.

Для использования встроенного отладчика я добавил [самописный плагин](./ftplugin/python_debug.vim) со сл сочетаниями:

* `F5` — запустить отладчик.
* `F9` — добавить/удалить breakpoint.
* `F10` — удалить все breakpoint'ы.

Так же можно использовать [pudb](https://documen.tician.de/pudb/) — лучший отладичк питоновского кода для терминала.

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

[vimspector](https://github.com/puremourning/vimspector) — это порт стандартного отладчик VSCode для Vim. Главным его недостатком является использование **Node.js**, а достоинством — универсальность.

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
