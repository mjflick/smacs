" Vim syntax file
" Language:    GraphQL
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword graphqlTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region graphqlComment start="#" end="$" contains=graphqlTodo

" String literals
syn region graphqlString start=+"""+ end=+"""+
syn region graphqlString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=graphqlEscape

" Escape sequences
syn match graphqlEscape contained +\\[\\"/bfnrt]+
syn match graphqlEscape contained +\\u[0-9a-fA-F]\{4}+

" Keywords
syn keyword graphqlKeyword type input interface union enum scalar
syn keyword graphqlKeyword schema query mutation subscription
syn keyword graphqlKeyword fragment on directive extend implements
syn keyword graphqlKeyword repeatable

" Built-in scalar types
syn keyword graphqlType Int Float String Boolean ID

" Constants
syn keyword graphqlConstant true false null

" Directives
syn match graphqlDirective /@\w\+/

" Built-in directives
syn match graphqlBuiltinDir /@deprecated/
syn match graphqlBuiltinDir /@skip/
syn match graphqlBuiltinDir /@include/
syn match graphqlBuiltinDir /@specifiedBy/

" Numbers
syn match graphqlNumber /\<\d\+\>/
syn match graphqlNumber /\<\d\+\.\d\+\>/
syn match graphqlNumber /\<\d\+[eE][+-]\?\d\+\>/
syn match graphqlNumber /\<\d\+\.\d\+[eE][+-]\?\d\+\>/
syn match graphqlNumber /[-+]\d\+\>/

" Variables
syn match graphqlVariable /\$\w\+/

" Type modifiers
syn match graphqlNonNull /!/
syn match graphqlListType /\[/
syn match graphqlListType /\]/

" Operators and punctuation
syn match graphqlOperator /=/
syn match graphqlOperator /:/
syn match graphqlOperator /|/
syn match graphqlOperator /&/
syn match graphqlOperator /\.\.\./

" Braces
syn match graphqlBrace /[{}()]/

" Enum values and type names (capitalized identifiers)
syn match graphqlTypeName /\<[A-Z]\w*\>/

" Field names and argument names
syn match graphqlField /\<[a-z_]\w*\>\ze\s*[:(]/

hi def link graphqlComment Comment
hi def link graphqlTodo Todo
hi def link graphqlString String
hi def link graphqlEscape Special
hi def link graphqlKeyword Keyword
hi def link graphqlType Type
hi def link graphqlConstant Constant
hi def link graphqlDirective PreProc
hi def link graphqlBuiltinDir PreProc
hi def link graphqlNumber Number
hi def link graphqlVariable Identifier
hi def link graphqlNonNull Operator
hi def link graphqlListType Operator
hi def link graphqlOperator Operator
hi def link graphqlBrace Operator
hi def link graphqlTypeName Type
hi def link graphqlField Function

let b:current_syntax = "graphql"
