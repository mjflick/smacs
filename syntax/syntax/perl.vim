" Vim syntax file
" Language:    Perl
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn match perlComment "#.*$" contains=perlTodo
syn keyword perlTodo contained TODO FIXME XXX NOTE HACK BUG

" POD documentation
syn region perlPOD start="^=\w" end="^=cut" contains=perlTodo

" Strings
syn region perlString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=perlEscape,perlInterp
syn region perlString start=+'+ skip=+\\\\\|\\'+ end=+'+
syn match perlEscape contained "\\[\\nrtfabe0]"
syn match perlEscape contained "\\x[0-9a-fA-F]\{2}"
syn match perlInterp contained "\$[a-zA-Z_][a-zA-Z0-9_]*"
syn match perlInterp contained "@[a-zA-Z_][a-zA-Z0-9_]*"

" Heredocs
syn region perlHereDoc start=+<<\s*'\(\w\+\)'+ end=+^\1$+
syn region perlHereDoc start=+<<\s*"\(\w\+\)"+ end=+^\1$+ contains=perlInterp
syn region perlHereDoc start=+<<\s*\(\w\+\)+ end=+^\1$+ contains=perlInterp

" Numbers
syn match perlNumber "\<\d\+\>"
syn match perlNumber "\<\d\+\.\d\+\>"
syn match perlNumber "\<\d\+\.\d\+[eE][+-]\?\d\+\>"
syn match perlNumber "\<0x[0-9a-fA-F]\+\>"
syn match perlNumber "\<0b[01]\+\>"
syn match perlNumber "\<0[0-7]\+\>"

" Keywords
syn keyword perlKeyword my our local sub use require no package
syn keyword perlKeyword bless ref tie untie tied
syn keyword perlKeyword BEGIN END __END__ __DATA__
syn keyword perlKeyword eval do qw

" Moose / OOP
syn keyword perlKeyword extends with has before after around override augment
syn keyword perlKeyword is isa required default lazy builder

" Control flow
syn keyword perlConditional if elsif else unless given when default
syn keyword perlRepeat while until for foreach do
syn keyword perlStatement return last next redo goto
syn keyword perlStatement die warn exit

" Operators (word-based)
syn keyword perlOperator eq ne lt gt le ge cmp
syn keyword perlOperator and or not
syn keyword perlOperator defined exists delete ref wantarray caller

" Types / pragmas
syn keyword perlType scalar array hash int str
syn keyword perlType strict warnings utf8

" Built-in functions
syn keyword perlBuiltin say print printf sprintf warn die exit
syn keyword perlBuiltin push pop shift unshift splice
syn keyword perlBuiltin length substr index rindex
syn keyword perlBuiltin split join reverse sort map grep
syn keyword perlBuiltin chomp chop lc uc lcfirst ucfirst
syn keyword perlBuiltin chr ord hex oct abs int
syn keyword perlBuiltin keys values each exists delete
syn keyword perlBuiltin open close read write seek tell eof
syn keyword perlBuiltin binmode truncate fileno stat lstat
syn keyword perlBuiltin opendir readdir closedir
syn keyword perlBuiltin rename unlink mkdir rmdir chdir chmod chown
syn keyword perlBuiltin fork exec wait waitpid pipe kill alarm sleep
syn keyword perlBuiltin socket connect bind listen accept
syn keyword perlBuiltin send recv setsockopt getsockopt
syn keyword perlBuiltin time localtime gmtime
syn keyword perlBuiltin pack unpack vec
syn keyword perlBuiltin system qx
syn keyword perlBuiltin pos quotemeta study chomp chop crypt

" Constants
syn keyword perlConstant undef

" Variables with sigils
syn match perlScalar "\$[a-zA-Z_][a-zA-Z0-9_]*"
syn match perlArray "@[a-zA-Z_][a-zA-Z0-9_]*"
syn match perlHash "%[a-zA-Z_][a-zA-Z0-9_]*"

" Special variables
syn match perlSpecialVar "\$_\>"
syn match perlSpecialVar "@_\>"
syn match perlSpecialVar "\$!\>"
syn match perlSpecialVar "\$@\>"
syn match perlSpecialVar "\$/\>"
syn match perlSpecialVar "\$0\>"

" Package namespace calls
syn match perlPackageCall "\<[A-Z][A-Za-z0-9_]*::[a-zA-Z_][a-zA-Z0-9_]*"

" Method calls with arrow
syn match perlMethodCall "->[a-zA-Z_][a-zA-Z0-9_]*"

" Function definitions
syn match perlFuncDef "\<sub\s\+[a-zA-Z_][a-zA-Z0-9_]*" contains=perlKeyword

" Regex
syn region perlRegex start=+/+ skip=+\\/+ end=+/[gimsxe]*+ oneline
syn region perlRegex start=+m/+ skip=+\\/+ end=+/[gimsxe]*+ oneline
syn region perlSubst start=+s/+ skip=+\\/+ end=+/[gimsxe]*+ oneline

" Highlighting links
hi def link perlComment Comment
hi def link perlTodo Todo
hi def link perlPOD Comment
hi def link perlString String
hi def link perlHereDoc String
hi def link perlEscape Special
hi def link perlInterp Special
hi def link perlNumber Number
hi def link perlKeyword Keyword
hi def link perlConditional Conditional
hi def link perlRepeat Repeat
hi def link perlStatement Statement
hi def link perlOperator Operator
hi def link perlType Type
hi def link perlBuiltin Function
hi def link perlConstant Constant
hi def link perlScalar Identifier
hi def link perlArray Identifier
hi def link perlHash Identifier
hi def link perlSpecialVar Special
hi def link perlPackageCall Function
hi def link perlMethodCall Function
hi def link perlFuncDef Function
hi def link perlRegex String
hi def link perlSubst String

let b:current_syntax = "perl"
