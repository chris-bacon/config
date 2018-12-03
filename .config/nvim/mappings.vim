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

vnoremap <leader>ef  :ExtractHaskellFunction<cr>
vnoremap <leader>et  :ExtractHaskellType<cr>
nnoremap <leader>fte :FindTest<cr>
nnoremap <leader>U   :call ToUppercase()<esc>
nnoremap <leader>ev  :vsplit $MYVIMRC<cr>
nnoremap <leader>sv  :source $MYVIMRC<cr>
nnoremap <leader>"   :call WrapWith("\"")<cr>
nnoremap <leader>(   :call WrapWith("(")<cr>
nnoremap <leader>ii  :echo synIDattr(synID(line('.'), col('.'), 1), 'name')<CR>
noremap  <C-n>       :NERDTreeToggle<CR>
nnoremap <leader>-   yyp  
nnoremap <C-p>       :FZF<CR>
nnoremap <leader><space> viwhh  
" Escape out of terminal mode
tnoremap <ESC> <C-\><C-n>  
nmap \\\ <Plug>CommentaryLine
vmap \\ <Plug>Commentary
vnoremap <leader>=   :Tab /=<cr>
vnoremap <leader>-   :Tab /-><cr>
vnoremap <leader>:   :Tab /::<cr>

" Copy vscode's CMD-D
" Use with # or * in N-mode to change all occurances of a word
nnoremap <leader>d :%s///g
