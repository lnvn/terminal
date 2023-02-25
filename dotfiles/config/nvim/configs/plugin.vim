call plug#begin('~/.config/nvim/bundle')

" fuzzy find pluin
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" NerdTree
Plug 'scrooloose/nerdtree'

call plug#end()
