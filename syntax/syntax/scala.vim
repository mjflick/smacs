" Vim syntax file
" Language:    Scala
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword scalaTodo TODO FIXME XXX NOTE HACK BUG contained
syn match scalaLineComment "//.*$" contains=scalaTodo
syn region scalaBlockComment start="/\*" end="\*/" contains=scalaTodo,scalaBlockComment

" Scaladoc
syn region scalaDocComment start="/\*\*" end="\*/" contains=scalaTodo,scalaDocTag
syn match scalaDocTag "@\(param\|return\|throws\|see\|since\|version\|author\|deprecated\|todo\|note\|example\|tparam\)\>" contained

" Strings
syn region scalaString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=scalaEscape,scalaInterpolation
syn region scalaTripleString start=+"""+ end=+"""+ contains=scalaEscape,scalaInterpolation
syn match scalaEscape "\\[nrt\\\"'bfa0]" contained
syn match scalaEscape "\\u[0-9a-fA-F]\{4}" contained
syn match scalaChar "'[^'\\]'"
syn match scalaChar "'\\[nrt\\\"'bfa0]'"
syn match scalaChar "'\\u[0-9a-fA-F]\{4}'"

" String interpolation
syn match scalaInterpolation "\$\w\+" contained
syn match scalaInterpolation "\${[^}]*}" contained
syn match scalaStringPrefix "[sf]\"" nextgroup=scalaString

" Symbols
syn match scalaSymbol "'\w\+"

" Numbers
syn match scalaNumber "\<\d\+[lLfFdD]\?\>"
syn match scalaNumber "\<0[xX][0-9a-fA-F]\+[lL]\?\>"
syn match scalaNumber "\<\d\+\.\d*\([eE][+-]\?\d\+\)\?[fFdD]\?\>"
syn match scalaNumber "\<\.\d\+\([eE][+-]\?\d\+\)\?[fFdD]\?\>"
syn match scalaNumber "\<\d\+[eE][+-]\?\d\+[fFdD]\?\>"

" Keywords
syn keyword scalaKeyword abstract case catch class def do else extends final finally
syn keyword scalaKeyword for forSome if implicit import lazy match new object override
syn keyword scalaKeyword package private protected return sealed super this throw trait
syn keyword scalaKeyword try type val var while with yield given using enum export
syn keyword scalaKeyword then end extension transparent inline opaque derives

" Conditional / Repeat / Exception
syn keyword scalaConditional if else match case
syn keyword scalaRepeat for while do
syn keyword scalaException try catch finally throw

" Boolean / Null
syn keyword scalaConstant true false null

" Types
syn keyword scalaType Int Long Short Byte Float Double Boolean Char String Unit
syn keyword scalaType Nothing Null Any AnyRef AnyVal Array List Vector Map Set
syn keyword scalaType Option Some None Either Left Right Future Promise Try Success
syn keyword scalaType Failure Seq IndexedSeq Iterator Iterable Range Stream LazyList
syn keyword scalaType Tuple BigInt BigDecimal

" Builtins
syn keyword scalaBuiltin println print printf require assert assume classOf
syn keyword scalaBuiltin isInstanceOf asInstanceOf synchronized notify notifyAll wait
syn keyword scalaBuiltin hashCode toString equals getClass

" Annotations
syn match scalaAnnotation "@\w\+"

" Operators
syn match scalaOperator "[-+*/%&|^~<>=!:]"
syn match scalaOperator "=>"
syn match scalaOperator "<-"
syn match scalaOperator "\<_\>"

" Special identifiers
syn keyword scalaSpecial this super

" Highlighting
hi def link scalaTodo Todo
hi def link scalaLineComment Comment
hi def link scalaBlockComment Comment
hi def link scalaDocComment Comment
hi def link scalaDocTag Special
hi def link scalaString String
hi def link scalaTripleString String
hi def link scalaChar String
hi def link scalaEscape Special
hi def link scalaInterpolation Special
hi def link scalaStringPrefix Special
hi def link scalaSymbol Constant
hi def link scalaNumber Number
hi def link scalaKeyword Keyword
hi def link scalaConditional Conditional
hi def link scalaRepeat Repeat
hi def link scalaException Exception
hi def link scalaConstant Constant
hi def link scalaType Type
hi def link scalaBuiltin Function
hi def link scalaAnnotation PreProc
hi def link scalaOperator Operator
hi def link scalaSpecial Statement

let b:current_syntax = "scala"
