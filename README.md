# dotvim

My Vim configuration files and plugins.

## Installation

First, clone the repository into `.vim` in your home directory:

    cd ~
    git clone https://github.com/koljakube/dotvim .vim

Second, link the contained configuration files into your home directory:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc
    
As a last step, pull all the submodules of the repository:

    cd ~/.vim
    git submodule init
    git submodule update

Or, if you have ruby and rake installed, just run it inside the directory instead of the last two steps:

    cd ~/.vim; rake