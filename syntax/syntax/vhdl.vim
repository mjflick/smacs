" Vim syntax file
" Language:    VHDL
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case ignore

" Comments
syn keyword vhdlTodo contained TODO FIXME XXX NOTE HACK BUG
syn match vhdlComment "--.*$" contains=vhdlTodo

" Strings
syn region vhdlString start=+"+ end=+"+
syn match vhdlCharLiteral "'.'"

" Numbers
syn match vhdlNumber "\<\d[0-9_]*\>"
syn match vhdlNumber "\<\d[0-9_]*\.\d[0-9_]*\([eE][+-]\?\d[0-9_]*\)\?\>"
syn match vhdlNumber "\<\d[0-9_]*[eE][+-]\?\d[0-9_]*\>"
syn match vhdlNumber "\<\d\+#[0-9a-fA-F_]\+#\>"
syn match vhdlNumber "\<\d\+#[0-9a-fA-F_]\+\.[0-9a-fA-F_]\+#\>"
syn region vhdlBitString start=+[bBoOxX]"+ end=+"+

" Keywords
syn keyword vhdlKeyword abs access after alias all
syn keyword vhdlKeyword architecture array assert attribute
syn keyword vhdlKeyword begin block body buffer bus
syn keyword vhdlKeyword component configuration constant
syn keyword vhdlKeyword disconnect downto
syn keyword vhdlKeyword entity
syn keyword vhdlKeyword file function
syn keyword vhdlKeyword generate generic group guarded
syn keyword vhdlKeyword impure in inertial inout is
syn keyword vhdlKeyword label library linkage literal
syn keyword vhdlKeyword map mod
syn keyword vhdlKeyword nand new next nor not null
syn keyword vhdlKeyword of on open or others out
syn keyword vhdlKeyword package port postponed procedure process
syn keyword vhdlKeyword protected pure
syn keyword vhdlKeyword range record register reject rem report return
syn keyword vhdlKeyword rol ror
syn keyword vhdlKeyword select severity signal shared
syn keyword vhdlKeyword sla sll sra srl subtype
syn keyword vhdlKeyword then to transport type
syn keyword vhdlKeyword unaffected units until use
syn keyword vhdlKeyword variable
syn keyword vhdlKeyword wait when with
syn keyword vhdlKeyword xnor xor

" Control flow
syn keyword vhdlConditional if else elsif end case
syn keyword vhdlRepeat loop for while

" Statement keywords
syn keyword vhdlStatement and

" Types
syn keyword vhdlType bit bit_vector boolean character
syn keyword vhdlType integer natural positive real string time
syn keyword vhdlType std_logic std_logic_vector
syn keyword vhdlType std_ulogic std_ulogic_vector
syn keyword vhdlType signed unsigned
syn keyword vhdlType line text
syn keyword vhdlType file_open_kind file_open_status severity_level

" Libraries and packages
syn keyword vhdlConstant ieee std work
syn keyword vhdlConstant std_logic_1164 numeric_std
syn keyword vhdlConstant std_logic_arith std_logic_unsigned std_logic_signed
syn keyword vhdlConstant std_logic_textio textio
syn keyword vhdlConstant math_real math_complex

" Standard values
syn match vhdlConstant "'[01UXZWLH\-]'"

" Operators
syn match vhdlOperator "<=\|=>\|:=\|/="
syn match vhdlOperator "[<>=+\-*/&]"
syn match vhdlOperator "\*\*"

" Attributes
syn match vhdlSpecial "'\w\+"

" Highlight links
hi def link vhdlComment Comment
hi def link vhdlTodo Todo
hi def link vhdlString String
hi def link vhdlCharLiteral String
hi def link vhdlBitString String
hi def link vhdlNumber Number
hi def link vhdlKeyword Keyword
hi def link vhdlConditional Conditional
hi def link vhdlRepeat Repeat
hi def link vhdlStatement Statement
hi def link vhdlType Type
hi def link vhdlConstant Constant
hi def link vhdlOperator Operator
hi def link vhdlSpecial Special

let b:current_syntax = "vhdl"
