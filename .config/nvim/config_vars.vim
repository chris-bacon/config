"************
" Visual
"************
colorscheme one
set background          =dark
let g:one_allow_italics =1
let g:airline_theme     ='one'

" Ctrlp - Fuzzy finder
let g:ctrlp_custom_ignore = {
\ 'dir': '\v[\/](node_modules)$'
\}

"************
"Necoghc
"************
" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc           =0
let g:ycm_semantic_triggers                ={'haskell' : ['.']}
let g:necoghc_enable_detailed_browse       =1
let g:necoghc_use_stack                    =1
autocmd FileType haskell setlocal omnifunc =necoghc#omnifunc

set nocompatible
let &runtimepath.='~/.vim/bundle/neoterm'
let g:SuperTabDefaultCompletionType = '<c-x><c-o>' "Set tab as default autocomplete key
filetype plugin indent on
syntax on
set number
set relativenumber
set expandtab 
set smarttab
set lazyredraw
set tabstop                                       =8
set softtabstop                                   =0
set shiftwidth                                    =4
set scrolloff                                     =6
set wildignore+=*/tmp/*,*/.tmp/*,*.so,*.swp,*.zip,*.gz,.bz2,*.tar,*.keep,*.DS_Store,*/.git/*
" Use pleasant but very visible search hilighting
hi Search ctermfg=white ctermbg=173 cterm=none guifg=#ffffff guibg=#e5786d gui=none
hi LineNr ctermfg                                 = yellow
hi! link Visual Search

" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 40

let g:NERDTreeShowHidden = 1 " Display hidden files in Nerdtree by default
let g:NERDTreeMouseMode  = 3
let g:NERDTreeWinPos     = "right"
set mouse                =a

let g:vim_markdown_folding_disabled = 1
let g:deoplete#enable_at_startup    = 1
let g:tigris#enabled                = 1 " tigris - node.js async syntax highlighting

"************
"Haskell
"************
" Haskell syntax highlighting
let g:haskell_enable_quantification   = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo      = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax      = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles        = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers  = 1  " to enable highlighting of `static`
let g:haskell_backpack                = 1                " to enable highlighting of backpack keywords

