if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "hm"

syn keyword top fun func function con cons constructor
syn keyword ops let case in of
syn region comment start='#' end='$'

hi def link top Type
hi def link comment Comment
hi def link ops Statement
