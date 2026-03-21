" Vim syntax file
" Language:    OCaml
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword ocamlTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region ocamlComment start="(\*" end="\*)" contains=ocamlComment,ocamlTodo

" Strings
syn region ocamlString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=ocamlEscape
syn match ocamlEscape contained +\\[\\'"ntbr ]+
syn match ocamlEscape contained +\\[0-9]\{3}+
syn match ocamlEscape contained +\\x[0-9a-fA-F]\{2}+
syn match ocamlEscape contained +\\o[0-3][0-7]\{2}+
syn match ocamlEscape contained +\\u{[0-9a-fA-F]\+}+

" Characters
syn match ocamlChar +'[^'\\]'+
syn match ocamlChar +'\\[\\'"ntbr ]'+
syn match ocamlChar +'\\[0-9]\{3}'+
syn match ocamlChar +'\\x[0-9a-fA-F]\{2}'+

" Numbers
syn match ocamlInteger "\<\d[0-9_]*\>"
syn match ocamlInteger "\<0[xX][0-9a-fA-F][0-9a-fA-F_]*\>"
syn match ocamlInteger "\<0[oO][0-7][0-7_]*\>"
syn match ocamlInteger "\<0[bB][01][01_]*\>"
syn match ocamlFloat "\<\d[0-9_]*\.\d[0-9_]*\>"
syn match ocamlFloat "\<\d[0-9_]*\.\>"
syn match ocamlFloat "\<\d[0-9_]*\.[0-9_]*[eE][+-]\?\d[0-9_]*\>"
syn match ocamlFloat "\<\d[0-9_]*[eE][+-]\?\d[0-9_]*\>"

" Keywords
syn keyword ocamlKeyword and as assert asr begin class constraint do done
syn keyword ocamlKeyword downto else end exception external false for fun
syn keyword ocamlKeyword function functor if in include inherit initializer
syn keyword ocamlKeyword land lazy let lor lsl lsr lxor match method mod
syn keyword ocamlKeyword module mutable new nonrec object of open or private
syn keyword ocamlKeyword rec sig struct then to true try type val virtual
syn keyword ocamlKeyword when while with

" Conditional
syn keyword ocamlConditional if then else match with when

" Repeat
syn keyword ocamlRepeat for while do done to downto

" Exception
syn keyword ocamlException try with exception raise

" Types
syn keyword ocamlType int float bool char string unit list array option
syn keyword ocamlType result ref exn bytes nativeint int32 int64 lazy_t
syn keyword ocamlType in_channel out_channel format format4 format6

" Built-in functions
syn keyword ocamlBuiltin print_string print_endline print_int print_float
syn keyword ocamlBuiltin print_char print_newline prerr_string prerr_endline
syn keyword ocamlBuiltin prerr_int prerr_float failwith invalid_arg raise
syn keyword ocamlBuiltin exit at_exit ignore not succ pred abs max_int
syn keyword ocamlBuiltin min_int lnot max_float min_float epsilon_float
syn keyword ocamlBuiltin infinity nan int_of_float float_of_int int_of_char
syn keyword ocamlBuiltin char_of_int string_of_bool bool_of_string
syn keyword ocamlBuiltin string_of_int int_of_string string_of_float
syn keyword ocamlBuiltin float_of_string fst snd stdin stdout stderr
syn keyword ocamlBuiltin open_out open_in close_out close_in input_line
syn keyword ocamlBuiltin input output_string output flush seek_out pos_out
syn keyword ocamlBuiltin seek_in pos_in in_channel_length ref incr decr
syn keyword ocamlBuiltin compare min max

" Constants
syn keyword ocamlConstant true false None Some Ok Error

" Operators
syn match ocamlOperator "[-+*/]=\?"
syn match ocamlOperator "[<>]=\?"
syn match ocamlOperator "<>\|<="
syn match ocamlOperator "&&\|||"
syn match ocamlOperator "\<not\>"
syn match ocamlOperator "::"
syn match ocamlOperator "@"
syn match ocamlOperator "\^"
syn match ocamlOperator "|>"
syn match ocamlOperator "@@"
syn match ocamlOperator "->"
syn match ocamlOperator "<-"
syn match ocamlOperator ";;"
syn match ocamlOperator "|"

" Module access
syn match ocamlModule "\<[A-Z][a-zA-Z0-9_]*\>\ze\."

" Function definitions
syn match ocamlFunction "\<let\s\+\(rec\s\+\)\?[a-z_][a-zA-Z0-9_']*\>"

" Type variables
syn match ocamlTypeVar "'[a-z][a-zA-Z0-9_]*"

" Polymorphic variants
syn match ocamlVariant "`[A-Z][a-zA-Z0-9_]*"

" Constructors
syn match ocamlConstructor "\<[A-Z][a-zA-Z0-9_]*\>"

" Labels
syn match ocamlLabel "\~[a-z][a-zA-Z0-9_]*"
syn match ocamlLabel "?[a-z][a-zA-Z0-9_]*"

" Printf format strings
syn match ocamlFormat "%[-+ #0]*\*\?\(\d\+\)\?\(\.\(\d\+\|\*\)\)\?[dioxXucsfeEgGbBnlLNSat%@!,]" contained containedin=ocamlString

hi def link ocamlComment Comment
hi def link ocamlTodo Todo
hi def link ocamlString String
hi def link ocamlEscape Special
hi def link ocamlChar String
hi def link ocamlInteger Number
hi def link ocamlFloat Number
hi def link ocamlKeyword Keyword
hi def link ocamlConditional Conditional
hi def link ocamlRepeat Repeat
hi def link ocamlException Exception
hi def link ocamlType Type
hi def link ocamlBuiltin Function
hi def link ocamlConstant Constant
hi def link ocamlOperator Operator
hi def link ocamlModule Type
hi def link ocamlFunction Function
hi def link ocamlTypeVar Special
hi def link ocamlVariant Constant
hi def link ocamlConstructor Constant
hi def link ocamlLabel Label
hi def link ocamlFormat Special

let b:current_syntax = "ocaml"
