" Vim syntax file
" Language:    Elm
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn match elmLineComment "--.*$" contains=elmTodo
syn region elmBlockComment start="{-" end="-}" contains=elmBlockComment,elmTodo
syn keyword elmTodo TODO FIXME XXX HACK NOTE BUG contained

" Strings
syn region elmString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=elmStringEscape
syn region elmMultilineString start=+"""+ end=+"""+ contains=elmStringEscape
syn match elmStringEscape "\\[\\\"'nrt0]" contained
syn match elmStringEscape "\\u{[0-9a-fA-F]\+}" contained

" Characters
syn match elmChar "'[^\\]'"
syn match elmChar "'\\[\\\"'nrt0]'"
syn match elmChar "'\\u{[0-9a-fA-F]\+}'"

" Numbers
syn match elmNumber "\<[0-9]\+\>"
syn match elmNumber "\<[0-9]\+\.[0-9]\+\>"
syn match elmNumber "\<[0-9]\+[eE][+-]\?[0-9]\+\>"
syn match elmNumber "\<[0-9]\+\.[0-9]\+[eE][+-]\?[0-9]\+\>"
syn match elmNumber "\<0x[0-9a-fA-F]\+\>"

" Operators
syn match elmOperator "[-+*/=<>!&|^~?@#%.:]\+"
syn match elmOperator "\\"
syn match elmOperator "->"
syn match elmOperator "<-"
syn match elmOperator "|>"
syn match elmOperator "<|"
syn match elmOperator ">>"
syn match elmOperator "<<"
syn match elmOperator "++"
syn match elmOperator "::"

" Keywords
syn keyword elmKeyword module exposing import as port where
syn keyword elmConditional if then else case of
syn keyword elmKeyword let in
syn keyword elmKeyword type alias

" Types
syn keyword elmType Int Float Bool Char String List Maybe Just Nothing
syn keyword elmType Result Ok Err Cmd Sub Html Attribute Msg Model Program
syn keyword elmType Task Dict Set Array Order LT GT EQ Never Platform
syn keyword elmType Decoder Encoder Value
syn match elmType "\<[A-Z][a-zA-Z0-9_]*\>"

" Module-qualified builtins
syn match elmFunction "\<List\.\(map\|filter\|foldl\|foldr\|length\|reverse\|member\|head\|tail\|take\|drop\|append\|concat\|concatMap\|sort\|sortBy\|sortWith\|range\|repeat\|singleton\|isEmpty\|partition\|unzip\|filterMap\|indexedMap\|sum\|product\|maximum\|minimum\|all\|any\)\>"
syn match elmFunction "\<String\.\(length\|isEmpty\|reverse\|repeat\|replace\|append\|concat\|split\|join\|words\|lines\|slice\|left\|right\|dropLeft\|dropRight\|contains\|startsWith\|endsWith\|toInt\|toFloat\|fromInt\|fromFloat\|toUpper\|toLower\|trim\|trimLeft\|trimRight\|pad\|padLeft\|padRight\|map\|filter\|foldl\|foldr\|any\|all\|toList\|fromList\|fromChar\|cons\|uncons\)\>"
syn match elmFunction "\<Maybe\.\(map\|map2\|map3\|map4\|map5\|andThen\|withDefault\)\>"
syn match elmFunction "\<Result\.\(map\|map2\|andThen\|withDefault\|toMaybe\|fromMaybe\|mapError\)\>"
syn match elmFunction "\<Debug\.\(log\|todo\|toString\)\>"
syn match elmFunction "\<Basics\.\(identity\|always\|not\|compare\|min\|max\|clamp\|negate\|abs\|sqrt\|logBase\|e\|pi\|cos\|sin\|tan\|acos\|asin\|atan\|atan2\|round\|floor\|ceiling\|truncate\|toFloat\|isNaN\|isInfinite\|modBy\|remainderBy\|turns\|degrees\|radians\)\>"
syn match elmFunction "\<Tuple\.\(pair\|first\|second\|mapFirst\|mapSecond\|mapBoth\)\>"
syn match elmFunction "\<Platform\.worker\>"
syn match elmFunction "\<Html\.\(text\|node\|div\|span\|p\|a\|button\|input\|form\|h1\|h2\|h3\|ul\|ol\|li\|br\|hr\|img\|pre\|code\|table\|tr\|td\|th\|textarea\|select\|option\|label\|section\|nav\|header\|footer\|main_\|article\|aside\|details\|summary\)\>"
syn match elmFunction "\<Cmd\.\(none\|batch\|map\)\>"
syn match elmFunction "\<Sub\.\(none\|batch\|map\)\>"
syn match elmFunction "\<Task\.\(succeed\|fail\|map\|map2\|andThen\|attempt\|perform\)\>"
syn match elmFunction "\<Json\.Decode\.\(string\|int\|float\|bool\|null\|list\|field\|at\|maybe\|oneOf\|map\|map2\|succeed\|fail\|andThen\|decodeString\|decodeValue\)\>"
syn match elmFunction "\<Json\.Encode\.\(string\|int\|float\|bool\|null\|list\|object\|encode\)\>"
syn match elmFunction "\<Http\.\(get\|post\|request\|header\|expectJson\|expectString\|jsonBody\|stringBody\)\>"
syn match elmFunction "\<Dict\.\(empty\|singleton\|insert\|update\|remove\|isEmpty\|member\|get\|size\|keys\|values\|toList\|fromList\|map\|foldl\|foldr\|filter\|partition\|union\|intersect\|diff\|merge\)\>"
syn match elmFunction "\<Set\.\(empty\|singleton\|insert\|remove\|isEmpty\|member\|size\|toList\|fromList\|map\|foldl\|foldr\|filter\|partition\|union\|intersect\|diff\)\>"
syn match elmFunction "\<Array\.\(empty\|initialize\|repeat\|fromList\|isEmpty\|length\|get\|set\|push\|append\|slice\|toList\|toIndexedList\|map\|indexedMap\|foldl\|foldr\|filter\)\>"

" Function definitions (lowercase starting identifier followed by arguments and =)
syn match elmFuncDef "^\l[a-zA-Z0-9_']*" contained

" Type annotations
syn match elmTypeAnnotation "^\l[a-zA-Z0-9_']*\s*:" contains=elmFuncDef

hi def link elmLineComment Comment
hi def link elmBlockComment Comment
hi def link elmTodo Todo
hi def link elmString String
hi def link elmMultilineString String
hi def link elmStringEscape Special
hi def link elmChar String
hi def link elmNumber Number
hi def link elmOperator Operator
hi def link elmKeyword Keyword
hi def link elmConditional Conditional
hi def link elmType Type
hi def link elmFunction Function
hi def link elmFuncDef Identifier
hi def link elmTypeAnnotation Identifier

let b:current_syntax = "elm"
