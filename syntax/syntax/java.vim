" Vim syntax file
" Language:    Java
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn match javaComment "//.*$" contains=javaTodo
syn region javaComment start="/\*" end="\*/" contains=javaTodo

" Javadoc comments
syn region javaDocComment start="/\*\*" end="\*/" contains=javaTodo,javaDocTag
syn match javaDocTag contained "@\w\+"

syn keyword javaTodo contained TODO FIXME XXX NOTE HACK BUG

" Strings
syn region javaString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=javaEscape
syn region javaCharacter start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=javaEscape

" Text blocks (Java 13+)
syn region javaTextBlock start=+"""+ end=+"""+ contains=javaEscape

" Escape sequences
syn match javaEscape contained "\\[\\nrtfbe0'\""]"
syn match javaEscape contained "\\u[0-9a-fA-F]\{4}"
syn match javaEscape contained "\\[0-7]\{1,3}"

" Numbers
syn match javaNumber "\<\d\+[lLfFdD]\?\>"
syn match javaNumber "\<\d\+\.\d*[fFdD]\?\>"
syn match javaNumber "\<\d*\.\d\+[fFdD]\?\>"
syn match javaNumber "\<\d\+[eE][+-]\?\d\+[fFdD]\?\>"
syn match javaNumber "\<\d\+\.\d*[eE][+-]\?\d\+[fFdD]\?\>"
syn match javaNumber "\<0x[0-9a-fA-F]\+[lL]\?\>"
syn match javaNumber "\<0b[01]\+[lL]\?\>"
syn match javaNumber "\<0[0-7]\+[lL]\?\>"
syn match javaNumber "\<\d[0-9_]*\d[lLfFdD]\?\>"

" Keywords
syn keyword javaKeyword abstract assert break case catch class const continue
syn keyword javaKeyword default do else enum extends final finally for goto
syn keyword javaKeyword if implements import instanceof interface native new
syn keyword javaKeyword package private protected public return static
syn keyword javaKeyword strictfp super switch synchronized this throw throws
syn keyword javaKeyword transient try var void volatile while yield
syn keyword javaKeyword record sealed permits

" Conditional
syn keyword javaConditional if else switch case default

" Repeat
syn keyword javaRepeat for while do

" Statement
syn keyword javaStatement return break continue throw yield assert

" Exception
syn keyword javaException try catch finally throw throws

" Access modifiers
syn keyword javaAccess public private protected static final abstract
syn keyword javaAccess synchronized volatile transient native strictfp

" Primitive types
syn keyword javaType boolean byte char double float int long short void

" Wrapper types and common classes
syn keyword javaType String Integer Long Double Float Boolean Character Byte Short
syn keyword javaType Object Class Void Number
syn keyword javaType List ArrayList LinkedList
syn keyword javaType Map HashMap LinkedHashMap TreeMap ConcurrentHashMap
syn keyword javaType Set HashSet LinkedHashSet TreeSet
syn keyword javaType Collection Collections Iterator ListIterator
syn keyword javaType Optional OptionalInt OptionalLong OptionalDouble
syn keyword javaType Stream IntStream LongStream DoubleStream
syn keyword javaType Comparable Comparator Iterable
syn keyword javaType Runnable Callable Thread Future CompletableFuture
syn keyword javaType Exception RuntimeException IOException
syn keyword javaType NullPointerException IllegalArgumentException IllegalStateException
syn keyword javaType IndexOutOfBoundsException ClassCastException
syn keyword javaType UnsupportedOperationException ConcurrentModificationException
syn keyword javaType StringBuilder StringBuffer StringJoiner
syn keyword javaType BigInteger BigDecimal
syn keyword javaType Path Paths Files File
syn keyword javaType Pattern Matcher
syn keyword javaType Enum Record

" Constants
syn keyword javaConstant null true false

" Common annotations
syn match javaAnnotation "@\w\+\(\.\w\+\)*"

" Package and import statements
syn match javaImport "^\s*import\s\+.*;"
syn match javaPackage "^\s*package\s\+.*;"

" Built-in methods (commonly used)
syn keyword javaBuiltin System Arrays Collections Objects Math
syn keyword javaBuiltin Thread Executors Collectors

" Function definition
syn match javaFuncDef "\<\(public\|private\|protected\|static\|final\|abstract\|synchronized\|native\)\s\+\w\+\s\+[a-zA-Z_][a-zA-Z0-9_]*\s*(" contains=javaKeyword,javaType,javaAccess

" Highlighting links
hi def link javaComment Comment
hi def link javaDocComment Comment
hi def link javaDocTag Special
hi def link javaTodo Todo
hi def link javaString String
hi def link javaCharacter String
hi def link javaTextBlock String
hi def link javaEscape Special
hi def link javaNumber Number
hi def link javaKeyword Keyword
hi def link javaConditional Conditional
hi def link javaRepeat Repeat
hi def link javaStatement Statement
hi def link javaException Exception
hi def link javaAccess Keyword
hi def link javaType Type
hi def link javaConstant Constant
hi def link javaAnnotation PreProc
hi def link javaImport PreProc
hi def link javaPackage PreProc
hi def link javaBuiltin Function
hi def link javaFuncDef Function

let b:current_syntax = "java"
