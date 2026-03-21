" Vim syntax file
" Language:    Julia
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword juliaTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region juliaComment start="#" end="$" contains=juliaTodo
syn region juliaBlockComment start="#=" end="=#" contains=juliaTodo,juliaBlockComment

" Strings
syn region juliaString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=juliaEscape,juliaInterpolation
syn region juliaTripleString start=+"""+ end=+"""+ contains=juliaEscape,juliaInterpolation
syn region juliaRawString start=+raw"+ end=+"+
syn match juliaEscape contained +\\[abfnrtv\\'\"0]+
syn match juliaEscape contained +\\x[0-9a-fA-F]\{2}+
syn match juliaEscape contained +\\u[0-9a-fA-F]\{4}+
syn match juliaEscape contained +\\U[0-9a-fA-F]\{8}+
syn match juliaInterpolation contained /\$\w\+/
syn match juliaInterpolation contained /\$([^)]*)/

" Character literals
syn match juliaChar /'[^'\\]'/
syn match juliaChar /'\\[abfnrtv\\'"]'/
syn match juliaChar /'\\x[0-9a-fA-F]\{2}'/
syn match juliaChar /'\\u[0-9a-fA-F]\{4}'/

" Regex
syn region juliaRegex start=+r"+ end=+"+ contains=juliaEscape

" Numbers
syn match juliaNumber "\<\d\+\>"
syn match juliaNumber "\<\d[0-9_]*\d\>"
syn match juliaNumber "\<0[xX][0-9a-fA-F_]\+\>"
syn match juliaNumber "\<0[oO][0-7_]\+\>"
syn match juliaNumber "\<0[bB][01_]\+\>"
syn match juliaFloat "\<\d\+\.\d*\>"
syn match juliaFloat "\<\d\+\.\d*[eE][+-]\?\d\+\>"
syn match juliaFloat "\<\d\+[eE][+-]\?\d\+\>"
syn match juliaImaginary "\<\d\+im\>"
syn match juliaImaginary "\<\d\+\.\d*im\>"

" Keywords
syn keyword juliaKeyword abstract baremodule begin break catch const
syn keyword juliaKeyword continue do else elseif end export finally
syn keyword juliaKeyword for function global if import in let local
syn keyword juliaKeyword macro module mutable quote return struct
syn keyword juliaKeyword try type using where while

" Conditional
syn keyword juliaConditional if else elseif

" Repeat
syn keyword juliaRepeat for while

" Exception
syn keyword juliaException try catch finally throw

" Types
syn keyword juliaType Int Int8 Int16 Int32 Int64 Int128
syn keyword juliaType UInt UInt8 UInt16 UInt32 UInt64 UInt128
syn keyword juliaType Float16 Float32 Float64 BigInt BigFloat
syn keyword juliaType Bool Char String Symbol Expr Nothing Missing
syn keyword juliaType Any Union Tuple NamedTuple Pair Array Vector
syn keyword juliaType Matrix Dict Set Channel Task Ref IO IOBuffer
syn keyword juliaType Regex SubString AbstractString AbstractArray
syn keyword juliaType AbstractDict Number Integer Real Complex
syn keyword juliaType Rational Signed Unsigned AbstractFloat

" Constants
syn keyword juliaConstant true false nothing missing Inf NaN pi
syn keyword juliaConstant ARGS ENV STDIN STDOUT STDERR

" Built-in functions
syn keyword juliaBuiltin println print show display repr string parse
syn keyword juliaBuiltin tryparse sizeof typeof isa convert promote
syn keyword juliaBuiltin length size ndims eltype collect
syn keyword juliaBuiltin sort reverse unique filter map reduce
syn keyword juliaBuiltin foldl foldr foreach zip enumerate pairs
syn keyword juliaBuiltin keys values haskey get getindex setindex!
syn keyword juliaBuiltin firstindex lastindex eachindex
syn keyword juliaBuiltin sum prod minimum maximum extrema
syn keyword juliaBuiltin argmin argmax findmin findmax any all count
syn keyword juliaBuiltin abs sign sqrt cbrt exp log log2 log10
syn keyword juliaBuiltin sin cos tan asin acos atan ceil floor round
syn keyword juliaBuiltin trunc mod rem div gcd lcm min max clamp
syn keyword juliaBuiltin isnan isinf isfinite iszero isone iseven isodd
syn keyword juliaBuiltin zero one oneunit eps typemin typemax
syn keyword juliaBuiltin open close read readline readlines write
syn keyword juliaBuiltin chomp strip lstrip rstrip split join replace
syn keyword juliaBuiltin occursin startswith endswith uppercase lowercase
syn keyword juliaBuiltin titlecase repeat match eachmatch lpad rpad
syn keyword juliaBuiltin copy deepcopy hash

" Bang functions
syn keyword juliaBuiltin push! pop! pushfirst! popfirst! append!
syn keyword juliaBuiltin prepend! insert! deleteat! splice! empty!
syn keyword juliaBuiltin sort! reverse! unique! filter! map!

" Operators
syn match juliaOperator /[-+%<>!&|^*=]=\?/
syn match juliaOperator /\.\.\./
syn match juliaOperator /::/
syn match juliaOperator /<:/
syn match juliaOperator />:/
syn match juliaOperator /|>/
syn match juliaOperator /&&\|||/
syn match juliaOperator /\.\*/
syn match juliaOperator /\.\//
syn match juliaOperator /\.\^/

" Macros
syn match juliaMacro /@\w\+/

" Functions
syn match juliaFunction /\<\w\+\>\ze\s*(/

" Module qualifier
syn match juliaModule /\<\w\+\ze\.\w/

hi def link juliaComment Comment
hi def link juliaBlockComment Comment
hi def link juliaTodo Todo
hi def link juliaString String
hi def link juliaTripleString String
hi def link juliaRawString String
hi def link juliaRegex String
hi def link juliaEscape Special
hi def link juliaInterpolation Special
hi def link juliaChar String
hi def link juliaNumber Number
hi def link juliaFloat Number
hi def link juliaImaginary Number
hi def link juliaKeyword Keyword
hi def link juliaConditional Conditional
hi def link juliaRepeat Repeat
hi def link juliaException Exception
hi def link juliaType Type
hi def link juliaConstant Constant
hi def link juliaBuiltin Function
hi def link juliaOperator Operator
hi def link juliaMacro PreProc
hi def link juliaFunction Function
hi def link juliaModule Statement

let b:current_syntax = "julia"
