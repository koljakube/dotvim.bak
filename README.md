# dotvim

My Vim configuration files and plugins.

## Installation

First, clone the repository into `.vim` in your home directory:

    cd ~
    git clone https://github.com/koljakube/dotvim .vim

Second, link the contained configuration files into your home directory:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

Or, if you have ruby and rake installed, just run it inside the directory:

    cd ~/.vim; rake