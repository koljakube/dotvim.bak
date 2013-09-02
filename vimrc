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
"call add(g:pathogen_disabled, 'delimitmate')
"call add(g:pathogen_disabled, 'eclim')
"call add(g:pathogen_disabled, 'fish')
"call add(g:pathogen_disabled, 'fugitive')
"call add(g:pathogen_disabled, 'localvimrc')
"call add(g:pathogen_disabled, 'markdown')
"call add(g:pathogen_disabled, 'multiple-cursors')
"call add(g:pathogen_disabled, 'nerdcommenter')
"call add(g:pathogen_disabled, 'nerdtree')
"call add(g:pathogen_disabled, 'nerdtree-tabs')
"call add(g:pathogen_disabled, 'pathogen')
"call add(g:pathogen_disabled, 'ragtag')
"call add(g:pathogen_disabled, 'rails')
"call add(g:pathogen_disabled, 'ruby-refactoring')
"call add(g:pathogen_disabled, 'scss-syntax')
"call add(g:pathogen_disabled, 'sensible')
"call add(g:pathogen_disabled, 'surround')
"call add(g:pathogen_disabled, 'syntastic')
"call add(g:pathogen_disabled, 'tabular')
"call add(g:pathogen_disabled, 'taglist')
"call add(g:pathogen_disabled, 'ultisnips')
"call add(g:pathogen_disabled, 'yankring')
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
set softtabstop=2
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

" Quickly edit this file
nmap <silent> <Leader>ve :edit $MYVIMRC<CR>
nmap <silent> <Leader>vs :source $MYVIMRC<CR>

" Save the shift key in normal mode
nmap ; :

" Turn off backups (we have version control)
set nobackup
set nowb
set noswapfile

" Make backspace delete more
set backspace=indent,eol,start

" Quickly toggle line numbering in normal mode
nmap <Leader>l :setlocal number!<CR>
set number

" Silence the visual bell because iTerm2's is so distracting
set visualbell

" Highlight trailing whitespace (should be before colorscheme)
autocmd BufWinEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd InsertLeave * redraw! " show trailing whitespace immediately after leaving insert

" Set up a nice colorscheme
set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
"let g:solarized_contrast   = "high"
colorscheme solarized

" Highlight the current line
set cursorline
" This setting makes the slowdown more bearable
set ttyfast
set lazyredraw

" Better searching
set incsearch  " search while typing
set ignorecase " case matters only when at least one
set smartcase  "   capital letter is included in the query
set hlsearch   " highlight search results
nmap <silent> <Leader>h :nohlsearch<CR>

" Enable syntax-based code folding
set foldmethod=syntax
" Don't fold on startup
set foldlevelstart=99

" Move in visual, not actual, lines
nmap j gj
nmap k gk

" Something like TextMate's Cmd+Enter
inoremap <Leader><CR> <C-O>o
inoremap <Leader><S-CR> <C-O>k<C-O>o
nnoremap <Leader><CR> o
nnoremap <Leader><S-CR> ko

" Spellchecking
set spelllang=en_US
autocmd BufRead,BufNewFile *.md setlocal spell
nmap <silent> <Leader>st :setlocal spell!<CR>
nmap <silent> <Leader>sg :setlocal spelllang=de_20<CR>
nmap <silent> <Leader>se :setlocal spelllang=en_us<CR>

" Easier tab navigation
nnoremap <Leader><S-Tab> :tabprev<CR>
nnoremap <Leader><Tab>   :tabnext<CR>
nnoremap <C-t>           :tabnew<CR>
inoremap <Leader><S-Tab> <Esc>:tabprev<CR>i
inoremap <Leader><Tab>   <Esc>:tabnext<CR>i
inoremap <C-t>           <Esc>:tabnew<CR>
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt

" Paste mode shortcut
nmap \o :set paste!<CR>

" Faster window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Strip trailing whitespace on save
function! StripTrailingWhitespace()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction

autocmd FileType c,cpp,java,php,ruby,python,coffee autocmd BufWritePre <buffer> call StripTrailingWhitespace()

" Shortcuts for exiting buffers and saving the current file
nmap <Leader>w :w<CR>
imap <Leader>w <C-o>:w<CR>
nmap <Leader>q :q<CR>
imap <Leader>q <C-o>:q<CR>


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
let g:ctrlp_extensions = []


""
" NERDtree configuration
""

" Easily toggle it on and off
map <Leader>t :NERDTreeTabsToggle<CR>

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
let g:ycm_key_list_previous_completion=['<Up>']
let g:ycm_key_list_select_completion=['<Down>']
let g:ycm_key_invoke_completion = '<C-Space>'
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsListSnippets="<S-Tab>"


""
" Eclim configuration
""

nnoremap <silent> <Leader>i :JavaImport<CR>
nnoremap <silent> <Leader>jd :JavaDocSearch -x declarations<CR>

let g:EclimCompletionMethod = 'omnifunc'


""
" YankRing configuration
""

nnoremap <Leader>ys :YRShow<CR>
let g:yankring_history_dir  = $HOME
let g:yankring_history_file = '.yankring_history'

call insert(g:ctrlp_extensions, 'yankring')


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

