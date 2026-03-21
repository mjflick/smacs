" Vim syntax file
" Language:    TOML
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn match tomlComment "#.*$" contains=tomlTodo
syn keyword tomlTodo contained TODO FIXME XXX NOTE HACK BUG

" Tables
syn match tomlTable "^\s*\[[a-zA-Z0-9_."-]\+\]"
syn match tomlTableArray "^\s*\[\[[a-zA-Z0-9_."-]\+\]\]"

" Keys
syn match tomlKey "^\s*[a-zA-Z0-9_-]\+\ze\s*=" contains=tomlDot
syn match tomlKey "^\s*\"[^\"]*\"\ze\s*=" contains=tomlDot
syn match tomlKey "^\s*'[^']*'\ze\s*=" contains=tomlDot
syn match tomlDot contained "\."

" Dotted keys
syn match tomlKey "^\s*[a-zA-Z0-9_-]\+\(\.[a-zA-Z0-9_-]\+\)\+\ze\s*=" contains=tomlDot

" Strings - basic (double-quoted)
syn region tomlString start=+"""+ end=+"""+ contains=tomlEscape
syn region tomlString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=tomlEscape

" Strings - literal (single-quoted, no escapes)
syn region tomlLiteralString start=+'''+ end=+'''+
syn region tomlLiteralString start=+'+ end=+'+

" Escape sequences
syn match tomlEscape contained "\\[\\\"bfnrt]"
syn match tomlEscape contained "\\u[0-9a-fA-F]\{4}"
syn match tomlEscape contained "\\U[0-9a-fA-F]\{8}"

" Numbers - integers
syn match tomlNumber "\<[+-]\?\d\+\>"
syn match tomlNumber "\<[+-]\?\d\(_\?\d\)*\>"
syn match tomlNumber "\<0x[0-9a-fA-F]\(_\?[0-9a-fA-F]\)*\>"
syn match tomlNumber "\<0o[0-7]\(_\?[0-7]\)*\>"
syn match tomlNumber "\<0b[01]\(_\?[01]\)*\>"

" Numbers - floats
syn match tomlNumber "\<[+-]\?\d\+\.\d\+\>"
syn match tomlNumber "\<[+-]\?\d\+\(\.\d\+\)\?[eE][+-]\?\d\+\>"
syn match tomlNumber "\<[+-]\?\(inf\|nan\)\>"

" Constants
syn keyword tomlConstant true false

" Datetime
syn match tomlDatetime "\<\d\{4}-\d\{2}-\d\{2}\([T ]\d\{2}:\d\{2}:\d\{2}\(\.\d\+\)\?\(Z\|[+-]\d\{2}:\d\{2}\)\?\)\?\>"
syn match tomlDatetime "\<\d\{2}:\d\{2}:\d\{2}\(\.\d\+\)\?\>"

" Assignment
syn match tomlEqual "="

" Array brackets
syn match tomlBracket "[\[\]]"

" Highlighting links
hi def link tomlComment Comment
hi def link tomlTodo Todo
hi def link tomlTable Keyword
hi def link tomlTableArray Keyword
hi def link tomlKey Identifier
hi def link tomlDot Operator
hi def link tomlString String
hi def link tomlLiteralString String
hi def link tomlEscape Special
hi def link tomlNumber Number
hi def link tomlConstant Constant
hi def link tomlDatetime Special
hi def link tomlEqual Operator
hi def link tomlBracket Operator

let b:current_syntax = "toml"
