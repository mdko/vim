if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "cem"

syn keyword table table
syn keyword ops apply return case pattern_literal pattern_else pattern_cons
syn keyword args literal local arg caseValue caseField
syn keyword itable itable constructor
syn region comment start='#' end='$'

hi def link comment Comment
hi def link table Statement
hi def link itable Function
hi def link ops Statement
hi def link args Type
