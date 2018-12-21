nnoremap <space> <nop>
let mapleader = "\<Space>"

function! ToUppercase()
    execute "normal! viwU"
endfunction

command! AlignOnEquals :Tab /=
command! AlignOnDash   :Tab /->
command! AlignOnColon  :Tab /::
command! CopyLineAndPaste execute "normal yyp"
command! HighlightWholeWord execute "normal viw"

vnoremap <leader>ef  :ExtractHaskellFunction<cr>
vnoremap <leader>et  :ExtractHaskellType<cr>
nnoremap <leader>fte :FindTest<cr>
nnoremap <leader>U   :call ToUppercase()<esc>
nnoremap <leader>ev  :vsplit $MYVIMRC<cr>
nnoremap <leader>sv  :source $MYVIMRC<cr>
nnoremap <leader>ii  :echo synIDattr(synID(line('.'), col('.'), 1), 'name')<cr>
noremap  <C-n>       :NERDTreeToggle<cr>
nnoremap <leader>-   :CopyLineAndPaste<cr>
nnoremap <C-p>       :FZF<cr>
nnoremap <leader><space> :HighlightWholeWord<cr>
" Escape out of terminal mode
tnoremap <ESC> <C-\><C-n>  
nmap \\\ <Plug>CommentaryLine
vmap \\ <Plug>Commentary
vnoremap <leader>=   :AlignOnEquals<cr>
vnoremap <leader>-   :AlignOnDash<cr>
vnoremap <leader>:   :AlignOnColon<cr>
" Copy vscode's CMD-D
" Use with # or * in N-mode to change all occurances of a word
nnoremap <leader>d :%s///g
vnoremap <C-c> "+y
