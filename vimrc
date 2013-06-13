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

