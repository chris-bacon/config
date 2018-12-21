"************
" Visual
"************
colorscheme one
set background          =dark
let g:one_allow_italics =1
let g:airline_theme     ='simple'

let g:asyncrun_status = ''
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

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
set nowrap
set nowrap sidescroll=1 listchars=extends:>,precedes:<
set sidescrolloff=1

"************
"Highlighting
"************
hi Search     ctermfg=red cterm=none
hi LineNr     ctermfg=yellow
hi Pmenu      ctermfg=yellow
hi PmenuSel   ctermfg=black ctermbg=yellow
hi PmenuSbar  ctermbg=black
hi PmenuThumb ctermbg=yellow
hi! link Visual Search


"************
"NERDTree
"************
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 40

let g:NERDTreeShowHidden = 1 " Display hidden files in Nerdtree by default
let g:NERDTreeMouseMode  = 3
let g:NERDTreeWinPos     = "left"
set mouse                =a

"************
"Ale
"************
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:vim_markdown_folding_disabled = 1
let g:deoplete#enable_at_startup    = 1
let g:tigris#enabled                = 1 " tigris - node.js async syntax highlighting

"************
"Haskell
"************
" Haskell syntax highlighting
let g:haskell_enable_quantification   = 1 " to enable highlighting of `forall`
let g:haskell_enable_recursivedo      = 1 " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax      = 1 " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles        = 1 " to enable highlighting of type roles
let g:haskell_enable_static_pointers  = 1 " to enable highlighting of `static`
let g:haskell_backpack                = 1 " to enable highlighting of backpack keywords

let g:neosnippet#snippets_directory='~/.config/nvim/snips'
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)"
 \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)"
 \: "\<TAB>"

set nowrap
set nowrap sidescroll=1 listchars=extends:>,precedes:<
set sidescrolloff=1

