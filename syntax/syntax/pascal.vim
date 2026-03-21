" Vim syntax file
" Language:    Pascal
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case ignore

" Comments
syn match pascalComment "//.*$" contains=pascalTodo
syn region pascalComment start="{" end="}" contains=pascalTodo
syn region pascalComment start="(\*" end="\*)" contains=pascalTodo
syn keyword pascalTodo contained TODO FIXME XXX NOTE HACK BUG

" Strings
syn region pascalString start="'" end="'" skip="''"
syn match pascalString "#\d\+"
syn match pascalString "#\$[0-9a-fA-F]\+"

" Numbers
syn match pascalNumber "\<\d\+\>"
syn match pascalNumber "\<\d\+\.\d*\([eE][+-]\?\d\+\)\?\>"
syn match pascalNumber "\.\d\+\([eE][+-]\?\d\+\)\?\>"
syn match pascalNumber "\$[0-9a-fA-F]\+\>"
syn match pascalNumber "&[0-7]\+\>"
syn match pascalNumber "%[01]\+\>"

" Boolean
syn keyword pascalBoolean true false

" Nil
syn keyword pascalConstant nil

" Program structure
syn keyword pascalKeyword program unit library uses interface implementation
syn keyword pascalKeyword initialization finalization begin end
syn keyword pascalKeyword var const procedure function constructor destructor
syn keyword pascalKeyword property class object record array set file of packed
syn keyword pascalKeyword inherited with as is in nil
syn keyword pascalKeyword absolute abstract assembler cdecl default dynamic
syn keyword pascalKeyword export external far forward index message name near
syn keyword pascalKeyword nodefault override pascal private protected public published
syn keyword pascalKeyword read register reintroduce safecall stdcall stored
syn keyword pascalKeyword virtual write out threadvar resourcestring
syn keyword pascalKeyword dispinterface operator generic specialize helper

" Operators
syn keyword pascalOperator not and or xor shl shr div mod

" Conditionals
syn keyword pascalConditional if then else case

" Loops
syn keyword pascalRepeat for to downto do while repeat until

" Control flow
syn keyword pascalStatement break continue exit goto label

" Exceptions
syn keyword pascalException try except finally raise on

" Types
syn keyword pascalType integer shortint smallint longint int64
syn keyword pascalType byte word longword cardinal qword nativeint nativeuint
syn keyword pascalType real single double extended comp currency
syn keyword pascalType boolean bytebool wordbool longbool
syn keyword pascalType char widechar ansichar
syn keyword pascalType string shortstring ansistring widestring unicodestring
syn keyword pascalType pchar pointer text variant olevariant
syn keyword pascalType tobject tclass iinterface iunknown
syn keyword pascalType tlist tstringlist tstream tfilestream tmemorystream
syn keyword pascalType tcomponent tstrings tdatetime tguid type

" Builtin functions
syn keyword pascalFunction writeln write readln read inc dec ord chr pred succ
syn keyword pascalFunction low high length setlength copy pos delete insert
syn keyword pascalFunction val str concat upcase lowercase trim trimleft trimright
syn keyword pascalFunction inttostr strtoint strtointdef floattostr strtofloat
syn keyword pascalFunction format formatfloat now date time sleep
syn keyword pascalFunction assign reset rewrite append close eof eoln ioresult
syn keyword pascalFunction seek filesize filepos rename erase mkdir rmdir chdir getdir
syn keyword pascalFunction fileexists directoryexists extractfilename extractfilepath
syn keyword pascalFunction extractfileext changefileext includetrailingpathdelimiter
syn keyword pascalFunction new dispose getmem freemem reallocmem fillchar move sizeof
syn keyword pascalFunction assigned freeandnil random randomize
syn keyword pascalFunction abs sqr sqrt sin cos arctan exp ln log10
syn keyword pascalFunction round trunc frac int pi maxint raise assert

" Preprocessor / compiler directives
syn region pascalPreProc start="{\$" end="}"
syn region pascalPreProc start="(\*\$" end="\*)"

hi def link pascalComment Comment
hi def link pascalTodo Todo
hi def link pascalString String
hi def link pascalNumber Number
hi def link pascalBoolean Constant
hi def link pascalConstant Constant
hi def link pascalKeyword Keyword
hi def link pascalOperator Operator
hi def link pascalConditional Conditional
hi def link pascalRepeat Repeat
hi def link pascalStatement Statement
hi def link pascalException Exception
hi def link pascalType Type
hi def link pascalFunction Function
hi def link pascalPreProc PreProc

let b:current_syntax = "pascal"
