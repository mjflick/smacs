" Vim syntax file
" Language:    Dart
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword dartTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region dartComment start="//" end="$" contains=dartTodo
syn region dartComment start="/\*" end="\*/" contains=dartTodo
syn region dartDocComment start="///" end="$" contains=dartTodo

" Strings
syn region dartString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=dartEscape,dartInterpolation
syn region dartString start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=dartEscape,dartInterpolation
syn region dartRawString start=+r"+ end=+"+
syn region dartRawString start=+r'+ end=+'+
syn region dartMultiString start=+"""+ end=+"""+ contains=dartEscape,dartInterpolation
syn region dartMultiString start=+'''+ end=+'''+ contains=dartEscape,dartInterpolation
syn match dartEscape contained +\\[abfnrtv\\'\"0]+
syn match dartEscape contained +\\x[0-9a-fA-F]\{2}+
syn match dartEscape contained +\\u[0-9a-fA-F]\{4}+
syn match dartEscape contained +\\u{[0-9a-fA-F]\+}+
syn match dartInterpolation contained /\$\w\+/
syn match dartInterpolation contained /\${[^}]*}/

" Numbers
syn match dartNumber "\<\d\+\>"
syn match dartNumber "\<\d[0-9_]*\d\>"
syn match dartNumber "\<0[xX][0-9a-fA-F_]\+\>"
syn match dartFloat "\<\d\+\.\d*\>"
syn match dartFloat "\<\d\+\.\d*[eE][+-]\?\d\+\>"
syn match dartFloat "\<\d\+[eE][+-]\?\d\+\>"

" Keywords
syn keyword dartKeyword abstract as assert async await break case catch
syn keyword dartKeyword class const continue covariant default deferred
syn keyword dartKeyword do dynamic else enum export extends extension
syn keyword dartKeyword external factory final finally for get hide
syn keyword dartKeyword if implements import in interface is late library
syn keyword dartKeyword mixin new on operator part required rethrow
syn keyword dartKeyword return set show static super switch sync this
syn keyword dartKeyword throw try typedef var void while with yield
syn keyword dartKeyword sealed base when

" Conditional
syn keyword dartConditional if else switch case default when

" Repeat
syn keyword dartRepeat for while do

" Types
syn keyword dartType int double num String bool List Map Set Iterable
syn keyword dartType Iterator Future Stream Duration DateTime Uri RegExp
syn keyword dartType Symbol Type Null Object dynamic void Never Record
syn keyword dartType Pattern Function Completer StreamController Sink
syn keyword dartType EventSink StringBuffer StringSink BigInt Comparable
syn keyword dartType Error Exception FormatException StateError TypeError
syn keyword dartType ArgumentError RangeError UnsupportedError
syn keyword dartType UnimplementedError ConcurrentModificationError
syn keyword dartType StackTrace

" Constants
syn keyword dartConstant true false null

" Built-in functions
syn keyword dartBuiltin print assert identical identityHashCode

" Operators
syn match dartOperator /[-+%<>!&|^*=]=\?/
syn match dartOperator /\~\//
syn match dartOperator /??\|?\./
syn match dartOperator /=>/
syn match dartOperator /&&\|||/
syn match dartOperator /\.\.\./
syn match dartOperator /<</
syn match dartOperator />>/

" Annotations
syn match dartAnnotation /@\w\+/

" Functions
syn match dartFunction /\<\w\+\>\ze\s*(/

" Class declaration
syn match dartClass /\<class\s\+\w\+/

hi def link dartComment Comment
hi def link dartDocComment Comment
hi def link dartTodo Todo
hi def link dartString String
hi def link dartRawString String
hi def link dartMultiString String
hi def link dartEscape Special
hi def link dartInterpolation Special
hi def link dartNumber Number
hi def link dartFloat Number
hi def link dartKeyword Keyword
hi def link dartConditional Conditional
hi def link dartRepeat Repeat
hi def link dartType Type
hi def link dartConstant Constant
hi def link dartBuiltin Function
hi def link dartOperator Operator
hi def link dartAnnotation PreProc
hi def link dartFunction Function
hi def link dartClass Statement

let b:current_syntax = "dart"
