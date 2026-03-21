" Vim syntax file
" Language:    Agda
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn match agdaLineComment "--.*$" contains=agdaTodo
syn region agdaBlockComment start="{-" end="-}" contains=agdaBlockComment,agdaTodo
syn keyword agdaTodo TODO FIXME XXX HACK NOTE BUG contained

" Pragma
syn region agdaPragma start="{-#" end="#-}"

" Strings
syn region agdaString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=agdaStringEscape
syn match agdaStringEscape "\\[\\\"'abfnrtv0]" contained
syn match agdaStringEscape "\\x[0-9a-fA-F]\+" contained
syn match agdaStringEscape "\\o[0-7]\+" contained
syn match agdaStringEscape "\\[0-9]\+" contained

" Characters
syn match agdaChar "'[^\\]'"
syn match agdaChar "'\\[\\\"'abfnrtv0]'"
syn match agdaChar "'\\x[0-9a-fA-F]\+'"

" Numbers
syn match agdaNumber "\<[0-9]\+\>"
syn match agdaNumber "\<[0-9]\+\.[0-9]\+\>"
syn match agdaNumber "\<0x[0-9a-fA-F]\+\>"

" Operators
syn match agdaOperator "[-+*/=<>!&|^~?@#%.:$\\]\+"
syn match agdaOperator "->"
syn match agdaOperator "<-"
syn match agdaOperator "=>"
syn match agdaOperator "::"
syn match agdaOperator "\\"
syn match agdaOperator "\<_\>"

" Keywords
syn keyword agdaKeyword abstract codata coinductive constructor data do
syn keyword agdaKeyword eta-equality field forall hiding import in
syn keyword agdaKeyword inductive infix infixl infixr instance interleaved
syn keyword agdaKeyword let macro module mutual no-eta-equality open overlap
syn keyword agdaKeyword pattern postulate primitive private public
syn keyword agdaKeyword quote quoteTerm record renaming rewrite
syn keyword agdaKeyword syntax tactic unquote unquoteDecl unquoteDef
syn keyword agdaKeyword using variable where with

" Set levels
syn match agdaKeyword "\<Set[0-9]*\>"

" Types
syn keyword agdaType Set Prop Level
syn keyword agdaType Nat zero suc
syn keyword agdaType Bool true false
syn keyword agdaType List Vec Fin Maybe just nothing
syn keyword agdaType Sigma String Char Float Int Word64
syn match agdaType "\<[A-Z][a-zA-Z0-9_']*\>"

" Builtins
syn keyword agdaFunction refl sym trans cong subst inspect

" Holes
syn match agdaHole "{!.\{-}!}"
syn match agdaHole "?"

" BUILTIN pragma keywords
syn match agdaPragmaBuiltin "BUILTIN\|COMPILED\|COMPILED_DATA\|COMPILED_TYPE\|COMPILED_DECLARE_DATA\|FOREIGN\|COMPILE\|NO_POSITIVITY_CHECK\|NO_TERMINATION_CHECK\|TERMINATING\|NON_TERMINATING\|CATCHALL\|DISPLAY\|REWRITE\|POLARITY\|STATIC\|INLINE\|NOINLINE" contained containedin=agdaPragma

hi def link agdaLineComment Comment
hi def link agdaBlockComment Comment
hi def link agdaTodo Todo
hi def link agdaPragma PreProc
hi def link agdaPragmaBuiltin PreProc
hi def link agdaString String
hi def link agdaStringEscape Special
hi def link agdaChar String
hi def link agdaNumber Number
hi def link agdaOperator Operator
hi def link agdaKeyword Keyword
hi def link agdaType Type
hi def link agdaFunction Function
hi def link agdaHole Special

let b:current_syntax = "agda"
