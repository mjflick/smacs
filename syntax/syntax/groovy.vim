" Vim syntax file
" Language:    Groovy
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword groovyTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region groovyComment start="//" end="$" contains=groovyTodo
syn region groovyComment start="/\*" end="\*/" contains=groovyTodo
syn region groovyDocComment start="/\*\*" end="\*/" contains=groovyTodo,groovyDocTag
syn match groovyDocTag contained "@\(param\|return\|throws\|see\|since\|author\|version\|deprecated\|link\|code\)\>"

" Strings
syn region groovyString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=groovyEscape,groovyGString
syn region groovySingleString start=+'+ skip=+\\\\\|\\'+ end=+'+
syn region groovyTripleString start=+"""+ end=+"""+ contains=groovyEscape,groovyGString
syn region groovyTripleSingle start=+'''+ end=+'''+
syn region groovySlashyString start=+/[^/\*]+ skip=+\\\\\|\\/+ end=+/+
syn match groovyEscape contained +\\[bfnrt\\"'$]+
syn match groovyEscape contained +\\u[0-9a-fA-F]\{4}+
syn match groovyEscape contained +\\[0-7]\{1,3}+

" GString interpolation
syn region groovyGString contained start="\${" end="}" contains=TOP
syn match groovyGString contained "\$[a-zA-Z_][a-zA-Z0-9_.]*"

" Numbers
syn match groovyInteger "\<\d[0-9_]*[lLgG]\?\>"
syn match groovyInteger "\<0[xX][0-9a-fA-F][0-9a-fA-F_]*[lLgG]\?\>"
syn match groovyInteger "\<0[bB][01][01_]*[lLgG]\?\>"
syn match groovyInteger "\<0[0-7][0-7_]*[lLgG]\?\>"
syn match groovyFloat "\<\d[0-9_]*\.\d[0-9_]*[fFdDgG]\?\>"
syn match groovyFloat "\<\d[0-9_]*\.[0-9_]*[eE][+-]\?\d[0-9_]*[fFdDgG]\?\>"
syn match groovyFloat "\<\d[0-9_]*[eE][+-]\?\d[0-9_]*[fFdDgG]\?\>"

" Keywords
syn keyword groovyKeyword abstract as assert break case catch class const
syn keyword groovyKeyword continue def default do else enum extends final
syn keyword groovyKeyword finally for goto if implements import in
syn keyword groovyKeyword instanceof interface native new package private
syn keyword groovyKeyword protected public return static strictfp super
syn keyword groovyKeyword switch synchronized this throw throws trait
syn keyword groovyKeyword transient try var void volatile while yield

" Conditional
syn keyword groovyConditional if else switch case default

" Repeat
syn keyword groovyRepeat for while do in

" Exception
syn keyword groovyException try catch finally throw throws

" Types
syn keyword groovyType boolean byte char short int long float double
syn keyword groovyType String Integer Long Double Float Boolean BigDecimal
syn keyword groovyType BigInteger List ArrayList Map HashMap LinkedHashMap
syn keyword groovyType Set HashSet LinkedHashSet Object Class Closure
syn keyword groovyType GString Pattern Matcher File Date Calendar URL URI

" Built-in functions
syn keyword groovyBuiltin println print printf sprintf each eachWithIndex
syn keyword groovyBuiltin collect findAll find inject every any sort reverse
syn keyword groovyBuiltin unique flatten groupBy collectEntries withIndex
syn keyword groovyBuiltin take drop first last head tail size isEmpty
syn keyword groovyBuiltin contains containsAll join split tokenize trim
syn keyword groovyBuiltin toUpperCase toLowerCase replace replaceAll matches
syn keyword groovyBuiltin startsWith endsWith toInteger toLong toDouble
syn keyword groovyBuiltin toBigDecimal asType with tap identity getClass
syn keyword groovyBuiltin metaClass properties respondsTo hasProperty
syn keyword groovyBuiltin invokeMethod getProperty setProperty sleep times

" Constants
syn keyword groovyConstant true false null this super

" Operators
syn match groovyOperator "[-+*/%]=\?"
syn match groovyOperator "[<>]=\?"
syn match groovyOperator "==\|!="
syn match groovyOperator "===\|!=="
syn match groovyOperator "<=>"
syn match groovyOperator "&&\|||"
syn match groovyOperator "!"
syn match groovyOperator "\~"
syn match groovyOperator "&\||\|\^"
syn match groovyOperator "<<\|>>\|>>>"
syn match groovyOperator "\*\."
syn match groovyOperator "?\."
syn match groovyOperator "?:"
syn match groovyOperator "\.\."
syn match groovyOperator "\.\.<"
syn match groovyOperator "=\~"
syn match groovyOperator "==\~"
syn match groovyOperator "->"
syn match groovyOperator "++"
syn match groovyOperator "--"
syn match groovyOperator "\*\*"
syn match groovyOperator "in\>"

" Annotations
syn match groovyAnnotation "@[a-zA-Z][a-zA-Z0-9_.]*"

" Function definitions
syn match groovyFuncDef "\<def\s\+[a-zA-Z_][a-zA-Z0-9_]*\>\ze\s*("
syn match groovyFuncDef "\<\(void\|int\|long\|double\|float\|boolean\|String\|def\|Object\)\s\+[a-zA-Z_][a-zA-Z0-9_]*\>\ze\s*("

" Function calls
syn match groovyFunction "\<[a-zA-Z_][a-zA-Z0-9_]*\>\ze\s*("

" Closures
syn region groovyClosure start="{" end="}" contains=TOP

" Labels
syn match groovyLabel "^\s*[a-zA-Z_][a-zA-Z0-9_]*\s*:"

" Package/import
syn match groovyPackage "\<package\s\+[a-zA-Z0-9_.]\+"
syn match groovyImport "\<import\s\+\(static\s\+\)\?[a-zA-Z0-9_.*]\+"

hi def link groovyComment Comment
hi def link groovyDocComment Comment
hi def link groovyDocTag Special
hi def link groovyTodo Todo
hi def link groovyString String
hi def link groovySingleString String
hi def link groovyTripleString String
hi def link groovyTripleSingle String
hi def link groovySlashyString String
hi def link groovyEscape Special
hi def link groovyGString Special
hi def link groovyInteger Number
hi def link groovyFloat Number
hi def link groovyKeyword Keyword
hi def link groovyConditional Conditional
hi def link groovyRepeat Repeat
hi def link groovyException Exception
hi def link groovyType Type
hi def link groovyBuiltin Function
hi def link groovyConstant Constant
hi def link groovyOperator Operator
hi def link groovyAnnotation PreProc
hi def link groovyFuncDef Function
hi def link groovyFunction Function
hi def link groovyLabel Label
hi def link groovyPackage Statement
hi def link groovyImport Statement

let b:current_syntax = "groovy"
