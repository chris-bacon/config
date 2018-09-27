let mapleader = ","
" highlight entire word where cursor is
nnoremap <leader><space> viwhh  
" copy line and paste below
nnoremap <leader>- yyp  
" Upercase entire word, then return to normal mode
nnoremap <leader>U viwU<esc>  
" Open nvim config file (edit vim) in side split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>  
" Source nvim config
nnoremap <leader>sv :source $MYVIMRC<cr>  
" Run npm tests
nnoremap <leader>t :!npm test<cr>  
" Put quotes around selected word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel  
nnoremap <leader>ii :echo synIDattr(synID(line('.'), col('.'), 1), 'name')<CR>
" Put brackets around selected word
noremap <leader>( viw<esc>a)<esc>bi(<esc>lel  
" Toggle NERDTree
noremap <C-n> :NERDTreeToggle<CR>  
" Disable arrow keys
" noremap <up> <nop>  
" noremap <down> <nop>
" noremap <left> <nop>
" noremap <right> <nop>

" Escape out of terminal mode
tnoremap <ESC> <C-\><C-n>  
" Escape out insert mode
inoremap jk <esc>  
nmap \\\ <Plug>CommentaryLine
vmap \\ <Plug>Commentary
