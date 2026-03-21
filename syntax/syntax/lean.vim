" Vim syntax file
" Language:    Lean
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn match leanLineComment "--.*$" contains=leanTodo
syn region leanBlockComment start="/-" end="-/" contains=leanBlockComment,leanTodo
syn keyword leanTodo TODO FIXME XXX HACK NOTE BUG contained

" Doc comments
syn region leanDocComment start="/--" end="-/" contains=leanTodo

" Strings
syn region leanString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=leanStringEscape,leanStringInterp
syn match leanStringEscape "\\[\\\"'nrt0]" contained
syn match leanStringEscape "\\x[0-9a-fA-F]\{2}" contained
syn match leanStringEscape "\\u[0-9a-fA-F]\{4}" contained
syn region leanStringInterp start="{" end="}" contained contains=ALL

" Characters
syn match leanChar "'[^\\]'"
syn match leanChar "'\\[\\\"'nrt0]'"
syn match leanChar "'\\x[0-9a-fA-F]\{2}'"
syn match leanChar "'\\u[0-9a-fA-F]\{4}'"

" Numbers
syn match leanNumber "\<[0-9]\+\>"
syn match leanNumber "\<[0-9]\+\.[0-9]\+\>"
syn match leanNumber "\<[0-9]\+[eE][+-]\?[0-9]\+\>"
syn match leanNumber "\<0x[0-9a-fA-F]\+\>"
syn match leanNumber "\<0b[01]\+\>"
syn match leanNumber "\<0o[0-7]\+\>"

" Operators
syn match leanOperator "[-+*/=<>!&|^~?@#%.:$\\]\+"
syn match leanOperator "->"
syn match leanOperator "<-"
syn match leanOperator "=>"
syn match leanOperator ":="
syn match leanOperator "|>"
syn match leanOperator "<|"
syn match leanOperator ">>="
syn match leanOperator ">>"
syn match leanOperator "<<"
syn match leanOperator "<$>"
syn match leanOperator "<*>"
syn match leanOperator "++"
syn match leanOperator "&&"
syn match leanOperator "||"

" Keywords
syn keyword leanKeyword def theorem lemma example instance class structure
syn keyword leanKeyword inductive where let in do
syn keyword leanConditional if then else match with
syn keyword leanKeyword fun return have show suffices calc by at
syn keyword leanKeyword open section namespace variable universe
syn keyword leanKeyword axiom constant noncomputable partial unsafe
syn keyword leanKeyword private protected scoped local
syn keyword leanKeyword macro syntax elab attribute abbrev opaque
syn keyword leanKeyword set_option deriving extends import prelude
syn keyword leanKeyword mutual end sorry admit

" Types
syn keyword leanType Prop Type Sort
syn keyword leanType Nat Int Float Bool true false String Char
syn keyword leanType Unit Empty Option some none
syn keyword leanType List Array Fin Sigma Subtype Decidable
syn keyword leanType IO Task Except StateM ReaderM EStateM
syn keyword leanType HashSet HashMap RBMap RBSet
syn match leanType "\<[A-Z][a-zA-Z0-9_']*\>"

" Tactics
syn keyword leanTactic intro intros apply exact rfl simp ring omega
syn keyword leanTactic linarith norm_num decide trivial assumption
syn keyword leanTactic contradiction exfalso cases induction rcases obtain
syn keyword leanTactic use exists constructor left right ext funext congr
syn keyword leanTactic rw rewrite subst specialize have suffices calc
syn keyword leanTactic conv norm_cast push_cast pull_cast field_simp
syn keyword leanTactic ring_nf positivity gcongr bound

" Builtins
syn match leanFunction "\<IO\.println\>"
syn match leanFunction "\<IO\.print\>"
syn keyword leanFunction dbg_trace toString repr
syn match leanFunction "\<panic!\>"
syn match leanFunction "\<Nat\.\(add\|mul\|sub\)\>"
syn match leanFunction "\<List\.\(map\|filter\|foldl\|foldr\|length\|reverse\|append\|join\|zip\|head?\|tail?\|get?\|find?\|any\|all\)\>"
syn match leanFunction "\<Array\.\(mk\|push\|pop\|get!\|set!\|size\|map\|filter\|foldl\|append\)\>"
syn match leanFunction "\<String\.\(length\|append\|mk\|data\|push\|isEmpty\|contains\|startsWith\|endsWith\|replace\|splitOn\|trim\|toUpper\|toLower\|toNat?\|toInt?\)\>"
syn match leanFunction "\<Option\.\(map\|bind\|get!\|getD\|isSome\|isNone\)\>"
syn match leanFunction "\<Except\.\(ok\|error\)\>"
syn match leanFunction "\<HashMap\.\(empty\|insert\|find?\|erase\|size\)\>"
syn match leanFunction "\<HashSet\.\(empty\|insert\|contains\|erase\|size\)\>"

" Attributes
syn match leanAttribute "@\[.\{-}\]"

" Universe levels
syn match leanUniverse "\<Type\s*[0-9]\+\>"
syn match leanUniverse "\<Sort\s*[0-9]\+\>"

" Termination / well-founded
syn keyword leanKeyword termination_by decreasing_by

hi def link leanLineComment Comment
hi def link leanBlockComment Comment
hi def link leanDocComment Comment
hi def link leanTodo Todo
hi def link leanString String
hi def link leanStringEscape Special
hi def link leanStringInterp Special
hi def link leanChar String
hi def link leanNumber Number
hi def link leanOperator Operator
hi def link leanKeyword Keyword
hi def link leanConditional Conditional
hi def link leanType Type
hi def link leanTactic Statement
hi def link leanFunction Function
hi def link leanAttribute PreProc
hi def link leanUniverse Type

let b:current_syntax = "lean"
