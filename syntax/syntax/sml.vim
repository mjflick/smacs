" Vim syntax file
" Language:    Standard ML
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments (nestable)
syn region smlComment start="(\*" end="\*)" contains=smlComment,smlTodo
syn keyword smlTodo TODO FIXME XXX HACK NOTE BUG contained

" Strings
syn region smlString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=smlStringEscape
syn match smlStringEscape "\\[\\\"abtnvfr]" contained
syn match smlStringEscape "\\[0-9]\{3}" contained
syn match smlStringEscape "\\u[0-9a-fA-F]\{4}" contained
syn match smlStringEscape "\\\s\+\\" contained

" Characters
syn match smlChar "#\"[^\\]\""
syn match smlChar "#\"\\[\\\"abtnvfr]\""
syn match smlChar "#\"\\[0-9]\{3}\""

" Numbers
syn match smlNumber "\<[0-9]\+\>"
syn match smlNumber "\<~[0-9]\+\>"
syn match smlNumber "\<[0-9]\+\.[0-9]\+\>"
syn match smlNumber "\<~[0-9]\+\.[0-9]\+\>"
syn match smlNumber "\<[0-9]\+[eE]~\?[0-9]\+\>"
syn match smlNumber "\<[0-9]\+\.[0-9]\+[eE]~\?[0-9]\+\>"
syn match smlNumber "\<0x[0-9a-fA-F]\+\>"
syn match smlNumber "\<0w[0-9]\+\>"
syn match smlNumber "\<0wx[0-9a-fA-F]\+\>"

" Operators
syn match smlOperator "[-+*/=<>!&|^~?@#%.:]\+"
syn match smlOperator "=>"
syn match smlOperator "->"
syn match smlOperator ":>"
syn match smlOperator "\<o\>"
syn match smlOperator ":="
syn match smlOperator "!"

" Keywords
syn keyword smlKeyword abstype and andalso as case datatype do else end
syn keyword smlKeyword eqtype exception fn fun functor handle
syn keyword smlConditional if then else case of
syn keyword smlKeyword in include infix infixl infixr let local nonfix
syn keyword smlKeyword of op open orelse raise rec sharing sig signature
syn keyword smlKeyword struct structure then type val where while with withtype

" Exception handling
syn keyword smlException exception raise handle

" Types
syn keyword smlType int real bool char string word unit list option
syn keyword smlType SOME NONE ref array vector order
syn keyword smlType LESS EQUAL GREATER exn
syn match smlType "\<[A-Z][a-zA-Z0-9_']*\>"

" Builtins - general
syn keyword smlFunction print size substring concat str implode explode
syn keyword smlFunction chr ord real floor ceil round trunc abs
syn keyword smlFunction not before ignore rev length hd tl null
syn keyword smlFunction app map foldl foldr exists all filter find tabulate
syn keyword smlFunction sub update fromList toList getOpt isSome isNone valOf
syn keyword smlFunction ref

" Module-qualified builtins
syn match smlFunction "\<General\.\(Fail\|Bind\|Match\|Chr\|Div\|Domain\|Empty\|Option\|Overflow\|Size\|Span\|Subscript\)\>"
syn match smlFunction "\<TextIO\.\(stdIn\|stdOut\|stdErr\|openIn\|openOut\|closeIn\|closeOut\|inputLine\|input\|output\|print\)\>"
syn match smlFunction "\<Int\.\(toString\|fromString\)\>"
syn match smlFunction "\<Real\.\(toString\|fromString\)\>"
syn match smlFunction "\<String\.\(size\|sub\|extract\|substring\|concat\|concatWith\|str\|implode\|explode\|map\|translate\|tokens\|fields\|isPrefix\|isSubstring\|isSuffix\)\>"
syn match smlFunction "\<Char\.\(isAlpha\|isDigit\|isAlphaNum\|isUpper\|isLower\|isSpace\|toLower\|toUpper\)\>"
syn match smlFunction "\<List\.\(length\|rev\|hd\|tl\|null\|last\|nth\|take\|drop\|app\|map\|mapPartial\|find\|filter\|partition\|foldl\|foldr\|exists\|all\|tabulate\|concat\)\>"
syn match smlFunction "\<Array\.\(array\|fromList\|tabulate\|length\|sub\|update\|app\|foldl\|foldr\|modify\)\>"
syn match smlFunction "\<Vector\.\(fromList\|tabulate\|length\|sub\|app\|foldl\|foldr\|map\)\>"
syn match smlFunction "\<OS\.FileSys\.\(chDir\|getDir\|mkDir\|rmDir\|isDir\|isLink\|fileSize\|modTime\)\>"
syn match smlFunction "\<OS\.Process\.\(system\|exit\|getEnv\|sleep\)\>"
syn match smlFunction "\<Timer\.\(startCPUTimer\|checkCPUTimer\|startRealTimer\|checkRealTimer\)\>"
syn match smlFunction "\<Date\.\(fromTimeLocal\|fromTimeUniv\|toString\|fmt\)\>"

" Type variables
syn match smlTypeVar "'[a-zA-Z_][a-zA-Z0-9_']*"
syn match smlTypeVar "''[a-zA-Z_][a-zA-Z0-9_']*"

" Labels in records
syn match smlLabel "#[a-zA-Z_][a-zA-Z0-9_']*"

hi def link smlComment Comment
hi def link smlTodo Todo
hi def link smlString String
hi def link smlStringEscape Special
hi def link smlChar String
hi def link smlNumber Number
hi def link smlOperator Operator
hi def link smlKeyword Keyword
hi def link smlConditional Conditional
hi def link smlException Exception
hi def link smlType Type
hi def link smlFunction Function
hi def link smlTypeVar Identifier
hi def link smlLabel Label

let b:current_syntax = "sml"
