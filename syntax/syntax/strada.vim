" Vim syntax file
" Language:    Strada
" Maintainer:  Michael J. Flickinger
" URL:         https://github.com/strada-lang/strada-lang
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn match stradaComment "#.*$" contains=stradaTodo
syn keyword stradaTodo contained TODO FIXME XXX NOTE HACK BUG

" Strings
syn region stradaString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=stradaEscape,stradaInterp
syn region stradaString start=+'+ skip=+\\\\\|\\'+ end=+'+
syn match stradaEscape contained "\\[\\nrtfabe0]"
syn match stradaEscape contained "\\x[0-9a-fA-F]\{2}"
syn match stradaInterp contained "\$[a-zA-Z_][a-zA-Z0-9_]*"
syn match stradaInterp contained "@[a-zA-Z_][a-zA-Z0-9_]*"

" Numbers
syn match stradaNumber "\<\d\+\>"
syn match stradaNumber "\<\d\+\.\d\+\>"
syn match stradaNumber "\<\d\+\.\d\+[eE][+-]\?\d\+\>"
syn match stradaNumber "\<0x[0-9a-fA-F]\+\>"
syn match stradaNumber "\<0b[01]\+\>"
syn match stradaNumber "\<0o[0-7]\+\>"

" Keywords
syn keyword stradaKeyword func fn return my our local
syn keyword stradaKeyword package use import_lib import_object import_archive version
syn keyword stradaKeyword has ro rw extends with bless
syn keyword stradaKeyword before after around private
syn keyword stradaKeyword const enum
syn keyword stradaKeyword async await
syn keyword stradaKeyword BEGIN END

" Control flow
syn keyword stradaConditional if elsif else unless
syn keyword stradaRepeat while until for foreach do
syn keyword stradaStatement last next redo goto die warn exit

" Exception handling
syn keyword stradaException try catch throw

" Operators (word-based)
syn keyword stradaOperator eq ne lt gt le ge cmp
syn keyword stradaOperator and or not
syn keyword stradaOperator defined exists delete ref

" Types
syn keyword stradaType int num str scalar array hash void dynamic
syn keyword stradaType int8 int16 uint8 byte uint16 uint32 uint64 size_t char float double

" Built-in functions
syn keyword stradaBuiltin say print warn push pop shift unshift splice reverse sort
syn keyword stradaBuiltin keys values each length substr index rindex
syn keyword stradaBuiltin split join sprintf chr ord chomp chop
syn keyword stradaBuiltin uc lc ucfirst lcfirst trim
syn keyword stradaBuiltin map grep match replace replace_all
syn keyword stradaBuiltin abs int hex oct ref bless tie untie tied select

" Constants / special values
syn keyword stradaConstant undef

" Special compiler tokens
syn keyword stradaSpecial __C__ __PACKAGE__ __FILE__ __LINE__

" Namespace calls
syn match stradaNamespace "\<\(core\|sys\|math\|async\|c\|utf8\|ssl\|usb\)::" nextgroup=stradaNamespaceFunc
syn match stradaNamespaceFunc contained "[a-zA-Z_][a-zA-Z0-9_]*"

" Package namespace calls
syn match stradaPackageCall "\<[A-Z][A-Za-z0-9_]*::[a-zA-Z_][a-zA-Z0-9_]*"

" Variables with sigils
syn match stradaScalar "\$[a-zA-Z_][a-zA-Z0-9_]*"
syn match stradaArray "@[a-zA-Z_][a-zA-Z0-9_]*"
syn match stradaHash "%[a-zA-Z_][a-zA-Z0-9_]*"

" References
syn match stradaReference "\\$[a-zA-Z_][a-zA-Z0-9_]*"
syn match stradaReference "\\@[a-zA-Z_][a-zA-Z0-9_]*"
syn match stradaReference "\\%[a-zA-Z_][a-zA-Z0-9_]*"

" Function definitions
syn match stradaFuncDef "\<func\s\+[a-zA-Z_][a-zA-Z0-9_]*" contains=stradaKeyword
syn match stradaFuncDef "\<fn\s\+[a-zA-Z_][a-zA-Z0-9_]*" contains=stradaKeyword

" Method calls with arrow
syn match stradaMethodCall "->[a-zA-Z_][a-zA-Z0-9_]*"

" Labels
syn match stradaLabel "^\s*[A-Z_][A-Z0-9_]*:"

" Highlighting links
hi def link stradaComment Comment
hi def link stradaTodo Todo
hi def link stradaString String
hi def link stradaEscape Special
hi def link stradaInterp Special
hi def link stradaNumber Number
hi def link stradaKeyword Keyword
hi def link stradaConditional Conditional
hi def link stradaRepeat Repeat
hi def link stradaStatement Statement
hi def link stradaException Exception
hi def link stradaOperator Operator
hi def link stradaType Type
hi def link stradaBuiltin Function
hi def link stradaConstant Constant
hi def link stradaSpecial Special
hi def link stradaNamespace Special
hi def link stradaNamespaceFunc Function
hi def link stradaPackageCall Function
hi def link stradaScalar Identifier
hi def link stradaArray Identifier
hi def link stradaHash Identifier
hi def link stradaReference Special
hi def link stradaFuncDef Function
hi def link stradaMethodCall Function
hi def link stradaLabel Label

let b:current_syntax = "strada"
