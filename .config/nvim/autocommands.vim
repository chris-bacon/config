" Build scripts
autocmd Filetype javascript nnoremap <leader>b :!npm run build<cr> 
autocmd Filetype haskell nnoremap <leader>b :!stack build<cr> 
autocmd Filetype elm nnoremap <leader>b :!elm-make Main.elm<cr>

" autocmd FileType haskell nnoremap <buffer> <leader>if <esc>:InteroLoadCurrentFile<CR>
"augroup interoMaps
""  au!
  " Automatically reload on save
""  au BufWritePost *.hs InteroReload
""  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
""  au FileType haskell nnoremap <silent> <leader>lf :InteroLoadCurrentFile<CR>
""  au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>
""  au FileType haskell nnoremap <silent> <leader>T :InteroType<CR>
"augroup END

