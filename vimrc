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

" Turn off backups (we have version control)
set nobackup
set nowb
set noswapfile

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

" Better searching
set incsearch  " search while typing
set ignorecase " case matters only when at least one
set smartcase  "   capital letter is included in the query
set hlsearch   " highlight search results
nmap <silent> <Leader>h :nohlsearch<CR>

" Enable syntax-based code folding
set foldmethod=syntax

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

"set tabline=%!MyTabLine()
"function MyTabLine()
  "let s = '' " complete tabline goes here
  "" loop through each tab page
  "for t in range(tabpagenr('$'))
    "" select the highlighting for the buffer names
    "if t + 1 == tabpagenr()
      "let s .= '%#TabLineSel#'
    "else
      "let s .= '%#TabLine#'
    "endif
    "" empty space
    "let s .= ' '
    "" set the tab page number (for mouse clicks)
    "let s .= '%' . (t + 1) . 'T'
    "" set page number string
    "let s .= t + 1 . ' '
    "" get buffer names and statuses
    "let n = ''  "temp string for buffer names while we loop and check buftype
    "let m = 0 " &modified counter
    "let bc = len(tabpagebuflist(t + 1))  "counter to avoid last ' '
    "" loop through each buffer in a tab
    "for b in tabpagebuflist(t + 1)
      "" buffer types: quickfix gets a [Q], help gets [H]{base fname}
      "" others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
      "if getbufvar( b, "&buftype" ) == 'help'
        "let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
      "elseif getbufvar( b, "&buftype" ) == 'quickfix'
        "let n .= '[Q]'
      "else
        "let n .= pathshorten(bufname(b))
        ""let n .= bufname(b)
      "endif
      "" check and ++ tab's &modified count
      "if getbufvar( b, "&modified" )
        "let m += 1
      "endif
      "" no final ' ' added...formatting looks better done later
      "if bc > 1
        "let n .= ' '
      "endif
      "let bc -= 1
    "endfor
    "" add modified label [n+] where n pages in tab are modified
    "if m > 0
      ""let s .= '[' . m . '+]'
      "let s.= '+ '
    "endif
    "" add buffer names
    "if n == ''
      "let s .= '[No Name]'
    "else
      "let s .= n
    "endif
    "" switch to no underlining and add final space to buffer list
    ""let s .= '%#TabLineSel#' . ' '
    "let s .= ' '
  "endfor
  "" after the last tab fill with TabLineFill and reset tab page nr
  "let s .= '%#TabLineFill#%T'
  "" right-align the label to close the current tab page
  "if tabpagenr('$') > 1
    "let s .= '%=%#TabLine#%999XX'
  "endif
  "return s
"endfunction

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

" Faster window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


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

