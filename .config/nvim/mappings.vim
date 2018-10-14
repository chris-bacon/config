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

function! CreateFunction(name, ...)
    if exists('a:1') && a:1 != ""
        return a:name . "\<space>" . a:1 . g:equals
    endif
    return a:name . g:equals
endfunction

function! ExtractHaskellType(...)
    let newTypeName = exists('a:1') ? a:1 : "MyType"
    execute "normal! gvdmm" . FindPreviousEmptyLine() . "o" . CreateType(newTypeName) . "\<esc>po\<esc>`mi\<space>" . newTypeName . "\<esc>:noh"
endfunction

function! CreateTypeSignature(name)
    return a:name . "\<space>::\<space>_\<space>->\<space>_"
endfunction

function! ExtractHaskellFunction(...)
    let fName = exists('a:1') ? a:1 : "f"
    let arg1 = exists('a:2') ? a:2 : ''
    execute "normal! gvdmm" . FindNextEmptyLine() . "o" . CreateTypeSignature(fName) . "\<esc>o" . CreateFunction(fName, arg1) . "\<esc>po\<esc>`mi" . fName . "\<esc>:noh"
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
