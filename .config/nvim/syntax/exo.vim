if exists("b:current_syntax")
    finish
endif

highlight! Constant guifg=13 ctermfg=13
highlight! Exotype guifg=Yellow ctermfg=Yellow

syntax match Constant "\v\w"
syntax keyword Exotype S3

let b:current_syntax = "exo"

