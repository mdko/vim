hi link schemeParentheses Comment

" foo#bar
syn match schemeExtraSyntax /[a-zA-Z0-9!$%&*+\-\./:<=>?@^_~]\+#[^ \t\n()\[\]";]\+/

" ##foo#bar
syn match schemeExtraSyntax /##[a-zA-Z0-9!$%&*+\-\./:<=>?@^_~]\+#[^ \t\n()\[\]";]\+/

" Heredocs.
syn region schemeString start=/#<[<#]\s*\z(.*\)/ end=/^\z1$/

" Keywords.
syn match schemeKeyword /#[!:][a-zA-Z0-9!$%&*+\-\./:<=>?@^_~#]\+/
syn match schemeKeyword /[a-zA-Z0-9!$%&*+\-\./:<=>?@^_~#]\+:\>/

" C/C++ syntax.
if filereadable(expand("<sfile>:p:h")."/cpp.vim")
  syn include @C <sfile>:p:h/cpp.vim
  syn region C matchgroup=schemeComment start=/#>/ end=/<#/ contains=@C
  syn region C matchgroup=schemeComment start=/#>?/ end=/<#/ contains=@C
  syn region C matchgroup=schemeComment start=/#>!/ end=/<#/ contains=@C
  syn region C matchgroup=schemeComment start=/#>\$/ end=/<#/ contains=@C
  syn region C matchgroup=schemeComment start=/#>%/ end=/<#/ contains=@C
endif

syn keyword schemeSyntax λ

syn keyword schemeLibrarySyntax declare
syn keyword schemeLibrarySyntax module
syn keyword schemeLibrarySyntax reexport
syn keyword schemeLibrarySyntax require-extension
syn keyword schemeLibrarySyntax require-library
syn keyword schemeLibrarySyntax unit
syn keyword schemeLibrarySyntax use
syn keyword schemeLibrarySyntax uses

syn keyword schemeTypeSyntax -->
syn keyword schemeTypeSyntax ->
syn keyword schemeTypeSyntax :
syn keyword schemeTypeSyntax assume
syn keyword schemeTypeSyntax define-specialization
syn keyword schemeTypeSyntax define-type
syn keyword schemeTypeSyntax the

syn keyword schemeExtraSyntax and-let*
syn keyword schemeExtraSyntax if-let*
syn keyword schemeExtraSyntax match
syn keyword schemeExtraSyntax match-lambda
syn keyword schemeExtraSyntax match-lambda*

syn keyword schemeSpecialSyntax define-external
syn keyword schemeSpecialSyntax define-inline
syn keyword schemeSpecialSyntax foreign-code
syn keyword schemeSpecialSyntax foreign-declare
syn keyword schemeSpecialSyntax foreign-lambda
syn keyword schemeSpecialSyntax foreign-lambda*
syn keyword schemeSpecialSyntax foreign-safe-lambda
syn keyword schemeSpecialSyntax foreign-safe-lambda*
syn keyword schemeSpecialSyntax foreign-value

syn keyword schemeSyntaxSyntax define-macro
syn keyword schemeSyntaxSyntax syntax-case
syn keyword schemeSyntaxSyntax with-syntax
syn keyword schemeSyntaxSyntax syntax-object->datum
syn keyword schemeSyntaxSyntax datum->syntax-object
syn keyword schemeSyntaxSyntax syntax
syn keyword schemeSyntaxSyntax quasisyntax
syn keyword schemeSyntaxSyntax unsyntax
syn keyword schemeSyntaxSyntax unsyntax-splicing
syn keyword schemeSyntaxSyntax define-syntax-rule
syn keyword schemeSyntaxSyntax define-for-syntax
syn keyword schemeSyntaxSyntax import-for-syntax
syn keyword schemeSyntaxSyntax begin-for-syntax
syn keyword schemeSyntaxSyntax er-macro-transformer
syn keyword schemeSyntaxSyntax ir-macro-transformer
