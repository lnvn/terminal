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
inoremap < <><Left>

" map key
" <CR> is like Enter in keyboard
" map <C-p> :!python3 %<CR>
" map <Leader>run :!python3 %<CR>

" keymap to refresh NERDTree
" nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>

" Use tab with text block
vmap <Tab> >gv
vmap <S-Tab> <gv

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" custom the expand/colapse icon
" let g:NERDTreeDirArrowExpandable="+"
" let g:NERDTreeDirArrowCollapsible="~"

" Auto complete trigger by tab
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

