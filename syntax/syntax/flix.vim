" Vim syntax file
" Language:    Flix
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword flixTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region flixComment start="//" end="$" contains=flixTodo
syn region flixComment start="/\*" end="\*/" contains=flixTodo,flixComment

" Strings
syn region flixString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=flixEscape,flixInterp
syn match flixEscape contained +\\[nrt\\'"0]+
syn match flixEscape contained +\\u[0-9a-fA-F]\{4}+
syn match flixInterp contained /\${[^}]*}/

" Characters
syn match flixCharacter +'[^'\\]'+
syn match flixCharacter +'\\[nrt\\'"0]'+

" Numbers
syn match flixDecNumber "\<[0-9][0-9_]*\>"
syn match flixHexNumber "\<0x[0-9a-fA-F_]\+\>"
syn match flixFloat "\<[0-9][0-9_]*\.[0-9][0-9_]*\>"
syn match flixFloat "\<[0-9][0-9_]*\.[0-9][0-9_]*[eE][+-]\?[0-9_]\+\>"

" Number type suffixes
syn match flixNumSuffix "\<[0-9][0-9_]*\(i8\|i16\|i32\|i64\|ii\)\>"
syn match flixNumSuffix "\<[0-9][0-9_]*\.\?[0-9_]*\(f32\|f64\|ff\)\>"

" Keywords
syn keyword flixKeyword def pub enum type alias class instance trait
syn keyword flixKeyword impl mod use import with let
syn keyword flixKeyword return ref deref new not and or
syn keyword flixKeyword channel spawn select region
syn keyword flixKeyword static sealed lawful override inline
syn keyword flixKeyword lazy force as discard
syn keyword flixKeyword checked_cast checked_ecast unchecked_cast
syn keyword flixKeyword reify reifyBool reifyType reifyEff
syn keyword flixKeyword without do resume

" Conditional
syn keyword flixConditional if then else match case

" Repeat
syn keyword flixRepeat for foreach yield

" Exception
syn keyword flixException try catch throw

" Boolean
syn keyword flixBoolean true false

" Constant
syn keyword flixConstant null

" Types
syn keyword flixType Unit Bool Char Float32 Float64
syn keyword flixType Int8 Int16 Int32 Int64 BigInt BigDecimal
syn keyword flixType String Regex Array Vector List Set Map
syn keyword flixType Option Result Nil Chain Nel Nec
syn keyword flixType MutList MutSet MutMap MutDeque
syn keyword flixType Channel Sender Receiver Ref Region

" Annotations
syn match flixAnnotation /@\w\+/

" Operators
syn match flixOperator /[-+%<>!&|^*=]=\?/
syn match flixOperator /&&\|||/
syn match flixOperator /::/
syn match flixOperator /->/
syn match flixOperator /=>/
syn match flixOperator /|>/
syn match flixOperator /<-/

" Functions
syn match flixFunction /\<\w\+\>\ze\s*(/

" Module paths
syn match flixModPath /\<[A-Z][a-zA-Z0-9_]*\>\./

hi def link flixComment Comment
hi def link flixTodo Todo
hi def link flixString String
hi def link flixEscape Special
hi def link flixInterp Special
hi def link flixCharacter String
hi def link flixDecNumber Number
hi def link flixHexNumber Number
hi def link flixFloat Number
hi def link flixNumSuffix Type
hi def link flixKeyword Keyword
hi def link flixConditional Conditional
hi def link flixRepeat Repeat
hi def link flixException Exception
hi def link flixBoolean Constant
hi def link flixConstant Constant
hi def link flixType Type
hi def link flixAnnotation PreProc
hi def link flixOperator Operator
hi def link flixFunction Function
hi def link flixModPath Identifier

let b:current_syntax = "flix"
