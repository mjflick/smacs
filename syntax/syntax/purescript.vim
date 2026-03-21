" Vim syntax file
" Language:    PureScript
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn match purescriptLineComment "--.*$" contains=purescriptTodo
syn region purescriptBlockComment start="{-" end="-}" contains=purescriptBlockComment,purescriptTodo
syn keyword purescriptTodo TODO FIXME XXX HACK NOTE BUG contained

" Strings
syn region purescriptString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=purescriptStringEscape
syn region purescriptMultilineString start=+"""+ end=+"""+ contains=purescriptStringEscape
syn match purescriptStringEscape "\\[\\\"'nrt0]" contained
syn match purescriptStringEscape "\\x[0-9a-fA-F]\{1,6}" contained

" Characters
syn match purescriptChar "'[^\\]'"
syn match purescriptChar "'\\[\\\"'nrt0]'"
syn match purescriptChar "'\\x[0-9a-fA-F]\+'"

" Numbers
syn match purescriptNumber "\<[0-9]\+\>"
syn match purescriptNumber "\<[0-9]\+\.[0-9]\+\>"
syn match purescriptNumber "\<[0-9]\+[eE][+-]\?[0-9]\+\>"
syn match purescriptNumber "\<0x[0-9a-fA-F]\+\>"

" Operators
syn match purescriptOperator "[-+*/=<>!&|^~?@#%.:$]\+"
syn match purescriptOperator "\\"
syn match purescriptOperator "->"
syn match purescriptOperator "<-"
syn match purescriptOperator "=>"
syn match purescriptOperator "::"
syn match purescriptOperator "<>"
syn match purescriptOperator ">>="
syn match purescriptOperator ">>>"
syn match purescriptOperator "<<<"
syn match purescriptOperator "<$>"
syn match purescriptOperator "<*>"
syn match purescriptOperator "<<<\|>>>"

" Keywords
syn keyword purescriptKeyword module where import as hiding
syn keyword purescriptKeyword class instance derive newtype data type
syn keyword purescriptKeyword forall do ado let in
syn keyword purescriptConditional if then else case of
syn keyword purescriptKeyword infix infixl infixr foreign

" Type classes
syn keyword purescriptStatement class instance derive

" Types
syn keyword purescriptType Int Number String Char Boolean Array Record
syn keyword purescriptType Effect Aff Maybe Just Nothing Either Left Right
syn keyword purescriptType Tuple Unit Void Ordering LT GT EQ
syn keyword purescriptType Map Set List NonEmpty
syn match purescriptType "\<[A-Z][a-zA-Z0-9_']*\>"

" Builtins
syn keyword purescriptFunction show log pure bind map apply append mempty
syn keyword purescriptFunction compare eq notEq add sub mul div mod
syn keyword purescriptFunction negate abs top bottom not conj disj
syn keyword purescriptFunction identity const flip compose unit void unsafeCoerce

" Module-qualified identifiers
syn match purescriptQualified "\<[A-Z][a-zA-Z0-9_']*\(\.[A-Z][a-zA-Z0-9_']*\)*\.\l[a-zA-Z0-9_']*\>"

" Type annotations
syn match purescriptTypeAnnotation "^\l[a-zA-Z0-9_']*\s*::" contains=purescriptIdentifier

" Pragma
syn match purescriptPragma "^--\s*@.*$"

" Holes
syn match purescriptHole "?\l[a-zA-Z0-9_']*"

hi def link purescriptLineComment Comment
hi def link purescriptBlockComment Comment
hi def link purescriptTodo Todo
hi def link purescriptString String
hi def link purescriptMultilineString String
hi def link purescriptStringEscape Special
hi def link purescriptChar String
hi def link purescriptNumber Number
hi def link purescriptOperator Operator
hi def link purescriptKeyword Keyword
hi def link purescriptConditional Conditional
hi def link purescriptStatement Statement
hi def link purescriptType Type
hi def link purescriptFunction Function
hi def link purescriptQualified Function
hi def link purescriptTypeAnnotation Identifier
hi def link purescriptPragma PreProc
hi def link purescriptHole Special

let b:current_syntax = "purescript"
