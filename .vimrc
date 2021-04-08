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

" Tabbing/spacing auto detection
Plug 'tpope/vim-sleuth'

" Fuzzy searching for files and in file
" Need ripgrep for this. Check if it exists and if it does,
" then install. Otherwise output error message.
" https://github.com/BurntSushi/ripgrep#installation
" Note: no hidden files right now, can change in config
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
echo "Make sure rg exists or else you'll have no fuzzy in file search!"
nnoremap <C-p> :Files<Cr>
nnoremap <C-g> :Rg<Cr>

" Fuzzy searching and other stuff
" Plug 'ctrlpvim/ctrlp.vim' 

" Spoke too soon! A JSX plugin exists
" Some recommendations here: https://github.com/MaxMEllon/vim-jsx-pretty
Plug 'maxmellon/vim-jsx-pretty'

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

" Allow fuzzy search in subfolders
" initially had . and /usr/include
" set path=.,**
set wildignore+=*.a,*.o
set wildignore+=*.swp

" Some user commands
:command Bda bufdo e

" CtrlP settings
" show hidden files
" use the directory you started vim in to search out of
" https://github.com/ctrlpvim/ctrlp.vim
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 0

