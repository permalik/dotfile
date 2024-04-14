" disable compatibility with vi
set nocompatible

" enable type file detection
filetype on

" enable plugins and load plugin for the detected file type
filetype plugin on

" load an indent file for the detected file type
filetype indent on

" syntax highlighting on
syntax on

" numberline
set nu rnu

" cursorline
set cursorline

" shiftwidth equals 4 spaces
set shiftwidth=4

" tabwidth equals 4 columns
set tabstop=4

" space characters instead of tabs
set expandtab

" do not save backup files
set nobackup

" minimum number lines to keep above and below cursor
set scrolloff=10

" do not wrap lines
set nowrap

" incrementally highlight matches while searching file for characters
set incsearch

" ignore capital lettes during search
set ignorecase

" override ignorecase if searching for capitals
set smartcase

" show partial command you type in last line of the screen
set showcmd

" show the mode you are on the last line
set showmode

" show matching words during a search
set showmatch

" use highlighting when doing a search
set hlsearch

" expand history
set history=1000
