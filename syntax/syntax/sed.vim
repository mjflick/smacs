" Vim syntax file
" Language:    Sed
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword sedTodo contained TODO FIXME XXX NOTE HACK BUG
syn match sedComment "^#.*$" contains=sedTodo
syn match sedComment ";#.*$" contains=sedTodo

" Addresses
syn match sedAddress "\d\+" contained
syn match sedAddress "\$" contained
syn match sedAddress "\d\+\~\d\+" contained
syn region sedAddress start="/" skip="\\/" end="/" contained contains=sedRegex
syn region sedAddress start="\\." skip="\\." end="\\." contained contains=sedRegex

" Address ranges
syn match sedAddressRange "\d\+,\d\+" contains=sedAddress
syn match sedAddressRange "\d\+,\$" contains=sedAddress
syn match sedAddressRange "\d\+,/[^/]*/" contains=sedAddress
syn match sedAddressRange "/[^/]*/,\d\+" contains=sedAddress
syn match sedAddressRange "/[^/]*/,/[^/]*/" contains=sedAddress

" Substitution command
syn match sedSubst "s\(.\).\{-}\1.\{-}\1[gpeIw0-9]*" contains=sedSubstFlags,sedSubstDelim,sedRegex,sedReplacement
syn match sedSubstFlags "[gpeIwMm0-9]*$" contained
syn match sedSubstDelim "[/|,!@#]" contained

" Transliterate command
syn match sedTransl "y\(.\).\{-}\1.\{-}\1"

" Commands (single character)
syn match sedCommand "[aicdhHgGlnNpPqQrRwWxz=]"
syn match sedCommand "[dD]"

" Branch/label commands
syn match sedCommand "b\s*\w*"
syn match sedCommand "t\s*\w*"
syn match sedCommand "T\s*\w*"

" Labels
syn match sedLabel ":\s*\w\+"

" Braces for grouping
syn match sedSpecial "[{}]"

" Negation
syn match sedSpecial "!"

" Semicolon separator
syn match sedSpecial ";"

" Escape sequences in replacement
syn match sedSpecial "\\[0-9]" contained
syn match sedSpecial "\\n" contained
syn match sedSpecial "\\t" contained
syn match sedSpecial "\\[\\&]" contained
syn match sedSpecial "&" contained

" Regex special characters
syn match sedRegex "\\[.*()+?{}|^$\[\]]" contained
syn match sedRegex "\[.\{-}\]" contained

" Strings (for r, w, R, W commands)
syn match sedString "\s\+\S\+$" contained

" Highlight links
hi def link sedComment Comment
hi def link sedTodo Todo
hi def link sedCommand Keyword
hi def link sedAddress Number
hi def link sedAddressRange Number
hi def link sedSubst Statement
hi def link sedSubstFlags Special
hi def link sedSubstDelim Operator
hi def link sedTransl Statement
hi def link sedLabel Label
hi def link sedSpecial Special
hi def link sedRegex String
hi def link sedString String

let b:current_syntax = "sed"
