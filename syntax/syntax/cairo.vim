" Vim syntax file
" Language:    Cairo
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword cairoTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region cairoComment start="//" end="$" contains=cairoTodo

" Strings
syn region cairoString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=cairoEscape
syn region cairoString start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=cairoEscape
syn match cairoEscape contained +\\[nrt\\'"0]+
syn match cairoEscape contained +\\x[0-9a-fA-F]\{2}+
syn match cairoEscape contained +\\u{[0-9a-fA-F]\+}+

" Numbers
syn match cairoDecNumber "\<[0-9][0-9_]*\>"
syn match cairoHexNumber "\<0x[0-9a-fA-F_]\+\>"

" Keywords
syn keyword cairoKeyword fn let mut ref mod use as impl trait
syn keyword cairoKeyword struct enum type const extern pub
syn keyword cairoKeyword implicits of nopanic with and
syn keyword cairoKeyword self super

" Conditional
syn keyword cairoConditional if else match

" Repeat
syn keyword cairoRepeat loop while for in

" Statement
syn keyword cairoStatement break continue return

" Boolean
syn keyword cairoBoolean true false

" Types
syn keyword cairoType felt252 bool u8 u16 u32 u64 u128 u256
syn keyword cairoType i8 i16 i32 i64 i128 usize
syn keyword cairoType Array Span Dict Option Result Box Nullable
syn keyword cairoType ByteArray ContractAddress ClassHash
syn keyword cairoType StorageAddress EthAddress

" Builtins
syn keyword cairoBuiltin assert panic print println
syn match cairoBuiltin /\<array!/
syn keyword cairoBuiltin get_caller_address get_contract_address
syn keyword cairoBuiltin get_block_timestamp get_block_number

" Attributes
syn region cairoAttribute start="#\[" end="\]" contains=cairoString

" Operators
syn match cairoOperator /[-+%<>!&|^*=]=\?/
syn match cairoOperator /&&\|||/
syn match cairoOperator /::/
syn match cairoOperator /=>/
syn match cairoOperator /->/

" Functions
syn match cairoFunction /\<\w\+\>\ze\s*(/
syn match cairoModPath /\<\w\+\>::/

hi def link cairoComment Comment
hi def link cairoTodo Todo
hi def link cairoString String
hi def link cairoEscape Special
hi def link cairoDecNumber Number
hi def link cairoHexNumber Number
hi def link cairoKeyword Keyword
hi def link cairoConditional Conditional
hi def link cairoRepeat Repeat
hi def link cairoStatement Statement
hi def link cairoBoolean Constant
hi def link cairoType Type
hi def link cairoBuiltin Function
hi def link cairoAttribute PreProc
hi def link cairoOperator Operator
hi def link cairoFunction Function
hi def link cairoModPath Identifier

let b:current_syntax = "cairo"
