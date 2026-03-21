" Vim syntax file
" Language:    Lua
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn match luaComment "--.*$" contains=luaTodo
syn region luaBlockComment matchgroup=luaCommentDelim start="--\[\z(=*\)\[" end="\]\z1\]" contains=luaTodo
syn keyword luaTodo contained TODO FIXME XXX NOTE HACK BUG

" Strings
syn region luaString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=luaEscape
syn region luaString start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=luaEscape
syn region luaLongString matchgroup=luaStringDelim start="\[\z(=*\)\[" end="\]\z1\]"
syn match luaEscape +\\[\\abfnrtvz'"0-9]+ contained
syn match luaEscape +\\x[0-9a-fA-F]\{2\}+ contained
syn match luaEscape +\\u{[0-9a-fA-F]\+}+ contained

" Numbers
syn match luaNumber +\<\d\++
syn match luaNumber +\<\d\+\.\d*\([eE][-+]\?\d\+\)\?+
syn match luaNumber +\<\.\d\+\([eE][-+]\?\d\+\)\?+
syn match luaNumber +\<\d\+[eE][-+]\?\d\++
syn match luaNumber +\<0[xX][0-9a-fA-F]\+\(\.[0-9a-fA-F]*\)\?\([pP][-+]\?\d\+\)\?+

" Keywords
syn keyword luaKeyword and break do else elseif end for function goto
syn keyword luaKeyword if in local not or repeat return then until while
syn keyword luaConstant nil true false
syn keyword luaLabel goto
syn match luaLabel +::\w\+::+

" Operators
syn match luaOperator +[=~<>]=+
syn match luaOperator +\.\.\.\?+
syn match luaOperator +[+\-*/%^#<>=]+
syn match luaOperator +//+
syn match luaOperator +<<+
syn match luaOperator +>>+
syn match luaOperator +[&|~]+

" Types (used in documentation/type annotations)
syn keyword luaType nil boolean number string table function userdata thread

" Standard library - core
syn keyword luaBuiltin assert collectgarbage dofile error getmetatable
syn keyword luaBuiltin ipairs load loadfile next pairs pcall print
syn keyword luaBuiltin rawequal rawget rawlen rawset require select
syn keyword luaBuiltin setmetatable tonumber tostring type xpcall unpack

" Standard library - table
syn match luaBuiltin +\<table\.insert\>+
syn match luaBuiltin +\<table\.remove\>+
syn match luaBuiltin +\<table\.sort\>+
syn match luaBuiltin +\<table\.concat\>+
syn match luaBuiltin +\<table\.move\>+
syn match luaBuiltin +\<table\.pack\>+
syn match luaBuiltin +\<table\.unpack\>+

" Standard library - string
syn match luaBuiltin +\<string\.byte\>+
syn match luaBuiltin +\<string\.char\>+
syn match luaBuiltin +\<string\.dump\>+
syn match luaBuiltin +\<string\.find\>+
syn match luaBuiltin +\<string\.format\>+
syn match luaBuiltin +\<string\.gmatch\>+
syn match luaBuiltin +\<string\.gsub\>+
syn match luaBuiltin +\<string\.len\>+
syn match luaBuiltin +\<string\.lower\>+
syn match luaBuiltin +\<string\.match\>+
syn match luaBuiltin +\<string\.rep\>+
syn match luaBuiltin +\<string\.reverse\>+
syn match luaBuiltin +\<string\.sub\>+
syn match luaBuiltin +\<string\.upper\>+

" Standard library - math
syn match luaBuiltin +\<math\.abs\>+
syn match luaBuiltin +\<math\.acos\>+
syn match luaBuiltin +\<math\.asin\>+
syn match luaBuiltin +\<math\.atan\>+
syn match luaBuiltin +\<math\.ceil\>+
syn match luaBuiltin +\<math\.cos\>+
syn match luaBuiltin +\<math\.deg\>+
syn match luaBuiltin +\<math\.exp\>+
syn match luaBuiltin +\<math\.floor\>+
syn match luaBuiltin +\<math\.fmod\>+
syn match luaBuiltin +\<math\.log\>+
syn match luaBuiltin +\<math\.max\>+
syn match luaBuiltin +\<math\.min\>+
syn match luaBuiltin +\<math\.modf\>+
syn match luaBuiltin +\<math\.rad\>+
syn match luaBuiltin +\<math\.random\>+
syn match luaBuiltin +\<math\.randomseed\>+
syn match luaBuiltin +\<math\.sin\>+
syn match luaBuiltin +\<math\.sqrt\>+
syn match luaBuiltin +\<math\.tan\>+
syn match luaBuiltin +\<math\.tointeger\>+
syn match luaBuiltin +\<math\.type\>+
syn match luaConstant +\<math\.huge\>+
syn match luaConstant +\<math\.maxinteger\>+
syn match luaConstant +\<math\.mininteger\>+
syn match luaConstant +\<math\.pi\>+

" Standard library - io
syn match luaBuiltin +\<io\.close\>+
syn match luaBuiltin +\<io\.flush\>+
syn match luaBuiltin +\<io\.input\>+
syn match luaBuiltin +\<io\.lines\>+
syn match luaBuiltin +\<io\.open\>+
syn match luaBuiltin +\<io\.output\>+
syn match luaBuiltin +\<io\.popen\>+
syn match luaBuiltin +\<io\.read\>+
syn match luaBuiltin +\<io\.tmpfile\>+
syn match luaBuiltin +\<io\.type\>+
syn match luaBuiltin +\<io\.write\>+

" Standard library - os
syn match luaBuiltin +\<os\.clock\>+
syn match luaBuiltin +\<os\.date\>+
syn match luaBuiltin +\<os\.difftime\>+
syn match luaBuiltin +\<os\.execute\>+
syn match luaBuiltin +\<os\.exit\>+
syn match luaBuiltin +\<os\.getenv\>+
syn match luaBuiltin +\<os\.remove\>+
syn match luaBuiltin +\<os\.rename\>+
syn match luaBuiltin +\<os\.setlocale\>+
syn match luaBuiltin +\<os\.time\>+
syn match luaBuiltin +\<os\.tmpname\>+

" Standard library - coroutine
syn match luaBuiltin +\<coroutine\.create\>+
syn match luaBuiltin +\<coroutine\.isyieldable\>+
syn match luaBuiltin +\<coroutine\.resume\>+
syn match luaBuiltin +\<coroutine\.running\>+
syn match luaBuiltin +\<coroutine\.status\>+
syn match luaBuiltin +\<coroutine\.wrap\>+
syn match luaBuiltin +\<coroutine\.yield\>+

" Standard library - debug
syn match luaBuiltin +\<debug\.debug\>+
syn match luaBuiltin +\<debug\.getinfo\>+
syn match luaBuiltin +\<debug\.getlocal\>+
syn match luaBuiltin +\<debug\.getmetatable\>+
syn match luaBuiltin +\<debug\.getregistry\>+
syn match luaBuiltin +\<debug\.getupvalue\>+
syn match luaBuiltin +\<debug\.sethook\>+
syn match luaBuiltin +\<debug\.setlocal\>+
syn match luaBuiltin +\<debug\.setmetatable\>+
syn match luaBuiltin +\<debug\.setupvalue\>+
syn match luaBuiltin +\<debug\.traceback\>+

" Self reference
syn keyword luaSpecial self

" Function calls
syn match luaFunctionCall +\<\w\+\ze\s*(+

" Highlighting
hi def link luaComment Comment
hi def link luaBlockComment Comment
hi def link luaCommentDelim Comment
hi def link luaTodo Todo
hi def link luaString String
hi def link luaLongString String
hi def link luaStringDelim String
hi def link luaEscape Special
hi def link luaNumber Number
hi def link luaKeyword Keyword
hi def link luaConstant Constant
hi def link luaLabel Label
hi def link luaOperator Operator
hi def link luaType Type
hi def link luaBuiltin Function
hi def link luaSpecial Special
hi def link luaFunctionCall Function

let b:current_syntax = "lua"
