" Vim syntax file
" Language:    Racket
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn match racketLineComment ";.*$" contains=racketTodo
syn region racketBlockComment start="#|" end="|#" contains=racketBlockComment,racketTodo
syn match racketDatumComment "#;" nextgroup=racketDatumCommentForm
syn region racketDatumCommentForm start="(" end=")" contained contains=racketDatumCommentForm transparent
syn keyword racketTodo TODO FIXME XXX HACK NOTE BUG contained

" Strings
syn region racketString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=racketStringEscape
syn match racketStringEscape "\\[\\\"abtnvfre0]" contained
syn match racketStringEscape "\\x[0-9a-fA-F]\+" contained
syn match racketStringEscape "\\u[0-9a-fA-F]\{1,4}" contained
syn match racketStringEscape "\\U[0-9a-fA-F]\{1,8}" contained

" Byte strings
syn region racketByteString start=+#"+ skip=+\\\\\|\\"+ end=+"+

" Characters
syn match racketChar "#\\."
syn match racketChar "#\\space"
syn match racketChar "#\\newline"
syn match racketChar "#\\tab"
syn match racketChar "#\\return"
syn match racketChar "#\\nul"
syn match racketChar "#\\backspace"
syn match racketChar "#\\delete"
syn match racketChar "#\\escape"
syn match racketChar "#\\alarm"
syn match racketChar "#\\vtab"
syn match racketChar "#\\u[0-9a-fA-F]\{1,4}"

" Numbers
syn match racketNumber "\<[+-]\?[0-9]\+\>"
syn match racketNumber "\<[+-]\?[0-9]\+\.[0-9]*\>"
syn match racketNumber "\<[+-]\?[0-9]\+/[0-9]\+\>"
syn match racketNumber "\<[+-]\?[0-9]\+[eE][+-]\?[0-9]\+\>"
syn match racketNumber "\<#[bodxei]\+[+-]\?[0-9a-fA-F]\+\>"
syn match racketNumber "\<[+-]inf\.0\>"
syn match racketNumber "\<[+-]nan\.0\>"

" Booleans
syn keyword racketBoolean #t #f #true #false

" Keywords (symbols starting with #:)
syn match racketKeywordArg "#:[a-zA-Z0-9_+\-*/<>=!?^%.@~&]*"

" Quoted symbols
syn match racketQuote "'" nextgroup=racketQuotedSymbol
syn match racketQuotedSymbol "[a-zA-Z0-9_+\-*/<>=!?^%.@~&:]\+" contained

" Quasiquote
syn match racketQuasiquote "`"
syn match racketUnquote ","
syn match racketUnquoteSplicing ",@"

" Hash literals
syn match racketHashLiteral "#hash\|#hasheq\|#hasheqv"

" Vector literal
syn match racketVectorLiteral "#("

" Regex literals
syn region racketRegexp start="#rx\"" skip=+\\\\\|\\"+ end=+"+
syn region racketRegexp start="#px\"" skip=+\\\\\|\\"+ end=+"+
syn region racketRegexp start="#rx#\"" skip=+\\\\\|\\"+ end=+"+
syn region racketRegexp start="#px#\"" skip=+\\\\\|\\"+ end=+"+

" Language line
syn match racketLang "^#lang\s\+.*$"

" Definition keywords
syn keyword racketDefine define define-syntax define-struct define-values define-syntax-rule
syn keyword racketDefine define-for-syntax define-logger define-sequence-syntax
syn keyword racketDefine define/contract define/match define/public define/private define/override

" Core keywords
syn keyword racketKeyword lambda let let* letrec letrec*
syn keyword racketKeyword let-values let*-values let-syntax letrec-syntax
syn keyword racketKeyword begin begin0 do set!
syn keyword racketKeyword quote quasiquote unquote unquote-splicing
syn keyword racketKeyword syntax syntax-case syntax-rules with-syntax
syn keyword racketKeyword struct class interface mixin unit
syn keyword racketKeyword module module* module+
syn keyword racketKeyword provide require
syn keyword racketKeyword for-syntax for-template for-label for-meta
syn keyword racketKeyword prefix-in only-in except-in rename-in
syn keyword racketKeyword lib file planet submod all-defined all-from
syn match racketKeyword "\<λ\>"

" Conditionals
syn keyword racketConditional if cond case when unless

" Logic
syn keyword racketConditional and or

" Match forms
syn keyword racketKeyword match match* match-let match-define

" Loop/iteration keywords
syn keyword racketRepeat for for* for/list for/vector for/hash for/fold
syn keyword racketRepeat for/and for/or for/sum for/first for*/list
syn keyword racketRepeat in-range in-naturals in-list in-vector in-hash
syn keyword racketRepeat in-port in-lines in-bytes in-string
syn keyword racketRepeat in-input-port-bytes in-input-port-chars
syn keyword racketRepeat in-directory in-producer in-value in-indexed
syn keyword racketRepeat in-sequences in-cycle in-parallel
syn keyword racketRepeat stop-before stop-after

" Contract keywords
syn keyword racketStatement contract ->i ->* ->d
syn keyword racketStatement any/c none/c or/c and/c not/c
syn keyword racketStatement listof vectorof hash/c parameter/c
syn keyword racketStatement procedure-arity-includes? flat-contract?
syn keyword racketStatement impersonator-contract? chaperone-contract? values/c

" Types
syn keyword racketType number integer rational real complex boolean string bytes
syn keyword racketType symbol keyword char void pair list vector hash box port path
syn keyword racketType regexp pregexp byte-regexp byte-pregexp procedure struct-type
syn keyword racketType class interface unit namespace continuation thread channel
syn keyword racketType semaphore evt custodian inspector parameter promise future
syn keyword racketType place will-executor syntax module-path-index

" Builtin functions - list operations
syn keyword racketFunction car cdr cons list list* append reverse length
syn keyword racketFunction map for-each filter foldl foldr andmap ormap
syn keyword racketFunction apply compose curry curryr negate conjoin disjoin
syn keyword racketFunction sort remove remv remove* remq
syn keyword racketFunction member memv memq assoc assv assq flatten
syn keyword racketFunction range build-list make-list take drop
syn keyword racketFunction take-right drop-right split-at partition count
syn keyword racketFunction index-of index-where indexes-of indexes-where
syn keyword racketFunction check-duplicates remove-duplicates shuffle

" Builtin functions - arithmetic
syn keyword racketFunction add1 sub1 abs max min gcd lcm
syn keyword racketFunction floor ceiling truncate round
syn keyword racketFunction expt exp log sqrt sin cos tan asin acos atan
syn keyword racketFunction exact->inexact inexact->exact
syn keyword racketFunction number->string string->number

" Builtin functions - strings
syn keyword racketFunction string-length string-ref string-append string-copy substring
syn keyword racketFunction string-contains? string-prefix? string-suffix?
syn keyword racketFunction string-upcase string-downcase string-titlecase
syn keyword racketFunction string-trim string-split string-join string-replace

" Builtin functions - I/O
syn keyword racketFunction format printf fprintf display displayln print println
syn keyword racketFunction write writeln newline read read-line read-string read-bytes
syn keyword racketFunction open-input-file open-output-file
syn keyword racketFunction close-input-port close-output-port
syn keyword racketFunction with-input-from-file with-output-to-file
syn keyword racketFunction call-with-input-file call-with-output-file

" Builtin functions - filesystem
syn keyword racketFunction file-exists? delete-file rename-file-or-directory copy-file
syn keyword racketFunction make-directory delete-directory directory-list directory-exists?
syn keyword racketFunction path->string string->path build-path simplify-path resolve-path
syn keyword racketFunction current-directory
syn keyword racketFunction file->string file->bytes file->lines file->list
syn keyword racketFunction string->file bytes->file display-to-file displayln-to-file

" Builtin functions - errors/exceptions
syn keyword racketFunction error raise with-handlers exn:fail? exn-message

" Builtin functions - parameters
syn keyword racketFunction parameterize make-parameter
syn keyword racketFunction current-input-port current-output-port current-error-port

" Builtin functions - predicates
syn keyword racketFunction void void? not equal? eq? eqv?
syn keyword racketFunction boolean? number? integer? string? symbol? keyword?
syn keyword racketFunction char? pair? null? list? vector? hash? box?
syn keyword racketFunction port? procedure? eof-object?

" Builtin functions - hash tables
syn keyword racketFunction hash hasheq hasheqv hash-ref hash-set hash-set!
syn keyword racketFunction hash-remove hash-remove! hash-update hash-update!
syn keyword racketFunction hash-keys hash-values hash-has-key? hash-count
syn keyword racketFunction hash-map hash-for-each

" Builtin functions - vectors
syn keyword racketFunction vector vector-ref vector-set! vector-length make-vector
syn keyword racketFunction vector->list list->vector vector-map vector-for-each

" Builtin functions - boxes
syn keyword racketFunction box unbox set-box!

" Builtin functions - regex
syn keyword racketFunction regexp-match? regexp-match regexp-replace regexp-split
syn keyword racketFunction string->regexp

" Builtin functions - misc
syn keyword racketFunction sleep current-seconds current-inexact-milliseconds
syn keyword racketFunction time collect-garbage gensym values call-with-values
syn keyword racketFunction thread thread-wait channel-put channel-get
syn keyword racketFunction make-channel make-semaphore semaphore-wait semaphore-post
syn keyword racketFunction place-channel dynamic-require eval namespace-require
syn keyword racketFunction compile expand

" Parentheses
syn region racketParen start="(" end=")" contains=ALL
syn region racketBracket start="\[" end="\]" contains=ALL
syn region racketBrace start="{" end="}" contains=ALL

hi def link racketLineComment Comment
hi def link racketBlockComment Comment
hi def link racketDatumComment Comment
hi def link racketDatumCommentForm Comment
hi def link racketTodo Todo
hi def link racketString String
hi def link racketStringEscape Special
hi def link racketByteString String
hi def link racketChar String
hi def link racketNumber Number
hi def link racketBoolean Constant
hi def link racketKeywordArg Special
hi def link racketQuote Special
hi def link racketQuotedSymbol Constant
hi def link racketQuasiquote Special
hi def link racketUnquote Special
hi def link racketUnquoteSplicing Special
hi def link racketHashLiteral Special
hi def link racketVectorLiteral Special
hi def link racketRegexp String
hi def link racketLang PreProc
hi def link racketDefine Keyword
hi def link racketKeyword Keyword
hi def link racketConditional Conditional
hi def link racketRepeat Repeat
hi def link racketStatement Statement
hi def link racketType Type
hi def link racketFunction Function

let b:current_syntax = "racket"
