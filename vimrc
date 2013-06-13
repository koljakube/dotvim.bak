" Vim Configuration File

" Setup pathogen - this needs to be done first
runtime bundle/pathogen/autoload/pathogen.vim
" Use the following to temporarily disable plugins
let g:pathogen_disabled = []
"call add(g:pathogen_disabled, 'plugindirectoryname')
execute pathogen#infect()

" Make Vim not use fish (they don't work well together)
if $SHELL =~ 'fish'
  set shell=/bin/bash
endif

" Turn on syntax highlighting
syntax on
filetype plugin indent on

" Set indentation to the only correct way ;-)
set tabstop=2
set expandtab
set shiftwidth=2

" Automatic and smart indentation
set autoindent
set smartindent

" Show matching braces
set showmatch

" Show title in terminal title bar
set title

" Map escape to something on the homerow
inoremap jj <Esc>

" Set leader key
let mapleader = ","
let g:mapleader = ","

" Turn off backups (we have version control)
set nobackup
set nowb
set noswapfile

" Quickly toggle line numbering in normal mode
nmap <Leader>l :setlocal number!<CR>
set number

" Set up a nice colorscheme
set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
"let g:solarized_contrast   = "high"
colorscheme solarized

" Highlight the current line
set cursorline

" Better searching
set incsearch  " search while typing
set ignorecase " case matters only when at least one
set smartcase  "   capital letter is included in the query
set hlsearch   " highlight search results

" Move in visual, not actual, lines
nmap j gj
nmap k gk

" Something like TextMate's Cmd+Enter
inoremap <Leader><CR> <C-O>o
nnoremap <Leader><CR> o

" Easier tab navigation
nnoremap <Leader><S-Tab> :tabprev<CR>
nnoremap <Leader><Tab>   :tabnext<CR>
nnoremap <C-t>           :tabnew<CR>
inoremap <Leader><S-Tab> <Esc>:tabprev<CR>i
inoremap <Leader><Tab>   <Esc>:tabnext<CR>i
inoremap <C-t>           :tabnew<CR>

" Paste mode shortcut
nmap \o :set paste!<CR>

" Activate and configure omni complete
set ofu=syntaxcomplete#Complete
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

