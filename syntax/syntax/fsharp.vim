" Vim syntax file
" Language:    F#
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword fsharpTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region fsharpComment start="//" end="$" contains=fsharpTodo
syn region fsharpComment start="(\*" end="\*)" contains=fsharpComment,fsharpTodo

" Strings
syn region fsharpString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=fsharpEscape,fsharpInterp
syn region fsharpVerbatimString start=+@"+ end=+""+
syn region fsharpTripleString start=+"""+ end=+"""+
syn match fsharpEscape contained +\\[\\'"ntbrafv0]+
syn match fsharpEscape contained +\\u[0-9a-fA-F]\{4}+
syn match fsharpEscape contained +\\U[0-9a-fA-F]\{8}+
syn match fsharpEscape contained +\\x[0-9a-fA-F]\{2}+

" Interpolated strings
syn region fsharpInterpString start=+\$"+ skip=+\\\\\|\\"+ end=+"+ contains=fsharpEscape,fsharpInterp
syn region fsharpInterp contained start="{" end="}" contains=TOP

" Characters
syn match fsharpChar +'[^'\\]'+
syn match fsharpChar +'\\[\\'"ntbrafv0]'+
syn match fsharpChar +'\\u[0-9a-fA-F]\{4}'+

" Numbers
syn match fsharpInteger "\<\d[0-9_]*\>"
syn match fsharpInteger "\<\d[0-9_]*[yslLnI]\>"
syn match fsharpInteger "\<0[xX][0-9a-fA-F][0-9a-fA-F_]*\>"
syn match fsharpInteger "\<0[oO][0-7][0-7_]*\>"
syn match fsharpInteger "\<0[bB][01][01_]*\>"
syn match fsharpFloat "\<\d[0-9_]*\.\d[0-9_]*\>"
syn match fsharpFloat "\<\d[0-9_]*\.[0-9_]*[eE][+-]\?\d[0-9_]*\>"
syn match fsharpFloat "\<\d[0-9_]*[eE][+-]\?\d[0-9_]*\>"
syn match fsharpFloat "\<\d[0-9_]*\.\d[0-9_]*[fFmM]\>"

" Keywords
syn keyword fsharpKeyword abstract and as assert base begin class default
syn keyword fsharpKeyword delegate do done downcast downto elif else end
syn keyword fsharpKeyword exception extern finally for fun function global
syn keyword fsharpKeyword if in inherit inline interface internal lazy let
syn keyword fsharpKeyword match member module mutable namespace new not null
syn keyword fsharpKeyword of open or override private public rec return
syn keyword fsharpKeyword select static struct then to true try type upcast
syn keyword fsharpKeyword use val void when while with yield async task
syn keyword fsharpKeyword seq query false

" Computation expression keywords
syn match fsharpCompExpr "\<do!\>"
syn match fsharpCompExpr "\<let!\>"
syn match fsharpCompExpr "\<return!\>"
syn match fsharpCompExpr "\<yield!\>"
syn match fsharpCompExpr "\<use!\>"
syn match fsharpCompExpr "\<match!\>"

" Conditional
syn keyword fsharpConditional if then elif else match with when

" Repeat
syn keyword fsharpRepeat for while do done to downto in

" Exception
syn keyword fsharpException try with finally failwith raise reraise

" Types
syn keyword fsharpType int int8 int16 int32 int64 uint8 uint16 uint32 uint64
syn keyword fsharpType float float32 double decimal bool byte sbyte char
syn keyword fsharpType string unit obj exn nativeint unativeint bigint
syn keyword fsharpType option voption result list array seq map set
syn keyword fsharpType ResizeArray Dictionary HashSet Lazy Async Task
syn keyword fsharpType Choice FSharpList FSharpMap FSharpSet

" Built-in functions
syn keyword fsharpBuiltin printfn printf sprintf eprintfn failwith failwithf
syn keyword fsharpBuiltin invalidArg invalidOp raise reraise ignore fst snd
syn keyword fsharpBuiltin id not defaultArg defaultValueArg nameof sizeof
syn keyword fsharpBuiltin typeof typedefof ref incr decr exit stdin stdout
syn keyword fsharpBuiltin stderr box unbox hash compare min max abs sign pown
syn keyword fsharpBuiltin infinity nan infinityf nanf

" Modules
syn keyword fsharpModule List Array Seq Map Set String Option Result Async
syn keyword fsharpModule Task File Path Directory Console Math Convert
syn keyword fsharpModule Int32 Int64 Double Decimal DateTime TimeSpan Guid
syn keyword fsharpModule Regex StringBuilder Dictionary HashSet Queue Stack

" Constants
syn keyword fsharpConstant true false null None Some Ok Error

" Operators
syn match fsharpOperator "[-+*/]=\?"
syn match fsharpOperator "[<>]=\?"
syn match fsharpOperator "<>\|<="
syn match fsharpOperator "&&\|||"
syn match fsharpOperator "|>"
syn match fsharpOperator "<|"
syn match fsharpOperator ">>"
syn match fsharpOperator "<<"
syn match fsharpOperator "->"
syn match fsharpOperator "<-"
syn match fsharpOperator "::"
syn match fsharpOperator "@"
syn match fsharpOperator "\^"
syn match fsharpOperator "\.\."
syn match fsharpOperator ":>"
syn match fsharpOperator ":?>"
syn match fsharpOperator ":?"

" Attributes
syn region fsharpAttribute start="\[<" end=">]"

" Module access
syn match fsharpModuleAccess "\<[A-Z][a-zA-Z0-9_]*\>\ze\."

" Function definitions
syn match fsharpFuncDef "\<let\s\+\(rec\s\+\)\?\(inline\s\+\)\?[a-z_][a-zA-Z0-9_']*\>"
syn match fsharpMemberDef "\<member\s\+\(this\|self\|x\|__\)\.[a-zA-Z0-9_']*\>"

" Type annotations
syn match fsharpTypeAnnot ":\s*[a-zA-Z][a-zA-Z0-9_'.]*"

" Preprocessor
syn match fsharpPreProc "#if\|#else\|#endif\|#light\|#nowarn\|#r\|#load\|#I"

" Printf format
syn match fsharpFormat "%[-+ #0]*\*\?\(\d\+\)\?\(\.\(\d\+\|\*\)\)\?[dioxXucsfeEgGbBaAtO%]" contained containedin=fsharpString

hi def link fsharpComment Comment
hi def link fsharpTodo Todo
hi def link fsharpString String
hi def link fsharpVerbatimString String
hi def link fsharpTripleString String
hi def link fsharpInterpString String
hi def link fsharpEscape Special
hi def link fsharpInterp Special
hi def link fsharpChar String
hi def link fsharpInteger Number
hi def link fsharpFloat Number
hi def link fsharpKeyword Keyword
hi def link fsharpCompExpr Keyword
hi def link fsharpConditional Conditional
hi def link fsharpRepeat Repeat
hi def link fsharpException Exception
hi def link fsharpType Type
hi def link fsharpBuiltin Function
hi def link fsharpModule Type
hi def link fsharpConstant Constant
hi def link fsharpOperator Operator
hi def link fsharpAttribute PreProc
hi def link fsharpModuleAccess Type
hi def link fsharpFuncDef Function
hi def link fsharpMemberDef Function
hi def link fsharpPreProc PreProc
hi def link fsharpFormat Special

let b:current_syntax = "fsharp"
