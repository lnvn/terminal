call plug#begin('~/.config/nvim/bundle')

" fuzzy find pluin
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Python auto-complete plugin
Plug 'davidhalter/jedi-vim'

" NerdTree
Plug 'scrooloose/nerdtree'

call plug#end()
