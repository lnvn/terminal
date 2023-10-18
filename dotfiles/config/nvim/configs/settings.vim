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

" nerdTree shotcut config
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" fzf
noremap ` :Files<CR>
noremap ; :Buffers<CR>

" custom the expand/colapse icon
" let g:NERDTreeDirArrowExpandable="+"
" let g:NERDTreeDirArrowCollapsible="~"

" Auto complete trigger by tab
" See https://github.com/neoclide/coc.nvim
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

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
