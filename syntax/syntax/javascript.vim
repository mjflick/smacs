" Vim syntax file
" Language:    JavaScript
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn match jsComment "//.*$" contains=jsTodo
syn region jsComment start="/\*" end="\*/" contains=jsTodo
syn keyword jsTodo contained TODO FIXME XXX NOTE HACK BUG

" Strings
syn region jsString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=jsEscape
syn region jsString start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=jsEscape

" Template literals (backtick strings)
syn region jsTemplateLiteral start=+`+ skip=+\\\\\|\\`+ end=+`+ contains=jsEscape,jsTemplateExpr
syn region jsTemplateExpr contained start=+${+ end=+}+ contains=jsKeyword,jsBuiltin,jsNumber,jsString,jsGlobal

" Escape sequences
syn match jsEscape contained "\\[\\nrtfbv0'\""]"
syn match jsEscape contained "\\x[0-9a-fA-F]\{2}"
syn match jsEscape contained "\\u[0-9a-fA-F]\{4}"
syn match jsEscape contained "\\u{[0-9a-fA-F]\+}"

" Regex literals
syn region jsRegex start=+/[^/*]+ skip=+\\/+ end=+/[gimsuy]*+ oneline

" Numbers
syn match jsNumber "\<\d\+\>"
syn match jsNumber "\<\d\+\.\d*\>"
syn match jsNumber "\<\d*\.\d\+\>"
syn match jsNumber "\<\d\+[eE][+-]\?\d\+\>"
syn match jsNumber "\<\d\+\.\d*[eE][+-]\?\d\+\>"
syn match jsNumber "\<0x[0-9a-fA-F]\+\>"
syn match jsNumber "\<0b[01]\+\>"
syn match jsNumber "\<0o[0-7]\+\>"
syn match jsNumber "\<\d\+n\>"

" Keywords
syn keyword jsKeyword var let const function return if else for while do
syn keyword jsKeyword switch case default break continue throw
syn keyword jsKeyword try catch finally new delete typeof instanceof
syn keyword jsKeyword in of class extends super import export from as
syn keyword jsKeyword async await yield this void with debugger
syn keyword jsKeyword static get set

" Conditional
syn keyword jsConditional if else switch case default

" Repeat
syn keyword jsRepeat for while do in of

" Statement
syn keyword jsStatement return break continue throw yield

" Operators (word-based)
syn keyword jsOperator typeof instanceof in of void delete new
syn keyword jsOperator async await

" Globals and constants
syn keyword jsGlobal undefined null true false NaN Infinity globalThis
syn keyword jsGlobal window document navigator location history
syn keyword jsGlobal arguments

" Built-in objects
syn keyword jsBuiltin console Math JSON Object Array String Number Boolean
syn keyword jsBuiltin Symbol BigInt Map Set WeakMap WeakSet
syn keyword jsBuiltin Promise Proxy Reflect Date RegExp Error
syn keyword jsBuiltin TypeError RangeError ReferenceError SyntaxError
syn keyword jsBuiltin URIError EvalError AggregateError
syn keyword jsBuiltin ArrayBuffer SharedArrayBuffer DataView
syn keyword jsBuiltin Int8Array Uint8Array Int16Array Uint16Array
syn keyword jsBuiltin Int32Array Uint32Array Float32Array Float64Array
syn keyword jsBuiltin BigInt64Array BigUint64Array Uint8ClampedArray
syn keyword jsBuiltin Intl WeakRef FinalizationRegistry

" Built-in functions
syn keyword jsBuiltin parseInt parseFloat isNaN isFinite
syn keyword jsBuiltin encodeURI decodeURI encodeURIComponent decodeURIComponent
syn keyword jsBuiltin setTimeout setInterval clearTimeout clearInterval
syn keyword jsBuiltin fetch require module exports
syn keyword jsBuiltin eval structuredClone queueMicrotask
syn keyword jsBuiltin requestAnimationFrame cancelAnimationFrame
syn keyword jsBuiltin atob btoa

" Labels
syn match jsLabel "\<\w\+\s*:"

" Function definition
syn match jsFuncDef "\<function\s\+[a-zA-Z_$][a-zA-Z0-9_$]*" contains=jsKeyword

" Arrow function
syn match jsArrow "=>"

" Destructuring and spread
syn match jsSpread "\.\.\."

" Highlighting links
hi def link jsComment Comment
hi def link jsTodo Todo
hi def link jsString String
hi def link jsTemplateLiteral String
hi def link jsTemplateExpr Special
hi def link jsEscape Special
hi def link jsRegex String
hi def link jsNumber Number
hi def link jsKeyword Keyword
hi def link jsConditional Conditional
hi def link jsRepeat Repeat
hi def link jsStatement Statement
hi def link jsOperator Operator
hi def link jsGlobal Constant
hi def link jsBuiltin Function
hi def link jsLabel Label
hi def link jsFuncDef Function
hi def link jsArrow Operator
hi def link jsSpread Operator

let b:current_syntax = "javascript"
