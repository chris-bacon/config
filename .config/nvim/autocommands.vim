" Build scripts
autocmd Filetype javascript nnoremap <leader>b :AsyncRun npm run build<cr>
autocmd Filetype haskell    nnoremap <leader>b :AsyncRun stack build --fast<cr>
autocmd Filetype elm        nnoremap <leader>b :AsyncRun elm-make Main.elm<cr>

