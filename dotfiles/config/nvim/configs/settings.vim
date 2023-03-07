" set backgroud
colorscheme dracula

" enable syntax hightlight
syntax on

" show the relative line number in the left hand size parrarel with actual line number
set relativenumber
set number
set numberwidth=4

" change line number of relativenumber
hi LineNrAbove guifg=red ctermfg=red
"hi LineNrBelow guifg=green ctermfg=green

" show matching brackets
set showmatch

" auto-complete brackets
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>

" map key
" <CR> is like Enter in keyboard
" map <C-p> :!python3 %<CR>
map <Leader>run :!python3 %<CR>

" keymap to refresh NERDTree
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>
