## Setup
### Prerequisites
Install neovim, oh-my-zsh, tmux
#### NOTE: Install script currently does not support install those component, it will be updated in the future! (Don't know when :wink: )

### Run script
```
$ cd dotfiles
$ ./install --backup-and-link
```
### Install vim plugin
Inside neovim run
```
: PlugInstall
```

### Install tmux plugin
```
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
Inside tmux
```
Prefix + I
```
(default Prefix: Ctrl + B)



## Repository Structure

```
dotfile
├── config
│   └── nvim
│       ├── colors
│       │   └── dracula.vim
│       ├── configs
|       |   ├── plug.vim
│       │   ├── plugin-setting.vim
│       │   ├── plugin.vim
│       │   └── settings.vim
│       └── init.vim
├── oh-my-zsh
│   └── themes
│       └── dracula.zsh-theme
├── vimrc
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
| .vimrc | setting for vim and nvim, this will be copied to settings.vim in install.sh script |
| .zshrc | the config of zsh mamanged by oh-my-zsh |

### Note
for MacOS
use this command to disable ApplePressAndHoldEnabled function (tested on MacOS Ventura)
```
$ defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
```

Reset Iterm2 configuration
```
$ defaults delete com.googlecode.iterm2
```