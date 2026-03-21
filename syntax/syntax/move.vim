" Vim syntax file
" Language:    Move
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword moveTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region moveComment start="//" end="$" contains=moveTodo
syn region moveComment start="/\*" end="\*/" contains=moveTodo,moveComment

" Strings
syn region moveString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=moveEscape
syn region moveByteString start=+b"+ skip=+\\\\\|\\"+ end=+"+ contains=moveEscape
syn match moveEscape contained +\\[nrt\\'"0]+
syn match moveEscape contained +\\x[0-9a-fA-F]\{2}+
syn match moveEscape contained +\\u{[0-9a-fA-F]\+}+

" Numbers
syn match moveDecNumber "\<[0-9][0-9_]*\>"
syn match moveHexNumber "\<0x[0-9a-fA-F_]\+\>"
syn match moveNumSuffix "\<[0-9][0-9_]*\(u8\|u16\|u32\|u64\|u128\|u256\)\>"

" Keywords
syn keyword moveKeyword module script use as friend public fun entry
syn keyword moveKeyword native struct has let mut return abort
syn keyword moveKeyword move copy acquires phantom const inline

" Spec keywords
syn keyword moveSpec spec schema invariant ensures requires modifies
syn keyword moveSpec pragma assume assert include apply global local
syn keyword moveSpec exists forall choose min

" Conditional
syn keyword moveConditional if else

" Repeat
syn keyword moveRepeat while loop

" Statement
syn keyword moveStatement break continue return abort

" Boolean
syn keyword moveBoolean true false

" Types
syn keyword moveType bool u8 u16 u32 u64 u128 u256 address signer vector

" Abilities
syn keyword moveAbility copy drop store key

" Builtins
syn keyword moveBuiltin move_to move_from borrow_global borrow_global_mut
syn keyword moveBuiltin exists freeze
syn match moveBuiltin /\<assert!/

" Address literal
syn match moveAddress /@0x[0-9a-fA-F]\+/

" Operators
syn match moveOperator /[-+%<>!&|^*=]=\?/
syn match moveOperator /&&\|||/
syn match moveOperator /::/
syn match moveOperator /=>/

" Functions
syn match moveFunction /\<\w\+\>\ze\s*(/
syn match moveModPath /\<\w\+\>::/

hi def link moveComment Comment
hi def link moveTodo Todo
hi def link moveString String
hi def link moveByteString String
hi def link moveEscape Special
hi def link moveDecNumber Number
hi def link moveHexNumber Number
hi def link moveNumSuffix Type
hi def link moveKeyword Keyword
hi def link moveSpec PreProc
hi def link moveConditional Conditional
hi def link moveRepeat Repeat
hi def link moveStatement Statement
hi def link moveBoolean Constant
hi def link moveType Type
hi def link moveAbility Type
hi def link moveBuiltin Function
hi def link moveAddress Special
hi def link moveOperator Operator
hi def link moveFunction Function
hi def link moveModPath Identifier

let b:current_syntax = "move"
