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

