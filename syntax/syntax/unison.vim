" Vim syntax file
" Language:    Unison
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword unisonTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region unisonComment start="--" end="$" contains=unisonTodo
syn region unisonComment start="{-" end="-}" contains=unisonTodo,unisonComment

" Strings
syn region unisonString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=unisonEscape
syn region unisonRawString start=+"""+ end=+"""+
syn match unisonEscape contained +\\[nrt\\'"0]+
syn match unisonEscape contained +\\u[0-9a-fA-F]\{4}+

" Characters
syn match unisonCharacter +?\\\?[^ ]+

" Numbers
syn match unisonDecNumber "\<[0-9][0-9_]*\>"
syn match unisonHexNumber "\<0x[0-9a-fA-F_]\+\>"
syn match unisonFloat "\<[0-9][0-9_]*\.[0-9][0-9_]*\>"
syn match unisonFloat "\<[0-9][0-9_]*\.[0-9][0-9_]*[eE][+-]\?[0-9_]\+\>"
syn match unisonNat "\<+[0-9][0-9_]*\>"

" Keywords
syn keyword unisonKeyword type ability structural unique where
syn keyword unisonKeyword let in do handle handler forall
syn keyword unisonKeyword use namespace

" Conditional
syn keyword unisonConditional if then else match with cases

" Boolean
syn keyword unisonBoolean true false

" Logical
syn keyword unisonOperatorWord and or

" Types
syn keyword unisonType Nat Int Float Boolean Text Bytes Char
syn keyword unisonType Optional Either List Map Set Tuple Unit
syn keyword unisonType IO Exception Request Ref Promise MVar TVar STM

" Builtins
syn match unisonBuiltin /\<Debug\.trace\>/
syn match unisonBuiltin /\<Debug\.watch\>/
syn keyword unisonBuiltin todo bug

" Base library functions
syn match unisonBuiltin /\<base\.List\.\w\+\>/
syn match unisonBuiltin /\<base\.Text\.\w\+\>/
syn match unisonBuiltin /\<base\.Optional\.\w\+\>/
syn match unisonBuiltin /\<base\.Nat\.\w\+\>/
syn match unisonBuiltin /\<base\.Int\.\w\+\>/
syn match unisonBuiltin /\<base\.Float\.\w\+\>/
syn match unisonBuiltin /\<base\.IO\.\w\+\>/

" Type signatures
syn match unisonTypeSig /:\s/

" Operators
syn match unisonOperator /[-+%<>!&|^*=]=\?/
syn match unisonOperator /&&\|||/
syn match unisonOperator /->/
syn match unisonOperator /=>/

" Namespace paths
syn match unisonModPath /\<[a-zA-Z][a-zA-Z0-9_]*\>\./

" Functions
syn match unisonFunction /\<[a-z][a-zA-Z0-9_]*\>\ze\s*[=:]/

" Constructors (uppercase)
syn match unisonConstructor /\<[A-Z][a-zA-Z0-9_]*\>/

hi def link unisonComment Comment
hi def link unisonTodo Todo
hi def link unisonString String
hi def link unisonRawString String
hi def link unisonEscape Special
hi def link unisonCharacter String
hi def link unisonDecNumber Number
hi def link unisonHexNumber Number
hi def link unisonFloat Number
hi def link unisonNat Number
hi def link unisonKeyword Keyword
hi def link unisonConditional Conditional
hi def link unisonBoolean Constant
hi def link unisonOperatorWord Keyword
hi def link unisonType Type
hi def link unisonBuiltin Function
hi def link unisonTypeSig Operator
hi def link unisonOperator Operator
hi def link unisonModPath Identifier
hi def link unisonFunction Function
hi def link unisonConstructor Type

let b:current_syntax = "unison"
