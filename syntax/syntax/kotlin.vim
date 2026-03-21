" Vim syntax file
" Language:    Kotlin
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword kotlinTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region kotlinComment start="//" end="$" contains=kotlinTodo
syn region kotlinComment start="/\*" end="\*/" contains=kotlinTodo,kotlinComment
syn region kotlinDocComment start="/\*\*" end="\*/" contains=kotlinTodo,kotlinDocTag
syn match kotlinDocTag contained /@\(param\|return\|throws\|see\|since\|author\|sample\|suppress\|property\|receiver\|constructor\)\>/

" Strings
syn region kotlinString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=kotlinEscape,kotlinInterp
syn region kotlinMultilineString start=+"""+ end=+"""+ contains=kotlinEscape,kotlinInterp
syn match kotlinEscape contained +\\[tnrb\\"'$]+
syn match kotlinEscape contained +\\u[0-9a-fA-F]\{4}+
syn region kotlinInterp contained matchgroup=kotlinInterpDelim start="\${" end="}"
syn match kotlinInterp contained /\$[a-zA-Z_]\w*/

" Character literal
syn match kotlinCharacter +'[^'\\]'+
syn match kotlinCharacter +'\\[tnrb\\"']'+
syn match kotlinCharacter +'\\u[0-9a-fA-F]\{4}'+

" Numbers
syn match kotlinInteger "\<\d[0-9_]*[Ll]\?\>"
syn match kotlinHexInt "\<0[xX][0-9a-fA-F_]\+[Ll]\?\>"
syn match kotlinBinInt "\<0[bB][01_]\+[Ll]\?\>"
syn match kotlinFloat "\<\d[0-9_]*\.\d[0-9_]*[fF]\?\>"
syn match kotlinFloat "\<\d[0-9_]*\(\.\d[0-9_]*\)\?[eE][+-]\?\d[0-9_]*[fF]\?\>"

" Keywords
syn keyword kotlinKeyword fun val var class object interface enum sealed
syn keyword kotlinKeyword data inner companion abstract open override final
syn keyword kotlinKeyword private protected public internal
syn keyword kotlinKeyword import package return if else when for while do
syn keyword kotlinKeyword try catch finally throw break continue
syn keyword kotlinKeyword is in as by constructor init this super
syn keyword kotlinKeyword where typealias suspend inline crossinline noinline
syn keyword kotlinKeyword reified out vararg tailrec operator infix
syn keyword kotlinKeyword annotation const lateinit delegate field
syn keyword kotlinKeyword get set yield

" Special variable
syn keyword kotlinSpecial it

" Conditional
syn keyword kotlinConditional if else when

" Repeat
syn keyword kotlinRepeat for while do

" Exception
syn keyword kotlinException try catch finally throw

" Boolean and null
syn keyword kotlinBoolean true false
syn keyword kotlinNull null

" Types
syn keyword kotlinType Int Long Short Byte Float Double Boolean Char String
syn keyword kotlinType Unit Nothing Any Array
syn keyword kotlinType List MutableList Map MutableMap Set MutableSet
syn keyword kotlinType Pair Triple Sequence Iterable Comparable
syn keyword kotlinType Throwable Exception RuntimeException Result

" Built-in functions
syn keyword kotlinBuiltin println print readLine require check error TODO
syn keyword kotlinBuiltin arrayOf listOf mutableListOf mapOf mutableMapOf
syn keyword kotlinBuiltin setOf mutableSetOf emptyList emptyMap emptySet
syn keyword kotlinBuiltin sequenceOf lazy run let also apply with
syn keyword kotlinBuiltin buildString buildList repeat to rangeTo until
syn keyword kotlinBuiltin downTo step takeIf takeUnless

" Annotations
syn match kotlinAnnotation /@\w\+/

" Labels
syn match kotlinLabel /\w\+@/

" Operators
syn match kotlinOperator /[-+%<>!&|^~*=]=\?/
syn match kotlinOperator /->/
syn match kotlinOperator /=>/
syn match kotlinOperator /&&\|||/
syn match kotlinOperator /::/
syn match kotlinOperator /\.\./
syn match kotlinOperator /\.\.</
syn match kotlinOperator /?:/
syn match kotlinOperator /?\./
syn match kotlinOperator /!!/
syn match kotlinOperator /?/

" Functions
syn match kotlinFunction /\<\w\+\>\ze\s*(/
syn match kotlinFunction /\<\w\+\>\ze\s*{/

" Package/import
syn match kotlinPackage /\<package\s\+[a-zA-Z0-9_.]\+/
syn match kotlinImport /\<import\s\+[a-zA-Z0-9_.]\+/

hi def link kotlinComment Comment
hi def link kotlinDocComment Comment
hi def link kotlinDocTag Special
hi def link kotlinTodo Todo
hi def link kotlinString String
hi def link kotlinMultilineString String
hi def link kotlinEscape Special
hi def link kotlinInterp Special
hi def link kotlinInterpDelim Special
hi def link kotlinCharacter String
hi def link kotlinInteger Number
hi def link kotlinHexInt Number
hi def link kotlinBinInt Number
hi def link kotlinFloat Number
hi def link kotlinKeyword Keyword
hi def link kotlinSpecial Identifier
hi def link kotlinConditional Conditional
hi def link kotlinRepeat Repeat
hi def link kotlinException Exception
hi def link kotlinBoolean Constant
hi def link kotlinNull Constant
hi def link kotlinType Type
hi def link kotlinBuiltin Function
hi def link kotlinAnnotation PreProc
hi def link kotlinLabel Label
hi def link kotlinOperator Operator
hi def link kotlinFunction Function
hi def link kotlinPackage Statement
hi def link kotlinImport Statement

let b:current_syntax = "kotlin"
