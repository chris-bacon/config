"************
" Visual
"************
colorscheme gruvbox
set background          =dark
let g:one_allow_italics =1
"let g:airline_theme     ='simple'

let g:asyncrun_open  = 12
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
set wrap
"set nowrap sidescroll=1 listchars=extends:>,precedes:<
set sidescrolloff=1

"************
"Highlighting
"************
hi Search     ctermfg=red ctermbg=yellow cterm=none
hi LineNr     ctermfg=yellow
hi Pmenu      ctermfg=yellow
hi PmenuSel   ctermfg=black ctermbg=yellow
hi PmenuSbar  ctermbg=black
hi PmenuThumb ctermbg=yellow
hi! link Visual Search

hi! link haskellType GruvboxFg1
hi! link haskellIdentifier GruvboxAqua
hi! link haskellSeparator GruvboxFg4
hi! link haskellDelimiter GruvboxOrange
hi! link haskellOperators GruvboxPurple

hi! link haskellBacktick GruvboxOrange
hi! link haskellStatement GruvboxPurple
hi! link haskellConditional GruvboxPurple

hi! link haskellLet GruvboxRed
hi! link haskellDefault GruvboxRed
hi! link haskellWhere GruvboxRed
hi! link haskellBottom GruvboxRedBold
hi! link haskellImportKeywords GruvboxPurpleBold
hi! link haskellDeclKeyword GruvboxOrange
hi! link haskellDecl GruvboxOrange
hi! link haskellDeriving GruvboxPurple
hi! link haskellAssocType GruvboxAqua

hi! link haskellNumber GruvboxAqua
hi! link haskellPragma GruvboxRedBold
 
hi! link haskellTH GruvboxAquaBold
hi! link haskellForeignKeywords GruvboxGreen
hi! link haskellKeyword GruvboxRed
hi! link haskellFloat GruvboxAqua
hi! link haskellInfix GruvboxPurple
hi! link haskellQuote GruvboxGreenBold
hi! link haskellShebang GruvboxYellowBold
hi! link haskellLiquid GruvboxPurpleBold
hi! link haskellQuasiQuoted GruvboxBlueBold
hi! link haskellRecursiveDo GruvboxPurlpe
hi! link haskellQuotedType GruvboxRed
hi! link haskellPreProc GruvboxFg4
hi! link haskellTypeRoles GruvboxRedBold
hi! link haskellTypeForall GruvboxRed
hi! link haskellPatternKeyword GruvboxBlue

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

" let g:neosnippet#snippets_directory='~/.config/nvim/snips'
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" " SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"  \ "\<Plug>(neosnippet_expand_or_jump)"
"  \: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"  \ "\<Plug>(neosnippet_expand_or_jump)"
"  \: "\<TAB>"

"set nowrap
"set nowrap sidescroll=1 listchars=extends:>,precedes:<
set sidescrolloff=1

set hidden
set rtp+=~/.local/share/nvim/plugged/LanguageClient-neovim
let g:LanguageClient_serverCommands = { 'haskell': ['hie-wrapper', '--lsp'] }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
map <Leader>lb :call LanguageClient#textDocument_references()<CR>
map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>

hi link ALEError Error
hi Warning term=underline cterm=underline ctermfg=Yellow gui=undercurl guisp=Gold
hi link ALEWarning Warning
hi link ALEInfo SpellCap

let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

"let g:nvimhsPluginStarter=nvimhs#stack#pluginstarter()

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']



let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }
