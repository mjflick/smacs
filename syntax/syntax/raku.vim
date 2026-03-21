" Vim syntax file
" Language:    Raku
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword rakuTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region rakuComment start="#" end="$" contains=rakuTodo
syn region rakuComment start="#`(" end=")" contains=rakuTodo
syn region rakuComment start="#`\[" end="\]" contains=rakuTodo
syn region rakuComment start="#`{" end="}" contains=rakuTodo
syn region rakuComment start="#`<" end=">" contains=rakuTodo

" Pod documentation
syn region rakuPod start="^=begin" end="^=end" contains=rakuTodo

" String literals
syn region rakuString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=rakuEscape,rakuInterp
syn region rakuString start=+'+ skip=+\\\\\|\\'+ end=+'+
syn region rakuString start=+q\[+ end=+\]+
syn region rakuString start=+qq\[+ end=+\]+ contains=rakuInterp
syn region rakuHeredoc start=+q:to/\z(\w\+\)/+ end=+^\z1$+
syn region rakuHeredoc start=+qq:to/\z(\w\+\)/+ end=+^\z1$+ contains=rakuInterp
syn match rakuEscape contained +\\[abefnrt0\\"']+
syn match rakuEscape contained +\\x\[[0-9a-fA-F]\+\]+
syn match rakuEscape contained +\\o\[[0-7]\+\]+
syn match rakuEscape contained +\\c\[\w\+\]+
syn match rakuInterp contained /{\$\?[^}]*}/
syn match rakuInterp contained /\$\w\+/

" Regex
syn region rakuRegex start=+/+ skip=+\\/+ end=+/+ contains=rakuEscape
syn region rakuRegex start=+rx/+ end=+/+
syn region rakuRegex start=+m/+ end=+/+
syn region rakuRegex start=+s/+ end=+/[^/]*/+

" Numbers
syn match rakuDecimalInt "\<\d[0-9_]*\>"
syn match rakuHexInt "\<0[xX][0-9a-fA-F_]\+\>"
syn match rakuOctInt "\<0[oO][0-7_]\+\>"
syn match rakuBinInt "\<0[bB][01_]\+\>"
syn match rakuFloat "\<\d[0-9_]*\.\d[0-9_]*\>"
syn match rakuFloat "\<\d[0-9_]*\.\d[0-9_]*[eE][+-]\?\d[0-9_]*\>"
syn match rakuRat "\<\d\+/\d\+\>"

" Keywords
syn keyword rakuKeyword use need import no module class role grammar
syn keyword rakuKeyword token rule regex method submethod multi proto
syn keyword rakuKeyword only sub my our has state let constant enum
syn keyword rakuKeyword subset where augment supersede is does returns
syn keyword rakuKeyword of begin end init leave keep undo pre post
syn keyword rakuKeyword enter exit control catch try throw die fail
syn keyword rakuKeyword warn return last next redo
syn keyword rakuKeyword given when default loop for while until repeat
syn keyword rakuKeyword gather take start react whenever supply emit
syn keyword rakuKeyword done quit with without orwith
syn keyword rakuKeyword do proceed succeed make made

" Conditional
syn keyword rakuConditional if elsif else unless when given default with without orwith

" Repeat
syn keyword rakuRepeat for loop while until repeat gather

" Statement
syn keyword rakuStatement return last next redo die fail warn throw

" Exception
syn keyword rakuException try catch throw die fail

" Special return
syn match rakuKeyword /\<return-rw\>/
syn match rakuKeyword /\<take-rw\>/

" Types
syn keyword rakuType Mu Any Junction Cool Bool True False Int Num
syn keyword rakuType Rat FatRat Complex Str Blob Buf Uni Array List
syn keyword rakuType Seq Range Hash Map Set SetHash Bag BagHash Mix
syn keyword rakuType MixHash Pair Slip Supply Promise Channel Lock
syn keyword rakuType Semaphore IO Proc Nil Failure Exception Match
syn keyword rakuType Regex Grammar Block Code Routine Sub Method
syn keyword rakuType Signature Parameter Capture

" IO::Path
syn match rakuType /\<IO::Path\>/

" Built-in functions
syn keyword rakuBuiltin say print put note dd die exit sleep prompt
syn keyword rakuBuiltin gist perl raku WHAT WHO HOW WHICH WHERE
syn keyword rakuBuiltin DEFINITE Bool Int Num Str abs sign floor
syn keyword rakuBuiltin ceiling round truncate sqrt roots log log10
syn keyword rakuBuiltin exp sin cos tan asin acos atan atan2
syn keyword rakuBuiltin chars codes encode decode uc lc tc fc flip
syn keyword rakuBuiltin words lines split join comb match subst substr
syn keyword rakuBuiltin index rindex contains chop chomp
syn keyword rakuBuiltin trim elems end keys values pairs kv sort
syn keyword rakuBuiltin reverse unique squish flat eager lazy map grep
syn keyword rakuBuiltin first head tail skip pick roll min max minmax
syn keyword rakuBuiltin sum reduce produce classify categorize zip cross
syn keyword rakuBuiltin push pop shift unshift append prepend splice rotate

" Special built-in with hyphens
syn match rakuBuiltin /\<starts-with\>/
syn match rakuBuiltin /\<ends-with\>/
syn match rakuBuiltin /\<trim-leading\>/
syn match rakuBuiltin /\<trim-trailing\>/

" Constants
syn keyword rakuConstant True False Nil pi e tau Inf NaN

" Sigils and twigils
syn match rakuIdentifier /[$@%&]\(\.\|!\|^\|\*\|?\|=\|~\)\?\w\+/

" Operators
syn match rakuOperator /[-+%<>!&|^*=]=\?/
syn match rakuOperator /<=>/
syn match rakuOperator /\.\./
syn match rakuOperator /\.\.\./
syn match rakuOperator /&&\|||/
syn match rakuOperator /\/\//
syn match rakuOperator /=>/
syn match rakuOperator /~~\|!~~/
syn match rakuOperator /\<eq\>\|\<ne\>\|\<lt\>\|\<gt\>\|\<le\>\|\<ge\>/
syn match rakuOperator /\<leg\>\|\<cmp\>/
syn match rakuOperator /\<but\>\|\<also\>/

" Functions
syn match rakuFunction /\<\w\+\>\ze\s*(/

" Method calls
syn match rakuFunction /\.\w\+\>\ze\s*(/

hi def link rakuComment Comment
hi def link rakuTodo Todo
hi def link rakuPod Comment
hi def link rakuString String
hi def link rakuHeredoc String
hi def link rakuRegex String
hi def link rakuEscape Special
hi def link rakuInterp Special
hi def link rakuDecimalInt Number
hi def link rakuHexInt Number
hi def link rakuOctInt Number
hi def link rakuBinInt Number
hi def link rakuFloat Number
hi def link rakuRat Number
hi def link rakuKeyword Keyword
hi def link rakuConditional Conditional
hi def link rakuRepeat Repeat
hi def link rakuStatement Statement
hi def link rakuException Exception
hi def link rakuType Type
hi def link rakuBuiltin Function
hi def link rakuConstant Constant
hi def link rakuIdentifier Identifier
hi def link rakuOperator Operator
hi def link rakuFunction Function

let b:current_syntax = "raku"
