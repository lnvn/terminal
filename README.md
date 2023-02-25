# Repostructure

```
dotfile
├── config
│   └── nvim
│       ├── configs
│       │   ├── plugin-setting.vim
│       │   ├── plugin.vim
│       │   └── settings.vim
│       └── init.vim
├── oh-my-zsh
│   └── themes
│       └── dracula.zsh-theme
└── zshrc
```

| Files | Descriptions |
| --- | --- |
| plugin-setting.vim | contain the setting for the installed plugin |
| plugin.vim | contain the list of plugin will be install into neovim |
| settings.vim | contain all custom config for neovim |
| init.vim | find and run all config file in ./configs when neovim inited|
| dracula.zsh-theme | custom theme name dracula |
| .zshrc | the config of zsh mamanged by oh-my-zsh |