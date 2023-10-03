## FrameWork / Tools List
- [Oh-my-zsh](https://ohmyz.sh)
- [Zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [Dracula Theme](https://github.com/dracula/dracula-theme/tree/master/themes)

## Repository Structure

```
dotfile
├── config
│   └── nvim
│       ├── colors
│       │   └── dracula.vim
│       ├── configs
│       │   ├── plugin-setting.vim
│       │   ├── plugin.vim
│       │   └── settings.vim
│       └── init.vim
├── oh-my-zsh
│   └── themes
│       └── dracula.zsh-theme
└── zshrc

vscode
└── keybindings.json
```

| Files | Descriptions |
| --- | --- |
| dracula.vim | custom vim theme name dracula |
| plugin-setting.vim | contain the setting for the installed plugin |
| plugin.vim | contain the list of plugin will be install into neovim |
| settings.vim | contain all custom config for neovim |
| init.vim | find and run all config file in ./configs when neovim inited|
| dracula.zsh-theme | custom theme name dracula |
| .zshrc | the config of zsh mamanged by oh-my-zsh |


- Open document:
```
:help <vim option>

Example:
    :help :colorscheme
```

Theme repository: https://github.com/dracula/dracula-theme