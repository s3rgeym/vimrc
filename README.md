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

Для отладки лучше всего использовать [vimspector](https://github.com/puremourning/vimspector).

* [Сочетания клавиш](https://github.com/puremourning/vimspector?tab=readme-ov-file#visual-studio--vscode)
* [Конфигурирование](https://puremourning.github.io/vimspector/configuration.html#debug-configurations)

Конфиг для Python:

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

Для питона так же можно использовать pdb и pudb.
