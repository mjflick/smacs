" Vim syntax file
" Language:    Elixir
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn match elixirComment "#.*$" contains=elixirTodo
syn keyword elixirTodo contained TODO FIXME XXX NOTE HACK BUG

" Strings
syn region elixirString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=elixirInterpolation,elixirEscape
syn region elixirHeredoc start=+"""+ end=+"""+ contains=elixirInterpolation,elixirEscape
syn region elixirCharList start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=elixirInterpolation,elixirEscape
syn region elixirCharListHeredoc start=+'''+ end=+'''+contains=elixirInterpolation,elixirEscape
syn match elixirEscape +\\[\\'"abdefnrstv0]+ contained
syn match elixirEscape +\\x[0-9a-fA-F]\{1,2\}+ contained
syn match elixirEscape +\\u{[0-9a-fA-F]\+}+ contained
syn region elixirInterpolation matchgroup=elixirInterpolationDelim start=+#{+ end=+}+ contained contains=TOP

" Sigils
syn region elixirSigil matchgroup=elixirSigilDelim start=+\~[rRsSwWcC](+ end=+)[a-zA-Z]*+
syn region elixirSigil matchgroup=elixirSigilDelim start=+\~[rRsSwWcC]\[+ end=+\][a-zA-Z]*+
syn region elixirSigil matchgroup=elixirSigilDelim start=+\~[rRsSwWcC]{+ end=+}[a-zA-Z]*+
syn region elixirSigil matchgroup=elixirSigilDelim start=+\~[rRsSwWcC]<+ end=+>[a-zA-Z]*+
syn region elixirSigil matchgroup=elixirSigilDelim start=+\~[rRsSwWcC]/+ end=+/[a-zA-Z]*+
syn region elixirSigil matchgroup=elixirSigilDelim start=+\~[rRsSwWcC]|+ end=+|[a-zA-Z]*+
syn region elixirSigil matchgroup=elixirSigilDelim start=+\~[rRsSwWcC]"+ end=+"[a-zA-Z]*+

" Atoms
syn match elixirAtom +:\w\++
syn match elixirAtom +:"[^"]*"+
syn match elixirAtom +:'[^']*'+

" Numbers
syn match elixirNumber +\<\d\+\(_\d\+\)*\>+
syn match elixirNumber +\<0[xX][0-9a-fA-F]\+\(_[0-9a-fA-F]\+\)*\>+
syn match elixirNumber +\<0[oO][0-7]\+\(_[0-7]\+\)*\>+
syn match elixirNumber +\<0[bB][01]\+\(_[01]\+\)*\>+
syn match elixirFloat +\<\d\+\(_\d\+\)*\.\d\+\(_\d\+\)*\([eE][-+]\?\d\+\(_\d\+\)*\)\?\>+
syn match elixirNumber +?\\\?.+

" Module attributes
syn match elixirModuleAttr +@\w\++
syn match elixirDocAttr +@moduledoc+
syn match elixirDocAttr +@doc+
syn match elixirDocAttr +@spec+
syn match elixirDocAttr +@type+
syn match elixirDocAttr +@typep+
syn match elixirDocAttr +@opaque+
syn match elixirDocAttr +@behaviour+
syn match elixirDocAttr +@callback+
syn match elixirDocAttr +@impl+
syn match elixirDocAttr +@derive+
syn match elixirDocAttr +@enforce_keys+
syn match elixirDocAttr +@before_compile+
syn match elixirDocAttr +@after_compile+
syn match elixirDocAttr +@on_load+
syn match elixirDocAttr +@vsn+
syn match elixirDocAttr +@external_resource+
syn match elixirDocAttr +@dialyzer+
syn match elixirDocAttr +@compile+
syn match elixirDocAttr +@deprecated+

" Keywords - definitions
syn keyword elixirKeyword def defp defmodule defprotocol defimpl defstruct
syn keyword elixirKeyword defmacro defmacrop defguard defguardp defdelegate
syn keyword elixirKeyword defexception defoverridable

" Keywords - control flow
syn keyword elixirConditional if else unless cond case with when
syn keyword elixirRepeat for
syn keyword elixirStatement do end fn
syn keyword elixirException try catch rescue after raise throw
syn keyword elixirKeyword import require use alias quote unquote unquote_splicing
syn keyword elixirKeyword in not and or
syn keyword elixirKeyword receive send

" Constants
syn keyword elixirConstant true false nil self

" Pipe operator
syn match elixirOperator +|>+
syn match elixirOperator +<>+
syn match elixirOperator +\.\.\>+
syn match elixirOperator +\~>+
syn match elixirOperator +<\~>+
syn match elixirOperator +<\~+
syn match elixirOperator +=>+
syn match elixirOperator +<-+
syn match elixirOperator +\\\\+
syn match elixirOperator +&&+
syn match elixirOperator +||+
syn match elixirOperator +!+
syn match elixirOperator +=\~+
syn match elixirOperator +[+\-*/<>=!|&^]+
syn match elixirOperator +::+
syn match elixirOperator ++++
syn match elixirOperator +--+

" Types (in documentation/specs)
syn keyword elixirType integer float atom string list tuple map keyword
syn keyword elixirType pid port reference function binary bitstring boolean
syn keyword elixirType struct range regex MapSet Stream Task Agent GenServer

" Module names
syn match elixirModule +\<[A-Z]\w*\>+

" Function definitions
syn match elixirFunctionDecl +\<def\(p\)\?\s\+\w\++ contains=elixirKeyword
syn match elixirFunctionDecl +\<defmacro\(p\)\?\s\+\w\++ contains=elixirKeyword

" Highlighting
hi def link elixirComment Comment
hi def link elixirTodo Todo
hi def link elixirString String
hi def link elixirHeredoc String
hi def link elixirCharList String
hi def link elixirCharListHeredoc String
hi def link elixirEscape Special
hi def link elixirInterpolationDelim Special
hi def link elixirSigil String
hi def link elixirSigilDelim Special
hi def link elixirAtom Constant
hi def link elixirNumber Number
hi def link elixirFloat Number
hi def link elixirModuleAttr PreProc
hi def link elixirDocAttr PreProc
hi def link elixirKeyword Keyword
hi def link elixirConditional Conditional
hi def link elixirRepeat Repeat
hi def link elixirStatement Statement
hi def link elixirException Exception
hi def link elixirConstant Constant
hi def link elixirOperator Operator
hi def link elixirType Type
hi def link elixirModule Type
hi def link elixirFunctionDecl Function

let b:current_syntax = "elixir"
