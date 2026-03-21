" Vim syntax file
" Language:    Protocol Buffers
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword protoTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region protoComment start="//" end="$" contains=protoTodo
syn region protoComment start="/\*" end="\*/" contains=protoTodo

" String literals
syn region protoString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=protoEscape
syn region protoString start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=protoEscape

" Escape sequences
syn match protoEscape contained +\\[\\abfnrtv'"]+
syn match protoEscape contained +\\x[0-9a-fA-F]\{2}+
syn match protoEscape contained +\\[0-7]\{1,3}+

" Keywords
syn keyword protoKeyword syntax package import public weak option
syn keyword protoKeyword message enum service rpc returns stream
syn keyword protoKeyword oneof map reserved to max extend extensions
syn keyword protoKeyword group optional required repeated singular

" Scalar types
syn keyword protoType double float int32 int64 uint32 uint64
syn keyword protoType sint32 sint64 fixed32 fixed64 sfixed32 sfixed64
syn keyword protoType bool string bytes

" Well-known types
syn keyword protoType Any Duration Timestamp Struct Value ListValue
syn keyword protoType FieldMask Empty BoolValue BytesValue DoubleValue
syn keyword protoType FloatValue Int32Value Int64Value StringValue
syn keyword protoType UInt32Value UInt64Value

" Options
syn keyword protoOption java_package java_outer_classname java_multiple_files
syn keyword protoOption optimize_for go_package cc_enable_arenas
syn keyword protoOption objc_class_prefix csharp_namespace deprecated
syn keyword protoOption packed json_name

" Boolean constants
syn keyword protoConstant true false

" Numbers
syn match protoNumber /\<\d\+\>/
syn match protoNumber /\<0[xX][0-9a-fA-F]\+\>/
syn match protoNumber /\<0[0-7]\+\>/
syn match protoNumber /\<\d\+\.\d*\([eE][+-]\?\d\+\)\?\>/
syn match protoNumber /\<\.\d\+\([eE][+-]\?\d\+\)\?\>/
syn match protoNumber /\<\d\+[eE][+-]\?\d\+\>/
syn match protoNumber /[-+]\<\d\+\>/

" Field numbers
syn match protoFieldNum /=\s*\d\+/ contains=protoNumber

" Operators
syn match protoOperator /=/
syn match protoOperator /;/

" Braces
syn match protoBrace /[{}[\]()]/

" Message/enum names after keywords
syn match protoIdent /\<[A-Z]\w*\>/

" Package path
syn match protoPackage /\<\w\+\(\.\w\+\)*\>/ contained

" Syntax version
syn match protoSyntax /\<proto[23]\>/

hi def link protoComment Comment
hi def link protoTodo Todo
hi def link protoString String
hi def link protoEscape Special
hi def link protoKeyword Keyword
hi def link protoType Type
hi def link protoOption PreProc
hi def link protoConstant Constant
hi def link protoNumber Number
hi def link protoOperator Operator
hi def link protoBrace Operator
hi def link protoIdent Identifier
hi def link protoSyntax Special

let b:current_syntax = "proto"
