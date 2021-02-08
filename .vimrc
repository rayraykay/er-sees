" Make sure to keep these here and not after the sleuth
"set tabstop=4
"set softtabstop=4
"set shiftwidth=4
"set expandtab

" Use sensible default config
if empty(glob('~/.vim/pack/tpope/start/plugin/sensible.vim'))
  silent !curl -fLo ~/.vim/pack/tpope/start/plugin/sensible.vim --create-dirs
    \ https://raw.githubusercontent.com/tpope/vim-sensible/master/plugin/sensible.vim

endif

runtime! pack/tpope/start/plugin/sensible.vim

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall --sync | source ~/.vimrc 
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Make sure to run PlugInstall for missing plugins

" Allow to change between buffers that have changes in them
set hidden

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/vim-plug-plugins')

Plug 'tomasiser/vim-code-dark'

" Initialize plugin system
call plug#end()

" PlugClean to clean stuff

" vscode dark
colorscheme codedark

" set relative line numbers and line numbers
set nu rnu

" Whitespace display
" Can use :help listchars to see what you can do
"set listchars=eol:$,tab:>·,trail:~,extends:>,precedes:<
set listchars=tab:>·,trail:·,extends:·,precedes:·,space:·
set list

" To do automatic detection of spaces/tabs
" https://github.com/tpope/vim-sleuth

" Allow fuzzy search in subfolders
" initially had . and /usr/include
set path=.,**
