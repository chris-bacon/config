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
hi LineNr ctermfg=yellow

" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 40

let g:NERDTreeShowHidden = 1 " Display hidden files in Nerdtree by default
let g:NERDTreeMouseMode=3
let g:NERDTreeWinPos = "right"
set mouse=a

let g:vim_markdown_folding_disabled = 1
let g:deoplete#enable_at_startup = 1
let g:tigris#enabled = 1 " tigris - node.js async syntax highlighting

