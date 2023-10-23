" Safe bundle to other directory instead of vim
call plug#begin('~/.config/nvim-bundle')

" fuzzy find plugin
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" vim airline - Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Icon for folder, file ...
" NOTE: config terminal font to make this plugin work
" $~ brew tap homebrew/cask-fonts
" $~ brew install font-hack-nerd-font
" Then Terminal -> Setting -> Profiles -> Text -> Font -> Hack Nerd Font
Plug 'ryanoasis/vim-devicons'

" Auto completition
" require nodejs & jedi
" $ brew install node
" $ pip3 install jedi
" :CocInstall coc-python
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" NerdTree
Plug 'scrooloose/nerdtree'

" Navigate from vim to tmux
Plug 'christoomey/vim-tmux-navigator'

" Vim Plugin
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'sindrets/diffview.nvim'

" Surrounding Text
Plug 'tpope/vim-surround'

call plug#end()
