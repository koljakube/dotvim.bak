" Vim Configuration File

" Setup pathogen - this needs to be done first
runtime bundle/pathogen/autoload/pathogen.vim
" Use the following to temporarily disable plugins
let g:pathogen_disabled = []
"call add(g:pathogen_disabled, 'plugindirectoryname')
"call add(g:pathogen_disabled, 'bundler')
"call add(g:pathogen_disabled, 'coffee-script')
"call add(g:pathogen_disabled, 'colorscheme-solarized')
call add(g:pathogen_disabled, 'covim')
"call add(g:pathogen_disabled, 'ctrlp')
"call add(g:pathogen_disabled, 'fugitive')
"call add(g:pathogen_disabled, 'localvimrc')
"call add(g:pathogen_disabled, 'multiple-cursors')
"call add(g:pathogen_disabled, 'nerdcommenter')
"call add(g:pathogen_disabled, 'nerdtree')
"call add(g:pathogen_disabled, 'pathogen')
"call add(g:pathogen_disabled, 'ragtag')
"call add(g:pathogen_disabled, 'rails')
"call add(g:pathogen_disabled, 'sensible')
"call add(g:pathogen_disabled, 'surround')
"call add(g:pathogen_disabled, 'syntastic')
"call add(g:pathogen_disabled, 'tabular')
"call add(g:pathogen_disabled, 'taglist')
"call add(g:pathogen_disabled, 'ultisnips')
"call add(g:pathogen_disabled, 'youcompleteme')
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
inoremap <C-t>           <Esc>:tabnew<CR>

" Paste mode shortcut
nmap \o :set paste!<CR>

" Activate and configure omni complete
"set ofu=syntaxcomplete#Complete
"set completeopt=longest,menuone
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  "\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  "\ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'


""
" Syntastic configuration
""

" Check all supported languages by default
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby'],
                           \ 'passive_filetypes': [] }

" Show signs next to lines
let g:syntastic_enable_signs = 1

" Enable secure, per-project .vimrc files
set exrc
set secure

" Enable mouse mode
set mouse=a


""
" CtrlP.vim configuration
""

let g:ctrlp_map = '<C-p>'


""
" NERDtree configuration
""

" Easily toggle it on and off
map <Leader>t :NERDTreeToggle<CR>

" Be on the right side like in my TextMate
let g:NERDTreeWinPos = "right"


""
" Tabular configuration
""

map :Tab :Tabularize
map <Leader>a= :Tab /=<CR>
map <Leader>a: :Tab /:\zs<CR>


""
" Taglist configuration
""

let Tlist_GainFocus_On_ToggleOpen=1
nnoremap <silent> <Leader>. :TlistToggle<CR>


""
" UltiSnips configuration
""

" By default, UltiSnips and YouCompleteMe share the same bindings
let g:ycm_key_list_previouscompletion=['<Up>']
let g:UltiSnipsExpandTrigger="<Leader><Tab>"
let g:UltiSnipsListSnippets="<Leader><S-Tab>"


""
" Status line configuration
""

hi User1 ctermfg=black guifg=black ctermbg=cyan
hi User2 ctermfg=green guifg=blue  ctermbg=cyan
hi User3 ctermfg=white guifg=white ctermbg=red  guibg=red
set statusline=%1*
set statusline+=\ %f\                                    " file name and path
set statusline+=%2*
set statusline+=%y
set statusline+=%r                                       " readonly flag
set statusline+=%m\                                      " modified flag
set statusline+=%1*
" Git information
set statusline+=%{fugitive#statusline()}
" Syntastic information
set statusline+=%3*
set statusline+="   "
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%1*
" Right side
set statusline+=%=
set statusline+=(%P)\                                    " percentage through the file
set statusline+=%l/%L,%c%V\                              " line and column number
set statusline+=%1*

