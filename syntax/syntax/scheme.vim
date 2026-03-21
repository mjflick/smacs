" Vim syntax file
" Language:    Scheme
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword schemeTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region schemeComment start=";" end="$" contains=schemeTodo
syn region schemeComment start="#|" end="|#" contains=schemeTodo,schemeComment

" Datum comments
syn region schemeComment start="#;" end="\ze[^[:space:]]" nextgroup=schemeDatumComment
syn match schemeDatumComment contained /[^[:space:]][^)}\]]*[)}\]]*/

" String literals
syn region schemeString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=schemeEscape
syn match schemeEscape contained +\\[abfnrtv\\"0]+
syn match schemeEscape contained +\\x[0-9a-fA-F]\+;+

" Characters
syn match schemeCharacter /#\\./
syn match schemeCharacter /#\\space/
syn match schemeCharacter /#\\newline/
syn match schemeCharacter /#\\tab/
syn match schemeCharacter /#\\return/
syn match schemeCharacter /#\\null/
syn match schemeCharacter /#\\alarm/
syn match schemeCharacter /#\\backspace/
syn match schemeCharacter /#\\delete/
syn match schemeCharacter /#\\escape/
syn match schemeCharacter /#\\x[0-9a-fA-F]\+/

" Booleans
syn keyword schemeConstant #t #f #true #false

" Numbers
syn match schemeNumber "\<[+-]\?\d\+\>"
syn match schemeNumber "\<[+-]\?\d\+\.\d*\>"
syn match schemeNumber "\<[+-]\?\.\d\+\>"
syn match schemeNumber "\<[+-]\?\d\+[eE][+-]\?\d\+\>"
syn match schemeNumber "\<[+-]\?\d\+/\d\+\>"
syn match schemeNumber "\<#[bodxBODX][0-9a-fA-F+\-./eE]*\>"
syn match schemeNumber "\<[+-]inf\.0\>"
syn match schemeNumber "\<[+-]nan\.0\>"

" Keywords / Special forms
syn keyword schemeKeyword define define-syntax define-record-type define-values
syn keyword schemeKeyword define-library let let* letrec letrec*
syn keyword schemeKeyword let-values let*-values let-syntax letrec-syntax
syn keyword schemeKeyword lambda if cond case when unless and or begin do
syn keyword schemeKeyword delay delay-force force make-promise promise?
syn keyword schemeKeyword set! quote quasiquote unquote unquote-splicing
syn keyword schemeKeyword syntax-rules syntax-case with-syntax identifier-syntax
syn keyword schemeKeyword import export library include include-ci cond-expand
syn keyword schemeKeyword features else =>

" Conditional
syn keyword schemeConditional if cond case when unless else =>

" Repeat
syn keyword schemeRepeat do

" Statement
syn keyword schemeStatement define define-syntax define-record-type set!

" Types
syn keyword schemeType boolean number integer rational real complex pair
syn keyword schemeType list vector bytevector string char symbol port
syn keyword schemeType procedure eof-object void

" Built-in functions
syn keyword schemeBuiltin car cdr cons list append reverse length
syn keyword schemeBuiltin map for-each filter fold fold-right reduce
syn keyword schemeBuiltin assoc assv assq member memv memq sort apply
syn keyword schemeBuiltin call-with-current-continuation call/cc
syn keyword schemeBuiltin values call-with-values dynamic-wind
syn keyword schemeBuiltin with-exception-handler raise raise-continuable guard
syn keyword schemeBuiltin error error-object? error-object-message error-object-irritants
syn keyword schemeBuiltin not boolean=? eq? eqv? equal?
syn keyword schemeBuiltin pair? null? list? symbol? string? char?
syn keyword schemeBuiltin vector? bytevector? port? procedure? boolean?
syn keyword schemeBuiltin number? integer? rational? real? complex?
syn keyword schemeBuiltin exact? inexact? exact-integer?
syn keyword schemeBuiltin zero? positive? negative? odd? even?
syn keyword schemeBuiltin max min abs floor ceiling truncate round
syn keyword schemeBuiltin exact inexact number->string string->number
syn keyword schemeBuiltin string-length string-ref string-set! string-append
syn keyword schemeBuiltin string-copy string->list list->string
syn keyword schemeBuiltin string-upcase string-downcase string-contains
syn keyword schemeBuiltin string->symbol symbol->string
syn keyword schemeBuiltin char->integer integer->char
syn keyword schemeBuiltin char-alphabetic? char-numeric? char-whitespace?
syn keyword schemeBuiltin char-upper-case? char-lower-case? char-upcase char-downcase
syn keyword schemeBuiltin vector-length vector-ref vector-set!
syn keyword schemeBuiltin vector->list list->vector make-vector
syn keyword schemeBuiltin vector-fill! vector-copy vector-append
syn keyword schemeBuiltin vector-map vector-for-each
syn keyword schemeBuiltin bytevector-length bytevector-u8-ref bytevector-u8-set!
syn keyword schemeBuiltin make-bytevector bytevector-copy bytevector-append
syn keyword schemeBuiltin utf8->string string->utf8
syn keyword schemeBuiltin open-input-file open-output-file
syn keyword schemeBuiltin open-input-string open-output-string get-output-string
syn keyword schemeBuiltin close-port close-input-port close-output-port
syn keyword schemeBuiltin read read-char read-line read-string read-u8
syn keyword schemeBuiltin peek-char char-ready?
syn keyword schemeBuiltin write write-char write-string write-u8 display
syn keyword schemeBuiltin newline flush-output-port
syn keyword schemeBuiltin current-input-port current-output-port current-error-port
syn keyword schemeBuiltin with-input-from-file with-output-to-file
syn keyword schemeBuiltin eof-object eof-object?
syn keyword schemeBuiltin input-port? output-port? textual-port? binary-port?
syn keyword schemeBuiltin input-port-open? output-port-open?

" Arithmetic operators as identifiers
syn match schemeBuiltin /\<[+\-*/=<>]=\?\>/
syn match schemeBuiltin /\<<=\?\>/
syn match schemeBuiltin /\<>=\?\>/

" Quoting
syn match schemeSpecial /'/
syn match schemeSpecial /`/
syn match schemeSpecial /,@\?/
syn match schemeSpecial /#'/

" Parentheses
syn match schemeSpecial /[()[\]]/

" Function definitions
syn match schemeFunction /(\s*define\s\+(\?\zs\w[^[:space:]()]*\ze/

hi def link schemeComment Comment
hi def link schemeTodo Todo
hi def link schemeDatumComment Comment
hi def link schemeString String
hi def link schemeEscape Special
hi def link schemeCharacter String
hi def link schemeConstant Constant
hi def link schemeNumber Number
hi def link schemeKeyword Keyword
hi def link schemeConditional Conditional
hi def link schemeRepeat Repeat
hi def link schemeStatement Statement
hi def link schemeType Type
hi def link schemeBuiltin Function
hi def link schemeSpecial Special
hi def link schemeFunction Function

let b:current_syntax = "scheme"
