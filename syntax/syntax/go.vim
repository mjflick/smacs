" Vim syntax file
" Language:    Go
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword goTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region goComment start="//" end="$" contains=goTodo
syn region goComment start="/\*" end="\*/" contains=goTodo

" String literals
syn region goString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=goEscape
syn region goRawString start=+`+ end=+`+
syn match goEscape contained +\\[abfnrtv\\"]+
syn match goEscape contained +\\x[0-9a-fA-F]\{2}+
syn match goEscape contained +\\u[0-9a-fA-F]\{4}+
syn match goEscape contained +\\U[0-9a-fA-F]\{8}+
syn match goEscape contained +\\[0-7]\{3}+

" Character literal
syn match goCharacter +'[^'\\]'+
syn match goCharacter +'\\[abfnrtv\\'"]'+
syn match goCharacter +'\\x[0-9a-fA-F]\{2}'+
syn match goCharacter +'\\u[0-9a-fA-F]\{4}'+
syn match goCharacter +'\\U[0-9a-fA-F]\{8}'+
syn match goCharacter +'\\[0-7]\{3}'+

" Numbers
syn match goDecimalInt "\<\d\+\>"
syn match goDecimalInt "\<\d[0-9_]*\d\>"
syn match goHexInt "\<0[xX][0-9a-fA-F_]\+\>"
syn match goOctInt "\<0[oO][0-7_]\+\>"
syn match goBinInt "\<0[bB][01_]\+\>"
syn match goFloat "\<\d[0-9_]*\.\d[0-9_]*\>"
syn match goFloat "\<\d[0-9_]*\.[0-9_]*[eE][+-]\?\d[0-9_]*\>"
syn match goFloat "\<\d[0-9_]*[eE][+-]\?\d[0-9_]*\>"
syn match goHexFloat "\<0[xX][0-9a-fA-F_]*\.[0-9a-fA-F_]*[pP][+-]\?\d[0-9_]*\>"
syn match goImaginary "\<\d[0-9_]*i\>"
syn match goImaginary "\<\d[0-9_]*\.\d[0-9_]*i\>"

" Keywords
syn keyword goKeyword break case chan const continue default
syn keyword goKeyword defer else fallthrough for func go goto
syn keyword goKeyword if import interface map package range
syn keyword goKeyword return select struct switch type var

" Conditional
syn keyword goConditional if else switch select case default

" Repeat
syn keyword goRepeat for range

" Types
syn keyword goType bool byte complex64 complex128 error
syn keyword goType float32 float64 int int8 int16 int32 int64
syn keyword goType rune string uint uint8 uint16 uint32 uint64
syn keyword goType uintptr any comparable

" Built-in functions
syn keyword goBuiltin append cap clear close complex copy delete
syn keyword goBuiltin imag len make max min new panic print
syn keyword goBuiltin println real recover

" Constants
syn keyword goConstant true false nil iota

" Operators
syn match goOperator /[-+%<>!&|^*=]=\?/
syn match goOperator /\/[^/*]/me=e-1
syn match goOperator /:=/
syn match goOperator /<-/
syn match goOperator /\.\.\./
syn match goOperator /&&\|||/

" Functions
syn match goFunction /\<\w\+\>\ze\s*(/

" Struct fields and tags
syn match goStructTag /`[^`]*`/

" Package declaration
syn match goPackage /\<package\s\+\w\+/

" Import paths
syn region goImportPath start=+"+ end=+"+ contained
syn region goImportBlock start="import\s\+(" end=")" contains=goImportPath,goComment

" Format verbs in strings
syn match goFormatVerb /%[-+# 0]*\*\?\(\d\+\)\?\(\.\(\d\+\|\*\)\)\?[vTtbcdoOqxXUeEfFgGsp%]/ contained containedin=goString

hi def link goComment Comment
hi def link goTodo Todo
hi def link goString String
hi def link goRawString String
hi def link goEscape Special
hi def link goCharacter String
hi def link goDecimalInt Number
hi def link goHexInt Number
hi def link goOctInt Number
hi def link goBinInt Number
hi def link goFloat Number
hi def link goHexFloat Number
hi def link goImaginary Number
hi def link goKeyword Keyword
hi def link goConditional Conditional
hi def link goRepeat Repeat
hi def link goType Type
hi def link goBuiltin Function
hi def link goConstant Constant
hi def link goOperator Operator
hi def link goFunction Function
hi def link goStructTag Special
hi def link goPackage Statement
hi def link goImportPath String
hi def link goFormatVerb Special

let b:current_syntax = "go"
