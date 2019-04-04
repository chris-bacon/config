nnoremap <space> <nop>
let mapleader = "\<Space>"

" Functions -------------------{{{
function! ToUppercase()
    execute "normal! viwU"
endfunction
" }}}

" Commands --------------------{{{
command! AlignOnEquals :Tab /=
command! AlignOnDash   :Tab /->
command! AlignOnColon  :Tab /::
command! CopyLineAndPaste execute "normal yyp"
command! HighlightWholeWord execute "normal viw"
command! ClearSearch :nohl
" }}}

vnoremap <leader>ef  :ExtractHaskellFunction<cr>
vnoremap <leader>et  :ExtractHaskellType<cr>
nnoremap <leader>fte :FindTest<cr>
nnoremap <leader>U   :call ToUppercase()<esc>
nnoremap <leader>ev  :vsplit $MYVIMRC<cr>
nnoremap <leader>sv  :source $MYVIMRC<cr>
nnoremap <leader>ii  :echo synIDattr(synID(line('.'), col('.'), 1), 'name')<cr>
noremap  <C-n>       :NERDTreeToggle<cr>
nnoremap <leader>-   :CopyLineAndPaste<cr>

" FZF --------------------{{{
nnoremap <C-p> :FZF<cr>
nnoremap <C-b> :Buffers<cr>
nnoremap <C-l> :BLines<cr>
" }}}

nnoremap <leader><space> :HighlightWholeWord<cr>
" Escape out of terminal mode
tnoremap <ESC> <C-\><C-n>  
nmap \\ <Plug>CommentaryLine
vmap \\ <Plug>Commentary
vnoremap <leader>= :AlignOnEquals<cr>
vnoremap <leader>- :AlignOnDash<cr>
vnoremap <leader>: :AlignOnColon<cr>
" Copy vscode's CMD-D
" Use with # or * in N-mode to change all occurances of a word
nnoremap <leader>d 
  \ :%s///g
  \ <Left><Left><Left>
vnoremap <C-c> "+y
nnoremap <leader><cr> :ClearSearch<cr>

let g:grepper = {}
let g:grepper.tools = ["rg"]
xmap gr <plug>(GrepperOperator)

nnoremap <leader>S
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :Grepper -cword -noprompt<CR>
  \ :cfdo %s/<C-r>s// \| update
  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
xmap \S
  \ "sy
  \ gvgr
  \ :cfdo %s/<C-r>s// \| update
  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent loadview
augroup END


" vim: set fdl=0 fdm=marker:

