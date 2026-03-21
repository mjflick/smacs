" Vim syntax file
" Language:    Nim
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword nimTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region nimComment start="#" end="$" contains=nimTodo
syn region nimBlockComment start="#\[" end="\]#" contains=nimTodo,nimBlockComment
syn region nimDocComment start="##" end="$" contains=nimTodo

" Strings
syn region nimString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=nimEscape
syn region nimTripleString start=+"""+ end=+"""+
syn region nimRawString start=+r"+ end=+"+
syn match nimEscape contained +\\[abfnrtv\\'\"0]+
syn match nimEscape contained +\\x[0-9a-fA-F]\{2}+
syn match nimEscape contained +\\u[0-9a-fA-F]\{4}+

" Character literals
syn match nimChar +'[^'\\]'+
syn match nimChar +'\\[abfnrtv\\'"]'+
syn match nimChar +'\\x[0-9a-fA-F]\{2}'+

" Numbers
syn match nimNumber "\<\d\+\>"
syn match nimNumber "\<\d[0-9_]*\d\>"
syn match nimNumber "\<0[xX][0-9a-fA-F_]\+\>"
syn match nimNumber "\<0[oO][0-7_]\+\>"
syn match nimNumber "\<0[bB][01_]\+\>"
syn match nimFloat "\<\d\+\.\d*\>"
syn match nimFloat "\<\d\+\.\d*[eE][+-]\?\d\+\>"
syn match nimFloat "\<\d\+[eE][+-]\?\d\+\>"
syn match nimNumber "\<\d\+'i\(8\|16\|32\|64\)\>"
syn match nimNumber "\<\d\+'u\(8\|16\|32\|64\)\>"
syn match nimFloat "\<\d\+\.\d*'f\(32\|64\)\>"

" Keywords
syn keyword nimKeyword addr and as asm bind block break case cast
syn keyword nimKeyword concept const continue converter defer discard
syn keyword nimKeyword distinct div do elif else end enum except
syn keyword nimKeyword export finally for from func if import in
syn keyword nimKeyword include interface is isnot iterator let macro
syn keyword nimKeyword method mixin mod nil not notin object of or
syn keyword nimKeyword out proc ptr raise ref return shl shr static
syn keyword nimKeyword template try tuple type using var when while
syn keyword nimKeyword xor yield

" Conditional
syn keyword nimConditional if elif else case of when

" Repeat
syn keyword nimRepeat for while

" Exception
syn keyword nimException try except finally raise

" Types
syn keyword nimType int int8 int16 int32 int64
syn keyword nimType uint uint8 uint16 uint32 uint64
syn keyword nimType float float32 float64 bool char string cstring
syn keyword nimType pointer range array seq set tuple object ref ptr
syn keyword nimType enum distinct void auto typedesc untyped typed
syn keyword nimType openArray varargs Natural Positive Ordinal
syn keyword nimType SomeInteger SomeFloat SomeNumber

" Constants
syn keyword nimConstant true false nil

" Built-in functions
syn keyword nimBuiltin echo debugEcho quit assert doAssert len low high
syn keyword nimBuiltin inc dec succ pred abs min max clamp ord chr
syn keyword nimBuiltin add del insert contains find join split strip
syn keyword nimBuiltin toLowerAscii toUpperAscii parseInt parseFloat
syn keyword nimBuiltin intToStr repr swap cmp items pairs mitems mpairs
syn keyword nimBuiltin countdown countup toSeq collect map filter foldl
syn keyword nimBuiltin apply any all sorted reversed deduplicate zip unzip
syn keyword nimBuiltin open close readFile writeFile readLine write
syn keyword nimBuiltin writeLine readAll endOfFile fileExists dirExists
syn keyword nimBuiltin createDir removeDir removeFile copyFile moveFile
syn keyword nimBuiltin walkDir getCurrentDir setCurrentDir getAppDir
syn keyword nimBuiltin getAppFilename getEnv putEnv existsEnv sleep
syn keyword nimBuiltin epochTime cpuTime getTime format now
syn keyword nimBuiltin spawn sync send recv createThread

" Pragmas
syn region nimPragma start=/{\./ end=/\.}/

" Operators
syn match nimOperator /[-+%<>!&|^*=]=\?/
syn match nimOperator /\.\./
syn match nimOperator /\.\.\</
syn match nimOperator /and\|or\|not\|xor\|shl\|shr\|div\|mod/
syn match nimOperator /in\|notin\|is\|isnot\|of/

" String prefix operators
syn match nimOperator /\$/
syn match nimOperator /&/
syn match nimOperator /@/

" Functions
syn match nimFunction /\<\w\+\>\ze\s*(/
syn match nimFunction /\<\w\+\>\ze\s*\*/

" Proc/func declarations
syn match nimProcDecl /\<\(proc\|func\|method\|iterator\|converter\|template\|macro\)\s\+\w\+/

hi def link nimComment Comment
hi def link nimBlockComment Comment
hi def link nimDocComment Comment
hi def link nimTodo Todo
hi def link nimString String
hi def link nimTripleString String
hi def link nimRawString String
hi def link nimEscape Special
hi def link nimChar String
hi def link nimNumber Number
hi def link nimFloat Number
hi def link nimKeyword Keyword
hi def link nimConditional Conditional
hi def link nimRepeat Repeat
hi def link nimException Exception
hi def link nimType Type
hi def link nimConstant Constant
hi def link nimBuiltin Function
hi def link nimPragma PreProc
hi def link nimOperator Operator
hi def link nimFunction Function
hi def link nimProcDecl Statement

let b:current_syntax = "nim"
