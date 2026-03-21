" Vim syntax file
" Language:    JSON
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments (JSON5/JSONC support)
syn match jsonComment "//.*$" contains=jsonTodo
syn region jsonComment start="/\*" end="\*/" contains=jsonTodo
syn keyword jsonTodo contained TODO FIXME XXX NOTE HACK BUG

" Strings
syn region jsonString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=jsonEscape

" Escape sequences
syn match jsonEscape contained "\\[\\\"\/bfnrt]"
syn match jsonEscape contained "\\u[0-9a-fA-F]\{4}"

" Keys (string before colon)
syn match jsonKey +"\([^"\\]\|\\.\)*"\ze\s*:+ contains=jsonEscape

" Numbers
syn match jsonNumber "-\?\<\d\+\>"
syn match jsonNumber "-\?\<\d\+\.\d\+\>"
syn match jsonNumber "-\?\<\d\+[eE][+-]\?\d\+\>"
syn match jsonNumber "-\?\<\d\+\.\d\+[eE][+-]\?\d\+\>"

" Constants
syn keyword jsonConstant true false null

" Braces and brackets
syn match jsonBraces "[{}\[\]]"
syn match jsonComma ","
syn match jsonColon ":"

" Highlighting links
hi def link jsonComment Comment
hi def link jsonTodo Todo
hi def link jsonString String
hi def link jsonEscape Special
hi def link jsonKey Identifier
hi def link jsonNumber Number
hi def link jsonConstant Constant
hi def link jsonBraces Operator
hi def link jsonComma Operator
hi def link jsonColon Operator

let b:current_syntax = "json"
