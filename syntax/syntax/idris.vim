" Vim syntax file
" Language:    Idris
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn match idrisLineComment "--.*$" contains=idrisTodo
syn region idrisBlockComment start="{-" end="-}" contains=idrisBlockComment,idrisTodo
syn keyword idrisTodo TODO FIXME XXX HACK NOTE BUG contained

" Documentation comments
syn match idrisDocComment "|||.*$" contains=idrisTodo

" Strings
syn region idrisString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=idrisStringEscape
syn match idrisStringEscape "\\[\\\"'abfnrtv0]" contained
syn match idrisStringEscape "\\x[0-9a-fA-F]\+" contained
syn match idrisStringEscape "\\o[0-7]\+" contained
syn match idrisStringEscape "\\[0-9]\+" contained

" Characters
syn match idrisChar "'[^\\]'"
syn match idrisChar "'\\[\\\"'abfnrtv0]'"
syn match idrisChar "'\\x[0-9a-fA-F]\+'"

" Numbers
syn match idrisNumber "\<[0-9]\+\>"
syn match idrisNumber "\<[0-9]\+\.[0-9]\+\>"
syn match idrisNumber "\<[0-9]\+[eE][+-]\?[0-9]\+\>"
syn match idrisNumber "\<0x[0-9a-fA-F]\+\>"
syn match idrisNumber "\<0o[0-7]\+\>"
syn match idrisNumber "\<0b[01]\+\>"

" Operators
syn match idrisOperator "[-+*/=<>!&|^~?@#%.:$\\]\+"
syn match idrisOperator "->"
syn match idrisOperator "<-"
syn match idrisOperator "=>"
syn match idrisOperator "::"
syn match idrisOperator "\\"

" Keywords
syn keyword idrisKeyword module import public export private
syn keyword idrisKeyword data record where let in do
syn keyword idrisConditional if then else case of
syn keyword idrisKeyword with proof impossible
syn keyword idrisKeyword total partial covering
syn keyword idrisKeyword mutual parameters using namespace
syn keyword idrisKeyword prefix infix infixl infixr
syn keyword idrisKeyword interface implementation default
syn keyword idrisKeyword implicit auto

" Tactic keywords
syn keyword idrisStatement rewrite intros exact refine trivial compute unfold search

" Types
syn keyword idrisType Type Void Unit Bool True False
syn keyword idrisType Nat Z S Int Integer Double Char String
syn keyword idrisType List Vect Maybe Just Nothing Either Left Right
syn keyword idrisType Pair MkPair DPair IO Fin FZ FS
syn keyword idrisType Dec Yes No Lazy Inf Stream
syn keyword idrisType Bits8 Bits16 Bits32 Bits64
syn match idrisType "\<[A-Z][a-zA-Z0-9_']*\>"

" Builtins
syn keyword idrisFunction putStrLn putStr getLine print printLn show cast the
syn keyword idrisFunction believe_me assert_total idris_crash
syn keyword idrisFunction natToInteger integerToNat
syn keyword idrisFunction prim__add_Integer prim__sub_Integer prim__mul_Integer
syn keyword idrisFunction length reverse map filter foldl foldr
syn keyword idrisFunction head tail last init take drop zip unzip
syn keyword idrisFunction replicate iterate span break sort nub elem
syn keyword idrisFunction lookup index snoc append concat intersperse intercalate
syn keyword idrisFunction pack unpack toLower toUpper trim substr
syn keyword idrisFunction strLength strIndex strCons strUncons
syn keyword idrisFunction fastPack fastUnpack fastConcat
syn keyword idrisFunction null fromMaybe isJust isNothing maybe either fromEither
syn keyword idrisFunction the id const flip not fst snd mod div abs negate

" Holes
syn match idrisHole "?[a-zA-Z_][a-zA-Z0-9_']*"

" Pragma / directives
syn match idrisPragma "%\(default\|access\|logging\|language\|flag\|include\|lib\|link\|name\|hide\|freeze\|thaw\|reflection\|error_handlers\|unqualified\)"

hi def link idrisLineComment Comment
hi def link idrisBlockComment Comment
hi def link idrisDocComment Comment
hi def link idrisTodo Todo
hi def link idrisString String
hi def link idrisStringEscape Special
hi def link idrisChar String
hi def link idrisNumber Number
hi def link idrisOperator Operator
hi def link idrisKeyword Keyword
hi def link idrisConditional Conditional
hi def link idrisStatement Statement
hi def link idrisType Type
hi def link idrisFunction Function
hi def link idrisHole Special
hi def link idrisPragma PreProc

let b:current_syntax = "idris"
