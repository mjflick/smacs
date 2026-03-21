" Vim syntax file
" Language:    Odin
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments (nestable block comments)
syn keyword odinTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region odinComment start="//" end="$" contains=odinTodo
syn region odinComment start="/\*" end="\*/" contains=odinTodo,odinComment

" Strings
syn region odinString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=odinEscape
syn region odinRawString start=+`+ end=+`+
syn match odinEscape contained +\\[nrt\\'"0abefv]+
syn match odinEscape contained +\\x[0-9a-fA-F]\{2}+
syn match odinEscape contained +\\u[0-9a-fA-F]\{4}+
syn match odinEscape contained +\\U[0-9a-fA-F]\{8}+
syn match odinEscape contained +\\[0-7]\{3}+

" Characters
syn match odinCharacter +'[^'\\]'+
syn match odinCharacter +'\\[nrt\\'"0abefv]'+

" Numbers
syn match odinDecNumber "\<[0-9][0-9_]*\>"
syn match odinHexNumber "\<0x[0-9a-fA-F_]\+\>"
syn match odinOctNumber "\<0o[0-7_]\+\>"
syn match odinBinNumber "\<0b[01_]\+\>"
syn match odinFloat "\<[0-9][0-9_]*\.[0-9][0-9_]*\>"
syn match odinFloat "\<[0-9][0-9_]*\.[0-9][0-9_]*[eE][+-]\?[0-9_]\+\>"
syn match odinFloat "\<[0-9][0-9_]*[eE][+-]\?[0-9_]\+\>"
syn match odinHexFloat "\<0h[0-9a-fA-F_]\+\>"

" Keywords
syn keyword odinKeyword import foreign package when where
syn keyword odinKeyword do using distinct dynamic map
syn keyword odinKeyword proc struct union enum bit_set bit_field
syn keyword odinKeyword typeid any matrix context
syn keyword odinKeyword defer or_else or_return or_break or_continue
syn keyword odinKeyword auto_cast cast transmute

" Conditional
syn keyword odinConditional if else switch case

" Repeat
syn keyword odinRepeat for in not_in

" Statement
syn keyword odinStatement break continue fallthrough return

" Boolean
syn keyword odinBoolean true false

" Constant
syn keyword odinConstant nil

" Types
syn keyword odinType bool b8 b16 b32 b64
syn keyword odinType int i8 i16 i32 i64 i128
syn keyword odinType uint u8 u16 u32 u64 u128 uintptr
syn keyword odinType f16 f32 f64
syn keyword odinType complex32 complex64 complex128
syn keyword odinType quaternion64 quaternion128 quaternion256
syn keyword odinType string cstring rawptr typeid any byte rune

" Builtins
syn keyword odinBuiltin len cap size_of align_of offset_of type_of
syn keyword odinBuiltin type_info_of typeid_of swizzle
syn keyword odinBuiltin complex quaternion real imag jmag kmag conj
syn keyword odinBuiltin expand_values min max abs clamp
syn keyword odinBuiltin new make delete free free_all
syn keyword odinBuiltin append pop clear reserve resize
syn keyword odinBuiltin map_insert card incl excl
syn keyword odinBuiltin assert panic unimplemented

" Attributes
syn region odinAttribute start="@(" end=")" contains=odinString
syn match odinAttribute /@\w\+/

" Directives
syn match odinDirective /#\w\+/

" Operators
syn match odinOperator /[-+%<>!&|^*=]=\?/
syn match odinOperator /&&\|||/
syn match odinOperator /::/
syn match odinOperator /->/
syn match odinOperator /\.\./
syn match odinOperator /\.\.=/
syn match odinOperator /\.\.< /

" Functions
syn match odinFunction /\<\w\+\>\ze\s*(/

hi def link odinComment Comment
hi def link odinTodo Todo
hi def link odinString String
hi def link odinRawString String
hi def link odinEscape Special
hi def link odinCharacter String
hi def link odinDecNumber Number
hi def link odinHexNumber Number
hi def link odinOctNumber Number
hi def link odinBinNumber Number
hi def link odinFloat Number
hi def link odinHexFloat Number
hi def link odinKeyword Keyword
hi def link odinConditional Conditional
hi def link odinRepeat Repeat
hi def link odinStatement Statement
hi def link odinBoolean Constant
hi def link odinConstant Constant
hi def link odinType Type
hi def link odinBuiltin Function
hi def link odinAttribute PreProc
hi def link odinDirective PreProc
hi def link odinOperator Operator
hi def link odinFunction Function

let b:current_syntax = "odin"
