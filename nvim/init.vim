"************
" Plugins
"************

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes
" Any valid git URL is allowed
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/neovimhaskell/haskell-vim.git'
Plug 'https://github.com/neomake/neomake.git'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown' "Markdown syntax highlighter
Plug 'altercation/vim-colors-solarized'
Plug 'Raimondi/delimitMate' "Matches brackets and parentheses
"Plug 'valloric/youcompleteme' "Needs Vim to be compiled with Python
Plug 'vim-airline/vim-airline-themes' "Airline theme

" Initialize plugin system
call plug#end()
" Install with :PlugInstall

"************
" Visual
"************

let g:solarized_termcolors=256
set background=dark
colorscheme solarized "elflord
set number
let g:airline_theme='luna'

autocmd vimenter * NERDTree

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab "1 tab = 4 spaces
