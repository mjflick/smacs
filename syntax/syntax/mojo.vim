" Vim syntax file
" Language:    Mojo
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword mojoTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region mojoComment start="#" end="$" contains=mojoTodo

" Strings
syn region mojoString start=+"""+ end=+"""+ contains=mojoEscape,mojoFmtStr
syn region mojoString start=+'''+ end=+'''+ contains=mojoEscape,mojoFmtStr
syn region mojoString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=mojoEscape,mojoFmtStr
syn region mojoString start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=mojoEscape,mojoFmtStr
syn match mojoEscape contained +\\[nrt\\'"0abfv]+
syn match mojoEscape contained +\\x[0-9a-fA-F]\{2}+
syn match mojoEscape contained +\\u[0-9a-fA-F]\{4}+
syn match mojoEscape contained +\\U[0-9a-fA-F]\{8}+
syn match mojoEscape contained +\\[0-7]\{1,3}+

" Format strings
syn match mojoFmtStr contained /{[^}]*}/

" Numbers
syn match mojoDecNumber "\<[0-9][0-9_]*\>"
syn match mojoHexNumber "\<0x[0-9a-fA-F_]\+\>"
syn match mojoOctNumber "\<0o[0-7_]\+\>"
syn match mojoBinNumber "\<0b[01_]\+\>"
syn match mojoFloat "\<[0-9][0-9_]*\.[0-9][0-9_]*\>"
syn match mojoFloat "\<[0-9][0-9_]*\.[0-9][0-9_]*[eE][+-]\?[0-9_]\+\>"
syn match mojoFloat "\<[0-9][0-9_]*[eE][+-]\?[0-9_]\+\>"

" Keywords
syn keyword mojoKeyword fn def struct trait var let alias
syn keyword mojoKeyword inout borrowed owned raises capturing
syn keyword mojoKeyword self Self import from as
syn keyword mojoKeyword break continue pass raise
syn keyword mojoKeyword with del yield async await lambda
syn keyword mojoKeyword and or not is

" Conditional
syn keyword mojoConditional if elif else

" Repeat
syn keyword mojoRepeat for while in

" Statement
syn keyword mojoStatement return

" Exception
syn keyword mojoException try except finally assert raise

" Boolean and None
syn keyword mojoBoolean True False
syn keyword mojoConstant None

" Types
syn keyword mojoType Int Int8 Int16 Int32 Int64
syn keyword mojoType UInt8 UInt16 UInt32 UInt64
syn keyword mojoType Float16 Float32 Float64
syn keyword mojoType Bool String StringLiteral StringRef
syn keyword mojoType List Dict Set Tuple Optional
syn keyword mojoType DType SIMD Tensor Pointer AnyType NoneType
syn keyword mojoType Error Scalar Index Slice Range
syn keyword mojoType Variant Reference UnsafePointer

" Decorators
syn match mojoDecorator /@\w\+/
syn match mojoDecorator /@__\w\+/

" Builtins
syn keyword mojoBuiltin print len range int str bool ord chr
syn keyword mojoBuiltin abs min max pow round hash id type
syn keyword mojoBuiltin isinstance issubclass rebind constrained
syn keyword mojoBuiltin debug_assert simd_width_of alignof sizeof bitcast

" Operators
syn match mojoOperator /[-+%<>!&|^*=]=\?/
syn match mojoOperator /\*\*/
syn match mojoOperator /->/
syn match mojoOperator /&&\|||/

" Functions
syn match mojoFunction /\<\w\+\>\ze\s*(/

hi def link mojoComment Comment
hi def link mojoTodo Todo
hi def link mojoString String
hi def link mojoEscape Special
hi def link mojoFmtStr Special
hi def link mojoDecNumber Number
hi def link mojoHexNumber Number
hi def link mojoOctNumber Number
hi def link mojoBinNumber Number
hi def link mojoFloat Number
hi def link mojoKeyword Keyword
hi def link mojoConditional Conditional
hi def link mojoRepeat Repeat
hi def link mojoStatement Statement
hi def link mojoException Exception
hi def link mojoBoolean Constant
hi def link mojoConstant Constant
hi def link mojoType Type
hi def link mojoDecorator PreProc
hi def link mojoBuiltin Function
hi def link mojoOperator Operator
hi def link mojoFunction Function

let b:current_syntax = "mojo"
