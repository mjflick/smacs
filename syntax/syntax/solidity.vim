" Vim syntax file
" Language:    Solidity
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword solidityTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region solidityComment start="//" end="$" contains=solidityTodo
syn region solidityComment start="/\*" end="\*/" contains=solidityTodo,solidityComment

" Strings
syn region solidityString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=solidityEscape
syn region solidityString start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=solidityEscape
syn match solidityEscape contained +\\[nrt\\'"0]+
syn match solidityEscape contained +\\x[0-9a-fA-F]\{2}+
syn match solidityEscape contained +\\u[0-9a-fA-F]\{4}+

" Numbers
syn match solidityDecNumber "\<[0-9][0-9_]*\>"
syn match solidityHexNumber "\<0x[0-9a-fA-F_]\+\>"
syn match solidityFloat "\<[0-9][0-9_]*\.[0-9][0-9_]*\>"
syn match solidityFloat "\<[0-9][0-9_]*\.[0-9][0-9_]*[eE][+-]\?[0-9_]\+\>"
syn match solidityFloat "\<[0-9][0-9_]*[eE][+-]\?[0-9_]\+\>"

" Ether units
syn keyword solidityUnit wei gwei ether
syn keyword solidityUnit seconds minutes hours days weeks

" Pragma
syn match solidityPragma /\<pragma\s\+solidity\>/

" Keywords
syn keyword solidityKeyword pragma solidity import contract interface library
syn keyword solidityKeyword abstract is using for struct enum mapping
syn keyword solidityKeyword event error modifier function constructor
syn keyword solidityKeyword receive fallback returns return
syn keyword solidityKeyword new delete this super type assembly let
syn keyword solidityKeyword switch case default unchecked

" Visibility and mutability
syn keyword solidityModifier public private internal external
syn keyword solidityModifier pure view payable nonpayable
syn keyword solidityModifier virtual override constant immutable
syn keyword solidityModifier anonymous indexed
syn keyword solidityModifier memory storage calldata

" Conditional
syn keyword solidityConditional if else

" Repeat
syn keyword solidityRepeat for while do

" Exception
syn keyword solidityException try catch revert require assert

" Statement
syn keyword solidityStatement emit break continue

" Boolean
syn keyword solidityBoolean true false

" Types
syn keyword solidityType address bool string bytes
syn keyword solidityType bytes1 bytes2 bytes3 bytes4 bytes8 bytes16 bytes32
syn keyword solidityType int int8 int16 int32 int64 int128 int256
syn keyword solidityType uint uint8 uint16 uint32 uint64 uint128 uint256
syn keyword solidityType fixed ufixed

" Global variables
syn match solidityGlobal /\<msg\.sender\>/
syn match solidityGlobal /\<msg\.value\>/
syn match solidityGlobal /\<msg\.data\>/
syn match solidityGlobal /\<msg\.sig\>/
syn match solidityGlobal /\<block\.timestamp\>/
syn match solidityGlobal /\<block\.number\>/
syn match solidityGlobal /\<block\.difficulty\>/
syn match solidityGlobal /\<block\.gaslimit\>/
syn match solidityGlobal /\<block\.coinbase\>/
syn match solidityGlobal /\<block\.chainid\>/
syn match solidityGlobal /\<block\.basefee\>/
syn match solidityGlobal /\<tx\.origin\>/
syn match solidityGlobal /\<tx\.gasprice\>/
syn keyword solidityGlobal gasleft blockhash

" Crypto and ABI functions
syn keyword solidityBuiltin keccak256 sha256 ripemd160 ecrecover
syn keyword solidityBuiltin addmod mulmod selfdestruct
syn match solidityBuiltin /\<abi\.encode\>/
syn match solidityBuiltin /\<abi\.encodePacked\>/
syn match solidityBuiltin /\<abi\.encodeWithSelector\>/
syn match solidityBuiltin /\<abi\.encodeWithSignature\>/
syn match solidityBuiltin /\<abi\.decode\>/

" Operators
syn match solidityOperator /[-+%<>!&|^*=]=\?/
syn match solidityOperator /&&\|||/
syn match solidityOperator /=>/

" Functions
syn match solidityFunction /\<\w\+\>\ze\s*(/

hi def link solidityComment Comment
hi def link solidityTodo Todo
hi def link solidityString String
hi def link solidityEscape Special
hi def link solidityDecNumber Number
hi def link solidityHexNumber Number
hi def link solidityFloat Number
hi def link solidityUnit Constant
hi def link solidityPragma PreProc
hi def link solidityKeyword Keyword
hi def link solidityModifier Keyword
hi def link solidityConditional Conditional
hi def link solidityRepeat Repeat
hi def link solidityException Exception
hi def link solidityStatement Statement
hi def link solidityBoolean Constant
hi def link solidityType Type
hi def link solidityGlobal Identifier
hi def link solidityBuiltin Function
hi def link solidityOperator Operator
hi def link solidityFunction Function

let b:current_syntax = "solidity"
