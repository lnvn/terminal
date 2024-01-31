" set backgroud
colorscheme dracula

" enable syntax hightlight
syntax on

" show the relative line number in the left hand size parrarel with actual line number
set relativenumber
set number
set numberwidth=4

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" Copy to clipboard
set clipboard=unnamed

set ruler " show cursor position all the time
set showmatch " show matching brackets

set mouse=a " allow use mouse in vim

" change line number of relativenumber
hi LineNrAbove guifg=grey ctermfg=grey
hi LineNr ctermfg=yellow
hi LineNrBelow guifg=grey ctermfg=grey

" auto-complete brackets
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap < <><Left>

" Use tab with text block
vmap <Tab> >gv
vmap <S-Tab> <gv