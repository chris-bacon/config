"************
" Plugins
"************
" Specify a directory for plugins (neovim: ~/.local/share/nvim/plugged); avoid standard Vim dirs like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'neovimhaskell/haskell-vim' " Haskell-vim, self-explanatory really
Plug 'eagletmt/neco-ghc' "Haskell completion
Plug 'neomake/neomake'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown' "Markdown syntax highlighter
Plug 'Raimondi/delimitMate' "Matches brackets and parentheses
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'leafgarland/typescript-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' "Airline theme
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'} " TypeScript
Plug 'leafgarland/typescript-vim' " Syntax highlighter
Plug 'neovim/node-host', { 'do': 'npm install' } " JS and Node
Plug 'billyvg/tigris.nvim', { 'do': './install.sh' } " JS and Node
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy finder
Plug 'ervandew/supertab' "Use tab key instead of arrow keys for autocomplete
Plug 'kassio/neoterm' " Terminal
Plug 'tpope/vim-commentary' " Comments
Plug 'chrisbra/NrrwRgn' " Crazy comment stuff - select a region and do :NR, then save to return

" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'nightsense/carbonized'
Plug 'yuttie/hydrangea-vim'
Plug 'beigebrucewayne/Turtles'
Plug 'Dru89/vim-adventurous'
Plug 'Badacadabra/vim-archery'
Plug 'rakr/vim-one'
Plug 'elmcast/elm-vim'
Plug 'tikhomirov/vim-glsl'
" Initialize plugin system; then Install with :PlugInstall
call plug#end()

"************
" Visual
"************
colorscheme one
set background=dark
let g:one_allow_italics = 1
let g:airline_theme='one'

"************
" Config
"************
set nocompatible
let &runtimepath.='~/.vim/bundle/neoterm'
let g:SuperTabDefaultCompletionType = '<c-x><c-o>' "Set tab as default autocomplete key
filetype plugin indent on
syntax on
set number
set relativenumber
set tabstop=8 
set softtabstop=0 
set expandtab 
set shiftwidth=4 
set smarttab
set scrolloff=6
set lazyredraw
set wildignore+=*/tmp/*,*/.tmp/*,*.so,*.swp,*.zip,*.gz,.bz2,*.tar,*.keep,*.DS_Store,*/.git/*
" Use pleasant but very visible search hilighting
hi Search ctermfg=white ctermbg=173 cterm=none guifg=#ffffff guibg=#e5786d gui=none
hi! link Visual Search

"************
" Ctrlp - Fuzzy finder
"************
let g:ctrlp_custom_ignore = {
\ 'dir': '\v[\/](node_modules)$'
\}

"************
" Autocommands - syntax: autocmd <event> <pattern> <command>
"************
" Build scripts
autocmd Filetype javascript nnoremap <leader>b :!npm run build<cr> 
autocmd Filetype haskell nnoremap <leader>b :!stack build<cr> 
autocmd Filetype elm nnoremap <leader>b :!elm-make Main.elm<cr>

" autocmd FileType haskell nnoremap <buffer> <leader>if <esc>:InteroLoadCurrentFile<CR>
"augroup interoMaps
""  au!
  " Automatically reload on save
""  au BufWritePost *.hs InteroReload
""  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
""  au FileType haskell nnoremap <silent> <leader>lf :InteroLoadCurrentFile<CR>
""  au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>
""  au FileType haskell nnoremap <silent> <leader>T :InteroType<CR>
"augroup END

"************
" Mappings
"************
let mapleader = ","
" highlight entire word where cursor is
nnoremap <leader><space> viwhh  
" copy line and paste below
nnoremap <leader>- yyp  
" Upercase entire word, then return to normal mode
nnoremap <leader>U viwU<esc>  
" Open nvim config file (edit vim) in side split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>  
" Source nvim config
nnoremap <leader>sv :source $MYVIMRC<cr>  
" Run npm tests
nnoremap <leader>t :!npm test<cr>  
" Put quotes around selected word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel  
nnoremap <leader>ii :echo synIDattr(synID(line('.'), col('.'), 1), 'name')<CR>
" Put brackets around selected word
noremap <leader>( viw<esc>a)<esc>bi(<esc>lel  
" Toggle NERDTree
noremap <C-n> :NERDTreeToggle<CR>  
" Disable arrow keys
noremap <up> <nop>  
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
" Escape out of terminal mode
tnoremap <ESC> <C-\><C-n>  
" Escape out insert mode
inoremap jk <esc>  
nmap \\\ <Plug>CommentaryLine
vmap \\ <Plug>Commentary

" NERDTree
let g:NERDTreeShowHidden = 1 " Display hidden files in Nerdtree by default
let g:NERDTreeMouseMode=3
let g:NERDTreeWinPos = "right"
set mouse=a

let g:vim_markdown_folding_disabled = 1
let g:deoplete#enable_at_startup = 1
let g:tigris#enabled = 1 " tigris - node.js async syntax highlighting

"************
"Haskell
"************
" Haskell syntax highlighting
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

"************
"Necoghc
"************
" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc 
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:necoghc_enable_detailed_browse = 1
let g:necoghc_use_stack = 1

