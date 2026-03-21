" Vim syntax file
" Language:    TypeScript
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn match tsComment "//.*$" contains=tsTodo
syn region tsComment start="/\*" end="\*/" contains=tsTodo
syn keyword tsTodo contained TODO FIXME XXX NOTE HACK BUG

" JSDoc comments
syn region tsDocComment start="/\*\*" end="\*/" contains=tsTodo,tsDocTag
syn match tsDocTag contained "@\w\+"

" Strings
syn region tsString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=tsEscape
syn region tsString start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=tsEscape

" Template literals
syn region tsTemplateLiteral start=+`+ skip=+\\\\\|\\`+ end=+`+ contains=tsEscape,tsTemplateExpr
syn region tsTemplateExpr contained start=+${+ end=+}+ contains=tsKeyword,tsBuiltin,tsNumber,tsString,tsType

" Escape sequences
syn match tsEscape contained "\\[\\nrtfbv0'\""]"
syn match tsEscape contained "\\x[0-9a-fA-F]\{2}"
syn match tsEscape contained "\\u[0-9a-fA-F]\{4}"
syn match tsEscape contained "\\u{[0-9a-fA-F]\+}"

" Regex literals
syn region tsRegex start=+/[^/*]+ skip=+\\/+ end=+/[gimsuy]*+ oneline

" Numbers
syn match tsNumber "\<\d\+\>"
syn match tsNumber "\<\d\+\.\d*\>"
syn match tsNumber "\<\d*\.\d\+\>"
syn match tsNumber "\<\d\+[eE][+-]\?\d\+\>"
syn match tsNumber "\<\d\+\.\d*[eE][+-]\?\d\+\>"
syn match tsNumber "\<0x[0-9a-fA-F]\+\>"
syn match tsNumber "\<0b[01]\+\>"
syn match tsNumber "\<0o[0-7]\+\>"
syn match tsNumber "\<\d\+n\>"

" JavaScript keywords (inherited)
syn keyword tsKeyword var let const function return if else for while do
syn keyword tsKeyword switch case default break continue throw
syn keyword tsKeyword try catch finally new delete typeof instanceof
syn keyword tsKeyword in of class extends super import export from as
syn keyword tsKeyword async await yield this void with debugger
syn keyword tsKeyword static get set

" TypeScript-specific keywords
syn keyword tsKeyword type interface enum namespace declare
syn keyword tsKeyword implements abstract readonly
syn keyword tsKeyword keyof infer is asserts satisfies override accessor
syn keyword tsKeyword module require public private protected
syn keyword tsKeyword constructor

" Conditional
syn keyword tsConditional if else switch case default

" Repeat
syn keyword tsRepeat for while do in of

" Statement
syn keyword tsStatement return break continue throw yield

" Operators
syn keyword tsOperator typeof instanceof in of void delete new
syn keyword tsOperator async await as is keyof infer

" TypeScript types
syn keyword tsType string number boolean void never unknown any object
syn keyword tsType symbol bigint undefined null
syn keyword tsType Record Partial Required Readonly Pick Omit
syn keyword tsType Exclude Extract NonNullable ReturnType Parameters
syn keyword tsType InstanceType Awaited ConstructorParameters ThisParameterType
syn keyword tsType OmitThisParameter ThisType Uppercase Lowercase Capitalize Uncapitalize
syn keyword tsType ReadonlyArray ReadonlyMap ReadonlySet

" JavaScript types / globals
syn keyword tsGlobal undefined null true false NaN Infinity globalThis
syn keyword tsGlobal window document navigator arguments

" Built-in objects
syn keyword tsBuiltin console Math JSON Object Array String Number Boolean
syn keyword tsBuiltin Symbol BigInt Map Set WeakMap WeakSet
syn keyword tsBuiltin Promise Proxy Reflect Date RegExp Error
syn keyword tsBuiltin TypeError RangeError ReferenceError SyntaxError
syn keyword tsBuiltin URIError EvalError AggregateError
syn keyword tsBuiltin ArrayBuffer SharedArrayBuffer DataView
syn keyword tsBuiltin Int8Array Uint8Array Int16Array Uint16Array
syn keyword tsBuiltin Int32Array Uint32Array Float32Array Float64Array
syn keyword tsBuiltin BigInt64Array BigUint64Array Uint8ClampedArray
syn keyword tsBuiltin Intl WeakRef FinalizationRegistry

" Built-in functions
syn keyword tsBuiltin parseInt parseFloat isNaN isFinite
syn keyword tsBuiltin encodeURI decodeURI encodeURIComponent decodeURIComponent
syn keyword tsBuiltin setTimeout setInterval clearTimeout clearInterval
syn keyword tsBuiltin fetch require module exports
syn keyword tsBuiltin eval structuredClone queueMicrotask
syn keyword tsBuiltin atob btoa

" Decorator syntax
syn match tsDecorator "@\w\+\(\.\w\+\)*"

" Arrow function
syn match tsArrow "=>"

" Spread operator
syn match tsSpread "\.\.\."

" Type annotations (angle brackets)
syn region tsGeneric start="<" end=">" contains=tsType,tsKeyword,tsGeneric

" Highlighting links
hi def link tsComment Comment
hi def link tsTodo Todo
hi def link tsDocComment Comment
hi def link tsDocTag Special
hi def link tsString String
hi def link tsTemplateLiteral String
hi def link tsTemplateExpr Special
hi def link tsEscape Special
hi def link tsRegex String
hi def link tsNumber Number
hi def link tsKeyword Keyword
hi def link tsConditional Conditional
hi def link tsRepeat Repeat
hi def link tsStatement Statement
hi def link tsOperator Operator
hi def link tsType Type
hi def link tsGlobal Constant
hi def link tsBuiltin Function
hi def link tsDecorator PreProc
hi def link tsArrow Operator
hi def link tsSpread Operator
hi def link tsGeneric Type

let b:current_syntax = "typescript"
