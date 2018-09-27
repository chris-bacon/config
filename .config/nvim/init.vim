"************
" Plugins
"************
so plugins.vim

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
so config_vars.vim

"************
" Ctrlp - Fuzzy finder
"************
let g:ctrlp_custom_ignore = {
\ 'dir': '\v[\/](node_modules)$'
\}

"************
" Autocommands - syntax: autocmd <event> <pattern> <command>
"************
so autocommands.vim

"************
" Mappings
"************
so mappings.vim

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

