" Vim syntax file
" Language:    V
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword vTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region vComment start="//" end="$" contains=vTodo
syn region vComment start="/\*" end="\*/" contains=vTodo

" String literals
syn region vString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=vEscape,vStringInterp
syn region vString start=+'+ skip=+\\\\\|\\'+ end=+'+
syn region vRawString start=+`+ end=+`+
syn match vEscape contained +\\[abfnrtv\\'"0]+
syn match vEscape contained +\\x[0-9a-fA-F]\{2}+
syn match vEscape contained +\\u[0-9a-fA-F]\{4}+
syn match vEscape contained +\\U[0-9a-fA-F]\{8}+
syn match vStringInterp contained /\$\w\+/
syn match vStringInterp contained /\${[^}]*}/

" Numbers
syn match vDecimalInt "\<\d\+\>"
syn match vDecimalInt "\<\d[0-9_]*\d\>"
syn match vHexInt "\<0[xX][0-9a-fA-F_]\+\>"
syn match vOctInt "\<0[oO][0-7_]\+\>"
syn match vBinInt "\<0[bB][01_]\+\>"
syn match vFloat "\<\d[0-9_]*\.\d[0-9_]*\>"
syn match vFloat "\<\d[0-9_]*\.[0-9_]*[eE][+-]\?\d[0-9_]*\>"
syn match vFloat "\<\d[0-9_]*[eE][+-]\?\d[0-9_]*\>"

" Keywords
syn keyword vKeyword as asm assert atomic break const continue
syn keyword vKeyword defer else enum fn for go goto
syn keyword vKeyword if import in interface is isreftype
syn keyword vKeyword lock match module mut none or pub
syn keyword vKeyword return rlock select shared sizeof spawn
syn keyword vKeyword static struct true false type typeof union
syn keyword vKeyword unsafe volatile

" Conditional
syn keyword vConditional if else match or

" Repeat
syn keyword vRepeat for in

" Statement
syn keyword vStatement return break continue defer goto assert

" Types
syn keyword vType bool string rune i8 i16 int i64 i128
syn keyword vType byte u8 u16 u32 u64 u128 f32 f64
syn keyword vType char voidptr byteptr charptr any
syn keyword vType array map chan thread none

" Built-in functions
syn keyword vBuiltin print println eprint eprintln exit panic
syn keyword vBuiltin error assert typeof sizeof isreftype dump
syn keyword vBuiltin __offsetof

" Constants
syn keyword vConstant true false none

" Operators
syn match vOperator /[-+%<>!&|^*=]=\?/
syn match vOperator /\/[^/*]/me=e-1
syn match vOperator /:=/
syn match vOperator /<-/
syn match vOperator /\.\.\./
syn match vOperator /&&\|||/

" Functions
syn match vFunction /\<\w\+\>\ze\s*(/

" Attributes
syn match vAttribute /@\[.\{-}\]/

" Module declaration
syn match vModule /\<module\s\+\w\+/

hi def link vComment Comment
hi def link vTodo Todo
hi def link vString String
hi def link vRawString String
hi def link vEscape Special
hi def link vStringInterp Special
hi def link vDecimalInt Number
hi def link vHexInt Number
hi def link vOctInt Number
hi def link vBinInt Number
hi def link vFloat Number
hi def link vKeyword Keyword
hi def link vConditional Conditional
hi def link vRepeat Repeat
hi def link vStatement Statement
hi def link vType Type
hi def link vBuiltin Function
hi def link vConstant Constant
hi def link vOperator Operator
hi def link vFunction Function
hi def link vAttribute PreProc
hi def link vModule Statement

let b:current_syntax = "vlang"
