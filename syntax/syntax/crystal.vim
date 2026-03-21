" Vim syntax file
" Language:    Crystal
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword crystalTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region crystalComment start="#" end="$" contains=crystalTodo

" String literals
syn region crystalString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=crystalEscape,crystalInterp
syn region crystalString start=+'+ skip=+\\\\\|\\'+ end=+'+
syn region crystalCommand start=+`+ skip=+\\\\\|\\`+ end=+`+ contains=crystalInterp
syn match crystalEscape contained +\\[abefnrstv\\'"/]+
syn match crystalEscape contained +\\x[0-9a-fA-F]\{2}+
syn match crystalEscape contained +\\u[0-9a-fA-F]\{4}+
syn match crystalEscape contained +\\u{[0-9a-fA-F ]\+}+
syn match crystalEscape contained +\\[0-7]\{1,3}+
syn match crystalInterp contained /#{[^}]*}/

" Heredoc
syn region crystalHeredoc start=+<<-\z(\w\+\)+ end=+^\s*\z1$+ contains=crystalInterp,crystalEscape

" Regex
syn region crystalRegex start=+/+ skip=+\\/+ end=+/[imx]*+ contains=crystalEscape

" Symbols
syn match crystalSymbol /:\w\+[!?]\?/
syn region crystalSymbol start=+:"+ skip=+\\\\\|\\"+ end=+"+

" Numbers
syn match crystalDecimalInt "\<\d[0-9_]*\>"
syn match crystalHexInt "\<0[xX][0-9a-fA-F_]\+\>"
syn match crystalOctInt "\<0[oO][0-7_]\+\>"
syn match crystalBinInt "\<0[bB][01_]\+\>"
syn match crystalFloat "\<\d[0-9_]*\.\d[0-9_]*\>"
syn match crystalFloat "\<\d[0-9_]*\.\d[0-9_]*[eE][+-]\?\d[0-9_]*\>"
syn match crystalFloat "\<\d[0-9_]*[eE][+-]\?\d[0-9_]*\>"

" Keywords
syn keyword crystalKeyword abstract alias annotation as asm begin
syn keyword crystalKeyword break case class def do else elsif end
syn keyword crystalKeyword ensure enum extend for fun if in
syn keyword crystalKeyword include instance_sizeof lib macro module
syn keyword crystalKeyword next nil of out pointerof private protected
syn keyword crystalKeyword property require rescue return select self
syn keyword crystalKeyword sizeof struct super then type typeof
syn keyword crystalKeyword uninitialized union unless until verbatim
syn keyword crystalKeyword when while with yield

" Special keyword methods
syn match crystalKeyword /\<is_a?/
syn match crystalKeyword /\<nil?/
syn match crystalKeyword /\<as?/
syn match crystalKeyword /\<responds_to?/

" Conditional
syn keyword crystalConditional if elsif else unless when case

" Repeat
syn keyword crystalRepeat while until for loop

" Statement
syn keyword crystalStatement return break next yield

" Exception
syn keyword crystalException begin rescue ensure raise

" Types
syn keyword crystalType Nil Bool Int8 Int16 Int32 Int64 Int128
syn keyword crystalType UInt8 UInt16 UInt32 UInt64 UInt128
syn keyword crystalType Float32 Float64 Char String Symbol
syn keyword crystalType Array Hash Set Tuple NamedTuple Range Regex
syn keyword crystalType Proc Pointer Slice StaticArray Deque Channel
syn keyword crystalType Fiber IO File Dir Socket HTTP JSON YAML XML
syn keyword crystalType Time BigInt BigFloat BigDecimal BigRational
syn keyword crystalType Path Process Signal Enum Struct Class Union Void

" Built-in functions
syn keyword crystalBuiltin puts print p pp gets raise abort exit
syn keyword crystalBuiltin sleep spawn typeof sizeof instance_sizeof
syn keyword crystalBuiltin pointerof offsetof rand srand

" Constants
syn keyword crystalConstant true false nil self
syn match crystalConstant /\<[A-Z][A-Z0-9_]*\>/

" Operators
syn match crystalOperator /[-+%<>!&|^*=]=\?/
syn match crystalOperator /<=>/
syn match crystalOperator /\.\./
syn match crystalOperator /\.\.\./
syn match crystalOperator /&&\|||/
syn match crystalOperator /->/
syn match crystalOperator /=>/

" Functions
syn match crystalFunction /\<\w\+[!?]\?\>\ze\s*(/

" Instance variables
syn match crystalIdentifier /@\w\+/

" Class variables
syn match crystalIdentifier /@@\w\+/

" Block parameters
syn match crystalLabel /|\w[^|]*|/

" Annotations
syn match crystalPreProc /@\[[^\]]*\]/

hi def link crystalComment Comment
hi def link crystalTodo Todo
hi def link crystalString String
hi def link crystalCommand String
hi def link crystalHeredoc String
hi def link crystalRegex String
hi def link crystalEscape Special
hi def link crystalInterp Special
hi def link crystalSymbol Constant
hi def link crystalDecimalInt Number
hi def link crystalHexInt Number
hi def link crystalOctInt Number
hi def link crystalBinInt Number
hi def link crystalFloat Number
hi def link crystalKeyword Keyword
hi def link crystalConditional Conditional
hi def link crystalRepeat Repeat
hi def link crystalStatement Statement
hi def link crystalException Exception
hi def link crystalType Type
hi def link crystalBuiltin Function
hi def link crystalConstant Constant
hi def link crystalOperator Operator
hi def link crystalFunction Function
hi def link crystalIdentifier Identifier
hi def link crystalLabel Label
hi def link crystalPreProc PreProc

let b:current_syntax = "crystal"
