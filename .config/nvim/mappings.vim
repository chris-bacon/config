nnoremap <space> <nop>
let mapleader = "\<Space>"

function! ToUppercase()
    execute "normal! viwU"
endfunction

function! WrapWith(str)
    if a:str == "("
        execute "normal! viw\<esc>a)\<esc>bi(\<esc>lel"
    else 
        execute "normal! viw\<esc>a" . a:str . "\<esc>bi" . a:str . "\<esc>lel"
    endif
endfunction

" Haskell Refactor
let g:equals = "\<space>=\<space>"

function! FindNextEmptyLine()
    return "/^$\<cr>"
endfunction

function! FindPreviousEmptyLine()
    return "/^$\<cr>N"
endfunction

function! CreateType(name)
    return "data\<space>" . a:name . g:equals
endfunction

function! ExtractHaskellType(...)
    let newTypeName = exists('a:1') ? a:1 : "MyType"
    execute "normal! gvdmm" . FindPreviousEmptyLine() . "o" . CreateType(newTypeName) . "\<esc>po\<esc>`mi\<space>" . newTypeName . "\<esc>:noh"
endfunction

function! CreateTypeSignature(name, numArgs)
    let typeSig = "\<space>::"
    let i = 1
    while i <= a:numArgs
        let typeSig .= "\<space>_\<space>->"
        let i += 1
    endwhile
    let typeSig .= "\<space>_"
    return a:name . typeSig
endfunction

function! CreateFunction(name, params)
    if a:params != ""
        return a:name . " " . a:params . g:equals
    endif
    return a:name . g:equals
endfunction

function! ExtractHaskellFunction(...)
    let args = a:0 > 0 ? split(a:000[0], " ") : []
    let numArgs = len(args)
    let fName = numArgs > 0 ? args[0] : "f"
    let numFParams = numArgs - 1
    let fParams = args != [] ? join(args[1:], " ") : ""
    execute "normal! gvdmm" . FindNextEmptyLine() . "o" . CreateTypeSignature(fName, numFParams) . "\<esc>o" . CreateFunction(fName, fParams) . "\<esc>po\<esc>`mi" . fName . (fParams != "" ? " " . fParams : "") . "\<esc>:noh"
endfunction

command! -range -nargs=? ExtractHaskellType     call ExtractHaskellType(<f-args>)
command! -range -nargs=? ExtractHaskellFunction call ExtractHaskellFunction(<f-args>)

vnoremap <leader>ef :ExtractHaskellFunction<cr>
vnoremap <leader>et :ExtractHaskellType<cr>
nnoremap <leader>U  :call ToUppercase()<esc>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>"  :call WrapWith("\"")<cr>
nnoremap <leader>(  :call WrapWith("(")<cr>
nnoremap <leader>ii :echo synIDattr(synID(line('.'), col('.'), 1), 'name')<CR>
noremap  <C-n>      :NERDTreeToggle<CR>
nnoremap <leader>-  yyp  
nnoremap <leader><space> viwhh  
" Escape out of terminal mode
tnoremap <ESC> <C-\><C-n>  
nmap \\\ <Plug>CommentaryLine
vmap \\ <Plug>Commentary

" Copy vscode's CMD-D
" Use with # or * in N-mode to change all occurances of a word
nnoremap <leader>d :%s///g
