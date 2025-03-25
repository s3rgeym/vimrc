## README

Мой конфиг, который превращает Vim в IDE.

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

### Отладка

#### Использование встроенных возможностей

Для отладки C-кода есть встроенный `thermdebug`:

```vim
packadd thermdebug
```

Он работает с `gdb`.

Для питона лучшим отладчиком является [pudb](https://documen.tician.de/pudb/).

Его лучше поставить через `pipx` так как версия в репозитории арча нерабочая:

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
