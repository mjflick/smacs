" Vim syntax file
" Language:    Swift
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword swiftTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region swiftComment start="//" end="$" contains=swiftTodo
syn region swiftComment start="/\*" end="\*/" contains=swiftTodo,swiftComment
syn region swiftDocComment start="///" end="$" contains=swiftTodo

" Strings
syn region swiftString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=swiftEscape,swiftInterp
syn region swiftMultilineString start=+"""+ end=+"""+ contains=swiftEscape,swiftInterp
syn match swiftEscape contained +\\[0tnr\\"']+
syn match swiftEscape contained +\\u{[0-9a-fA-F]\+}+
syn region swiftInterp contained matchgroup=swiftInterpDelim start="\\(" end=")"

" Numbers
syn match swiftInteger "\<\d[0-9_]*\>"
syn match swiftHexInt "\<0x[0-9a-fA-F_]\+\>"
syn match swiftOctInt "\<0o[0-7_]\+\>"
syn match swiftBinInt "\<0b[01_]\+\>"
syn match swiftFloat "\<\d[0-9_]*\.\d[0-9_]*\>"
syn match swiftFloat "\<\d[0-9_]*\(\.\d[0-9_]*\)\?[eE][+-]\?\d[0-9_]*\>"
syn match swiftHexFloat "\<0x[0-9a-fA-F_]*\(\.[0-9a-fA-F_]*\)\?[pP][+-]\?\d[0-9_]*\>"

" Keywords
syn keyword swiftKeyword class struct enum protocol extension func var let
syn keyword swiftKeyword if else guard switch case default for in while
syn keyword swiftKeyword repeat do try catch throw throws rethrows
syn keyword swiftKeyword return break continue fallthrough where is as
syn keyword swiftKeyword import typealias associatedtype init deinit
syn keyword swiftKeyword self super inout some any
syn keyword swiftKeyword async await actor nonisolated isolated
syn keyword swiftKeyword consuming borrowing sending

" Self type
syn keyword swiftSelfType Self

" Conditional
syn keyword swiftConditional if else guard switch case default where

" Repeat
syn keyword swiftRepeat for in while repeat do

" Exception
syn keyword swiftException try catch throw throws rethrows

" Access control and modifiers
syn keyword swiftAccess public private fileprivate internal open
syn keyword swiftModifier final static override mutating nonmutating
syn keyword swiftModifier lazy weak unowned required optional
syn keyword swiftModifier convenience indirect

" Boolean and nil
syn keyword swiftBoolean true false
syn keyword swiftNil nil

" Types
syn keyword swiftType Int Int8 Int16 Int32 Int64
syn keyword swiftType UInt UInt8 UInt16 UInt32 UInt64
syn keyword swiftType Float Double Bool String Character
syn keyword swiftType Array Dictionary Set Optional Result
syn keyword swiftType Void Any AnyObject Never Error
syn keyword swiftType Codable Hashable Equatable Comparable Identifiable
syn keyword swiftType Sequence Collection IteratorProtocol

" Built-in functions
syn keyword swiftBuiltin print debugPrint dump fatalError
syn keyword swiftBuiltin precondition preconditionFailure
syn keyword swiftBuiltin assert assertionFailure
syn keyword swiftBuiltin min max abs zip stride type
syn keyword swiftBuiltin Mirror MemoryLayout
syn keyword swiftBuiltin withUnsafePointer withUnsafeMutablePointer

" Attributes
syn match swiftAttribute /@\w\+/

" Operators
syn match swiftOperator /[-+%<>!&|^~*=]=\?/
syn match swiftOperator /\/[^/*]/me=e-1
syn match swiftOperator /->/
syn match swiftOperator /=>/
syn match swiftOperator /&&\|||/
syn match swiftOperator /\.\.\./
syn match swiftOperator /\.\.</
syn match swiftOperator /??/
syn match swiftOperator /?\./
syn match swiftOperator /!/

" Preprocessor / compiler directives
syn match swiftPreProc /#\(if\|elseif\|else\|endif\|available\|selector\|keyPath\|line\|file\|function\|column\|warning\|error\|sourceLocation\)\>/

" Functions
syn match swiftFunction /\<\w\+\>\ze\s*(/

" Type annotations
syn match swiftTypeAnnotation /:\s*\zs[A-Z]\w*/

hi def link swiftComment Comment
hi def link swiftDocComment Comment
hi def link swiftTodo Todo
hi def link swiftString String
hi def link swiftMultilineString String
hi def link swiftEscape Special
hi def link swiftInterp Special
hi def link swiftInterpDelim Special
hi def link swiftInteger Number
hi def link swiftHexInt Number
hi def link swiftOctInt Number
hi def link swiftBinInt Number
hi def link swiftFloat Number
hi def link swiftHexFloat Number
hi def link swiftKeyword Keyword
hi def link swiftSelfType Type
hi def link swiftConditional Conditional
hi def link swiftRepeat Repeat
hi def link swiftException Exception
hi def link swiftAccess Keyword
hi def link swiftModifier Keyword
hi def link swiftBoolean Constant
hi def link swiftNil Constant
hi def link swiftType Type
hi def link swiftBuiltin Function
hi def link swiftAttribute PreProc
hi def link swiftOperator Operator
hi def link swiftPreProc PreProc
hi def link swiftFunction Function
hi def link swiftTypeAnnotation Type

let b:current_syntax = "swift"
