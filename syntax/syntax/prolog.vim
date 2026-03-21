" Vim syntax file
" Language:    Prolog
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword prologTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region prologComment start="%" end="$" contains=prologTodo
syn region prologComment start="/\*" end="\*/" contains=prologTodo

" String literals
syn region prologString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=prologEscape
syn region prologAtomQuoted start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=prologEscape
syn match prologEscape contained +\\[abfnrtv\\"']+
syn match prologEscape contained +\\x[0-9a-fA-F]\+\\+
syn match prologEscape contained +\\[0-7]\{1,3}\\+

" Numbers
syn match prologNumber "\<\d\+\>"
syn match prologNumber "\<\d\+\.\d\+\>"
syn match prologNumber "\<\d\+\.\d\+[eE][+-]\?\d\+\>"
syn match prologNumber "\<0[xX][0-9a-fA-F]\+\>"
syn match prologNumber "\<0[oO][0-7]\+\>"
syn match prologNumber "\<0[bB][01]\+\>"
syn match prologNumber "\<0'.\>"

" Variables (start with uppercase or _)
syn match prologVariable /\<[A-Z_]\w*/

" Anonymous variable
syn match prologVariable /\<_\>/

" Atoms (lowercase start)
syn match prologAtom /\<[a-z]\w*/

" Keywords / Control
syn match prologKeyword /:-/
syn match prologKeyword /?-/
syn match prologKeyword /->/
syn keyword prologKeyword true false fail not is mod rem div xor

" Operators
syn match prologOperator /[+\-*/\\^]=\?/
syn match prologOperator /=:=\|=\\=\|=\.\.\|\\==/
syn match prologOperator /=<\|>=\|<\|>/
syn match prologOperator /\\+/
syn match prologOperator /=\|\\=/
syn match prologOperator /==/
syn match prologOperator /@<\|@>\|@=<\|@>=/

" Cut
syn match prologSpecial /!/

" Conditional
syn keyword prologConditional if then else

" Statement
syn match prologStatement /:-/
syn match prologStatement /?-/

" Built-in predicates
syn keyword prologBuiltin write writeln nl read get_char put_char
syn keyword prologBuiltin atom number integer float compound callable ground
syn keyword prologBuiltin var nonvar atom_chars atom_codes atom_length
syn keyword prologBuiltin atom_concat sub_atom char_code number_chars
syn keyword prologBuiltin number_codes char_type atom_string term_string
syn keyword prologBuiltin copy_term functor arg
syn keyword prologBuiltin assert asserta assertz retract abolish clause
syn keyword prologBuiltin findall bagof setof forall aggregate_all
syn keyword prologBuiltin msort predsort length append member memberchk
syn keyword prologBuiltin last nth0 nth1 reverse flatten sort
syn keyword prologBuiltin permutation select subtract intersection union
syn keyword prologBuiltin include exclude maplist foldl numlist between
syn keyword prologBuiltin succ plus max_list min_list sum_list
syn keyword prologBuiltin atom_to_term term_to_atom format with_output_to
syn keyword prologBuiltin string_concat string_length string_code
syn keyword prologBuiltin string_to_atom atom_to_number number_to_atom
syn keyword prologBuiltin string_codes split_string sub_string
syn keyword prologBuiltin read_term write_term open close see seen tell told
syn keyword prologBuiltin stream_property set_stream current_input current_output
syn keyword prologBuiltin set_input set_output at_end_of_stream
syn keyword prologBuiltin get_time sleep catch throw halt
syn keyword prologBuiltin abs sign min max truncate round ceiling floor
syn keyword prologBuiltin float_integer_part float_fractional_part
syn keyword prologBuiltin sin cos tan asin acos atan atan2 sqrt exp log
syn keyword prologBuiltin pi e random random_between
syn keyword prologBuiltin ground compound callable is_list proper_list

" Predicate definitions
syn match prologFunction /\<\w\+\>\ze\s*(/
syn match prologFunction /\<\w\+\>\ze\s*:-/

" DCG arrow
syn match prologSpecial /-->/

" List notation
syn match prologSpecial /\[/
syn match prologSpecial /\]/
syn match prologSpecial /|/

hi def link prologComment Comment
hi def link prologTodo Todo
hi def link prologString String
hi def link prologAtomQuoted String
hi def link prologEscape Special
hi def link prologNumber Number
hi def link prologVariable Identifier
hi def link prologAtom Constant
hi def link prologKeyword Keyword
hi def link prologConditional Conditional
hi def link prologStatement Statement
hi def link prologBuiltin Function
hi def link prologOperator Operator
hi def link prologSpecial Special
hi def link prologFunction Function

let b:current_syntax = "prolog"
