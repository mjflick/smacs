" Vim syntax file
" Language:    WebAssembly Text Format
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword wastTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region wastComment start=";;" end="$" contains=wastTodo
syn region wastComment start="(;" end=";)" contains=wastTodo

" String literals
syn region wastString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=wastEscape
syn match wastEscape contained +\\[\\nrt"']+
syn match wastEscape contained +\\[0-9a-fA-F]\{2}+
syn match wastEscape contained +\\u{[0-9a-fA-F]\+}+

" Keywords
syn keyword wastKeyword module func param result local global
syn keyword wastKeyword table memory type import export start
syn keyword wastKeyword elem data offset mut

" Control flow keywords
syn keyword wastConditional block loop if then else end
syn keyword wastKeyword br br_if br_table return call call_indirect
syn keyword wastKeyword drop select nop unreachable

" Local/global operations
syn keyword wastKeyword get_local set_local tee_local
syn keyword wastKeyword get_global set_global
syn keyword wastKeyword local.get local.set local.tee
syn keyword wastKeyword global.get global.set

" Memory operations
syn keyword wastKeyword current_memory grow_memory
syn keyword wastKeyword load store

" Types
syn keyword wastType i32 i64 f32 f64 v128 funcref externref anyfunc

" i32 instructions
syn match wastInstruction /\<i32\.\(add\|sub\|mul\|div_s\|div_u\|rem_s\|rem_u\)\>/
syn match wastInstruction /\<i32\.\(and\|or\|xor\|shl\|shr_s\|shr_u\|rotl\|rotr\)\>/
syn match wastInstruction /\<i32\.\(clz\|ctz\|popcnt\|eqz\)\>/
syn match wastInstruction /\<i32\.\(eq\|ne\|lt_s\|lt_u\|gt_s\|gt_u\|le_s\|le_u\|ge_s\|ge_u\)\>/
syn match wastInstruction /\<i32\.const\>/
syn match wastInstruction /\<i32\.\(load\|store\)\>/
syn match wastInstruction /\<i32\.\(load8_s\|load8_u\|load16_s\|load16_u\)\>/
syn match wastInstruction /\<i32\.\(store8\|store16\)\>/
syn match wastInstruction /\<i32\.wrap_i64\>/
syn match wastInstruction /\<i32\.\(trunc_f32_s\|trunc_f64_s\)\>/
syn match wastInstruction /\<i32\.reinterpret_f32\>/

" i64 instructions
syn match wastInstruction /\<i64\.\(add\|sub\|mul\|div_s\)\>/
syn match wastInstruction /\<i64\.const\>/
syn match wastInstruction /\<i64\.\(load\|store\)\>/
syn match wastInstruction /\<i64\.\(extend_i32_s\|extend_i32_u\)\>/

" f32 instructions
syn match wastInstruction /\<f32\.\(add\|sub\|mul\|div\)\>/
syn match wastInstruction /\<f32\.const\>/
syn match wastInstruction /\<f32\.\(load\|store\)\>/
syn match wastInstruction /\<f32\.\(neg\|abs\|sqrt\|ceil\|floor\|trunc\|nearest\)\>/
syn match wastInstruction /\<f32\.convert_i32_s\>/

" f64 instructions
syn match wastInstruction /\<f64\.\(add\|sub\|mul\|div\)\>/
syn match wastInstruction /\<f64\.const\>/
syn match wastInstruction /\<f64\.\(load\|store\)\>/
syn match wastInstruction /\<f64\.\(neg\|abs\|sqrt\)\>/

" Memory instructions
syn match wastInstruction /\<memory\.\(size\|grow\|copy\|fill\)\>/

" Numbers
syn match wastNumber /\<\d\+\>/
syn match wastNumber /\<0[xX][0-9a-fA-F]\+\>/
syn match wastNumber /\<\d\+\.\d*\>/
syn match wastNumber /\<0[xX][0-9a-fA-F]*\.[0-9a-fA-F]*\>/
syn match wastNumber /[-+]\d\+\>/
syn match wastNumber /[-+]0[xX][0-9a-fA-F]\+\>/
syn match wastNumber /\<inf\>/
syn match wastNumber /\<nan\>/
syn match wastNumber /\<nan:0[xX][0-9a-fA-F]\+\>/

" Identifiers ($ prefixed)
syn match wastIdent /\$[A-Za-z0-9_.!#$%&'*+\-/:<=>?@\\^`|~]\+/

" Parentheses
syn match wastParen /[()]/

" Alignment and offset
syn match wastMemArg /\<offset=\d\+\>/
syn match wastMemArg /\<align=\d\+\>/

hi def link wastComment Comment
hi def link wastTodo Todo
hi def link wastString String
hi def link wastEscape Special
hi def link wastKeyword Keyword
hi def link wastConditional Conditional
hi def link wastType Type
hi def link wastInstruction Statement
hi def link wastNumber Number
hi def link wastIdent Identifier
hi def link wastParen Operator
hi def link wastMemArg Special

let b:current_syntax = "wast"
