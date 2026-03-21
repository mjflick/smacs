" Vim syntax file
" Language:    Gleam
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword gleamTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region gleamComment start="//" end="$" contains=gleamTodo

" Strings
syn region gleamString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=gleamEscape
syn match gleamEscape contained +\\[nrt\\'"0]+
syn match gleamEscape contained +\\u{[0-9a-fA-F]\+}+

" Numbers
syn match gleamDecNumber "\<[0-9][0-9_]*\>"
syn match gleamHexNumber "\<0x[0-9a-fA-F_]\+\>"
syn match gleamOctNumber "\<0o[0-7_]\+\>"
syn match gleamBinNumber "\<0b[01_]\+\>"
syn match gleamFloat "\<[0-9][0-9_]*\.[0-9][0-9_]*\>"
syn match gleamFloat "\<[0-9][0-9_]*\.[0-9][0-9_]*[eE][+-]\?[0-9_]\+\>"

" Keywords
syn keyword gleamKeyword pub fn let assert use import as
syn keyword gleamKeyword type opaque const external todo panic

" Conditional
syn keyword gleamConditional case if else

" Boolean and constants
syn keyword gleamBoolean True False
syn keyword gleamConstant Nil Ok Error

" Types
syn keyword gleamType Int Float String Bool BitArray List Result
syn keyword gleamType Option Dynamic StringBuilder Regex
syn keyword gleamType Map Set Iterator Queue Dict Order Uri

" Pipe operator
syn match gleamOperator /|>/
syn match gleamOperator /<>/
syn match gleamOperator /->/
syn match gleamOperator /\.\./
syn match gleamOperator /[-+%<>!&|^*=]=\?/
syn match gleamOperator /&&\|||/

" Module access
syn match gleamModPath /\<\w\+\>\./

" Functions
syn match gleamFunction /\<\w\+\>\ze\s*(/

" Constructors (uppercase identifiers)
syn match gleamConstructor /\<[A-Z][a-zA-Z0-9_]*\>/

hi def link gleamComment Comment
hi def link gleamTodo Todo
hi def link gleamString String
hi def link gleamEscape Special
hi def link gleamDecNumber Number
hi def link gleamHexNumber Number
hi def link gleamOctNumber Number
hi def link gleamBinNumber Number
hi def link gleamFloat Number
hi def link gleamKeyword Keyword
hi def link gleamConditional Conditional
hi def link gleamBoolean Constant
hi def link gleamConstant Constant
hi def link gleamType Type
hi def link gleamOperator Operator
hi def link gleamModPath Identifier
hi def link gleamFunction Function
hi def link gleamConstructor Type

let b:current_syntax = "gleam"
