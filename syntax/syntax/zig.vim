" Vim syntax file
" Language:    Zig
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword zigTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region zigComment start="//" end="$" contains=zigTodo

" Strings
syn region zigString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=zigEscape
syn match zigEscape contained +\\[nrt\\'\"0]+
syn match zigEscape contained +\\x[0-9a-fA-F]\{2}+
syn match zigEscape contained +\\u{[0-9a-fA-F]\+}+

" Multiline strings
syn match zigMultiString /\\\\.*$/

" Character literals
syn match zigChar +'[^'\\]'+
syn match zigChar +'\\[nrt\\'\"0]'+
syn match zigChar +'\\x[0-9a-fA-F]\{2}'+

" Numbers
syn match zigNumber "\<\d\+\>"
syn match zigNumber "\<\d[0-9_]*\d\>"
syn match zigNumber "\<0[xX][0-9a-fA-F_]\+\>"
syn match zigNumber "\<0[oO][0-7_]\+\>"
syn match zigNumber "\<0[bB][01_]\+\>"
syn match zigFloat "\<\d\+\.\d*\>"
syn match zigFloat "\<\d\+\.\d*[eE][+-]\?\d\+\>"
syn match zigFloat "\<\d\+[eE][+-]\?\d\+\>"

" Keywords
syn keyword zigKeyword align allowzero and asm async await break callconv
syn keyword zigKeyword catch comptime const continue defer else enum
syn keyword zigKeyword errdefer error export extern fn for if inline
syn keyword zigKeyword linksection noalias nosuspend noinline orelse or
syn keyword zigKeyword packed pub resume return struct suspend switch
syn keyword zigKeyword test threadlocal try union unreachable var volatile
syn keyword zigKeyword while addrspace

" Conditional
syn keyword zigConditional if else switch

" Repeat
syn keyword zigRepeat for while

" Exception
syn keyword zigException try catch errdefer error

" Types
syn keyword zigType i8 i16 i32 i64 i128 u8 u16 u32 u64 u128
syn keyword zigType f16 f32 f64 f80 f128 bool void noreturn type
syn keyword zigType anyerror anyframe anytype anyopaque
syn keyword zigType comptime_int comptime_float usize isize
syn keyword zigType c_char c_short c_int c_long c_longlong
syn keyword zigType c_ulonglong c_longdouble

" Constants
syn keyword zigConstant true false null undefined

" Built-in functions
syn match zigBuiltin /@\w\+/

" Operators
syn match zigOperator /[-+%<>!&|^*=]=\?/
syn match zigOperator /\.\.\./
syn match zigOperator /\.\./
syn match zigOperator /\.\*/
syn match zigOperator /&&/
syn match zigOperator /||/
syn match zigOperator /<<\|>>/
syn match zigOperator /++/
syn match zigOperator /\*\*/

" Functions
syn match zigFunction /\<\w\+\>\ze\s*(/

" Error sets
syn match zigErrorSet /\<error\.\w\+/

" Field access
syn match zigField /\.\w\+/

hi def link zigComment Comment
hi def link zigTodo Todo
hi def link zigString String
hi def link zigMultiString String
hi def link zigEscape Special
hi def link zigChar String
hi def link zigNumber Number
hi def link zigFloat Number
hi def link zigKeyword Keyword
hi def link zigConditional Conditional
hi def link zigRepeat Repeat
hi def link zigException Exception
hi def link zigType Type
hi def link zigConstant Constant
hi def link zigBuiltin Function
hi def link zigOperator Operator
hi def link zigFunction Function
hi def link zigErrorSet Special

let b:current_syntax = "zig"
