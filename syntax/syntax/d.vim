" Vim syntax file
" Language:    D
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn match dComment "//.*$" contains=dTodo
syn region dComment start="/\*" end="\*/" contains=dTodo
syn region dComment start="/+" end="+/" contains=dComment,dTodo
syn keyword dTodo contained TODO FIXME XXX NOTE HACK BUG

" Strings
syn region dString start=+"+ end=+"+ skip=+\\\\\|\\"+
syn region dString start=+`+ end=+`+
syn region dString start=+r"+ end=+"+
syn match dString "'[^'\\]'"
syn match dString "'\\[abfnrtv\\\"'0]'"
syn match dString "'\\x[0-9a-fA-F]\{2}'"
syn match dString "'\\u[0-9a-fA-F]\{4}'"
syn match dString "'\\U[0-9a-fA-F]\{8}'"

" Numbers
syn match dNumber "\<\d[0-9_]*\>"
syn match dNumber "\<\d[0-9_]*\.[0-9_]*\([eE][+-]\?[0-9_]\+\)\?\>"
syn match dNumber "\<0[xX][0-9a-fA-F_]\+\>"
syn match dNumber "\<0[bB][01_]\+\>"
syn match dNumber "\<0[oO]\?[0-7_]\+\>"
syn match dNumber "\<\d[0-9_]*[LuUfF]\+\>"

" Special tokens
syn keyword dSpecial __FILE__ __LINE__ __MODULE__ __FUNCTION__ __PRETTY_FUNCTION__
syn keyword dSpecial this super null true false

" Keywords
syn keyword dKeyword abstract alias align asm auto body
syn keyword dKeyword cast class const debug default delegate delete deprecated
syn keyword dKeyword enum export extern final function
syn keyword dKeyword goto immutable import in inout interface invariant
syn keyword dKeyword is lazy macro mixin module new nothrow
syn keyword dKeyword out override package pragma private protected public
syn keyword dKeyword pure ref return scope shared static struct
syn keyword dKeyword synchronized template throw
syn keyword dKeyword typedef typeid typeof union unittest version
syn keyword dKeyword void with assert

" Conditionals
syn keyword dConditional if else switch case

" Loops
syn keyword dRepeat for foreach foreach_reverse while do break continue

" Exceptions
syn keyword dException try catch finally throw

" Types
syn keyword dType bool byte ubyte short ushort int uint long ulong cent ucent
syn keyword dType float double real ifloat idouble ireal cfloat cdouble creal
syn keyword dType char wchar dchar string wstring dstring size_t ptrdiff_t

" Standard library / builtin functions
syn keyword dFunction writeln writef writefln write readln readf
syn keyword dFunction stdin stdout stderr format to text
syn keyword dFunction array assocArray byKey byValue keys values rehash clear
syn keyword dFunction dup idup sort reverse length ptr capacity reserve
syn keyword dFunction assumeSafeAppend popFront popBack front back empty save
syn keyword dFunction retro stride chain zip enumerate map filter reduce fold
syn keyword dFunction each find canFind count uniq group chunks slide
syn keyword dFunction joiner cartesianProduct iota repeat generate recurrence
syn keyword dFunction take takeExactly drop dropExactly roundRobin sequence
syn keyword dFunction until only choose tee cumulativeFold

" Annotations / attributes
syn match dAttribute "@\(safe\|trusted\|system\|nogc\|property\|disable\)\>"
syn match dAttribute "@\(live\)\>"

" Preprocessor-like
syn match dPreProc "^\s*#line\>"

hi def link dComment Comment
hi def link dTodo Todo
hi def link dString String
hi def link dNumber Number
hi def link dSpecial Special
hi def link dKeyword Keyword
hi def link dConditional Conditional
hi def link dRepeat Repeat
hi def link dException Exception
hi def link dType Type
hi def link dFunction Function
hi def link dAttribute PreProc
hi def link dPreProc PreProc

let b:current_syntax = "d"
