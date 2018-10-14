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
function! FindNextEmptyLine()
    return "/^$\<cr>"
endfunction

function! FindPreviousEmptyLine()
    return "/^$\<cr>N"
endfunction

function! CreateType(name)
    return "data\<space>" . a:name . "\<space>="
endfunction

function! ExtractHaskellType(...)
    let newTypeName = exists('a:1') ? a:1 : "MyType"
    execute "normal! gvdmm" . FindPreviousEmptyLine() . "o" . CreateType(newTypeName) . "\<space>\<esc>po\<esc>`mi\<space>" . newTypeName . "\<esc>:noh"
endfunction

function! ExtractHaskellFunction(...)
    let newFuncName = exists('a:1') ? a:1 : "f"
    execute "normal! gvdmm" . FindNextEmptyLine() . "o" . newFuncName . "\<space>=\<space>\<esc>po\<esc>`mi" . newFuncName ."\<esc>:noh"
endfunction

command! -range -nargs=? ExtractHaskellType call ExtractHaskellType(<f-args>)
command! -range -nargs=? ExtractHaskellFunction call ExtractHaskellFunction(<f-args>)

vnoremap <leader>ef :ExtractHaskellFunction<cr>
vnoremap <leader>et :ExtractHaskellType<cr>
nnoremap <leader>"  :call WrapWith("\"")<cr>
nnoremap <leader>U  :call ToUppercase()<esc>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
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