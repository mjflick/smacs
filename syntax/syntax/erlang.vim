" Vim syntax file
" Language:    Erlang
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword erlangTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region erlangComment start="%" end="$" contains=erlangTodo

" Strings
syn region erlangString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=erlangEscape
syn match erlangEscape contained +\\[bdefnrstv\\'"]+
syn match erlangEscape contained +\\[0-7]\{1,3}+
syn match erlangEscape contained +\\x[0-9a-fA-F]\{2}+
syn match erlangEscape contained +\\x{[0-9a-fA-F]\+}+

" Atoms (single-quoted)
syn region erlangQuotedAtom start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=erlangEscape

" Atoms (unquoted, lowercase start)
syn match erlangAtom "\<[a-z][a-zA-Z0-9_@]*\>"

" Numbers
syn match erlangInteger "\<\d\+\>"
syn match erlangInteger "\<\d\+#[0-9a-zA-Z]\+\>"
syn match erlangFloat "\<\d\+\.\d\+\>"
syn match erlangFloat "\<\d\+\.\d\+[eE][+-]\?\d\+\>"
syn match erlangChar "\$\\."
syn match erlangChar "\$[^\\]"

" Variables (uppercase start or underscore)
syn match erlangVariable "\<[A-Z_][a-zA-Z0-9_]*\>"

" Keywords
syn keyword erlangKeyword after begin case catch cond end fun if let
syn keyword erlangKeyword of query receive try when

" Operators
syn keyword erlangOperator andalso orelse not and or xor
syn keyword erlangOperator band bor bxor bnot bsl bsr div rem
syn match erlangOperator "[-+*/]=\?"
syn match erlangOperator "[<>]=\?"
syn match erlangOperator "=:=\|=/="
syn match erlangOperator "=<\|>="
syn match erlangOperator "==\|/="
syn match erlangOperator "=!\|!"
syn match erlangOperator "<-\|->"
syn match erlangOperator "=>"
syn match erlangOperator ":="
syn match erlangOperator "++"
syn match erlangOperator "--"
syn match erlangOperator "||"

" Conditional
syn keyword erlangConditional case if of end

" Repeat (none native, but list comprehensions)

" Module and function declarations
syn match erlangModuleDecl "-module\s*(" contains=erlangModuleAttr
syn match erlangExportDecl "-export\s*(" contains=erlangModuleAttr
syn match erlangImportDecl "-import\s*(" contains=erlangModuleAttr
syn match erlangModuleAttr "-\(module\|export\|export_type\|import\|behaviour\|behavior\|compile\|define\|ifdef\|ifndef\|else\|endif\|include\|include_lib\|record\|type\|opaque\|spec\|callback\|on_load\|optional_callbacks\|vsn\|author\)\>"

" Type specifications
syn keyword erlangType integer float atom binary bitstring boolean function
syn keyword erlangType list map number pid port reference tuple term
syn keyword erlangType any none no_return module mfa arity node timeout

" Built-in functions
syn keyword erlangBuiltin abs apply atom_to_binary atom_to_list
syn keyword erlangBuiltin binary_part binary_to_atom binary_to_float
syn keyword erlangBuiltin binary_to_integer binary_to_list binary_to_term
syn keyword erlangBuiltin bit_size byte_size ceil element erase error exit
syn keyword erlangBuiltin float float_to_binary float_to_list floor
syn keyword erlangBuiltin get get_keys group_leader hd
syn keyword erlangBuiltin integer_to_binary integer_to_list
syn keyword erlangBuiltin iolist_size iolist_to_binary
syn keyword erlangBuiltin is_alive is_atom is_binary is_bitstring
syn keyword erlangBuiltin is_boolean is_float is_function is_integer
syn keyword erlangBuiltin is_list is_map is_map_key is_number is_pid
syn keyword erlangBuiltin is_port is_process_alive is_record is_reference
syn keyword erlangBuiltin is_tuple length link list_to_atom list_to_binary
syn keyword erlangBuiltin list_to_float list_to_integer list_to_pid
syn keyword erlangBuiltin list_to_port list_to_ref list_to_tuple
syn keyword erlangBuiltin make_ref map_get map_size max min monitor node
syn keyword erlangBuiltin nodes now open_port pid_to_list port_to_list
syn keyword erlangBuiltin process_flag process_info processes put
syn keyword erlangBuiltin ref_to_list register registered round self
syn keyword erlangBuiltin setelement size spawn spawn_link spawn_monitor
syn keyword erlangBuiltin split_binary term_to_binary throw time tl trunc
syn keyword erlangBuiltin tuple_size tuple_to_list unlink unregister whereis

" Module names
syn keyword erlangModule io lists maps string binary file gen_server
syn keyword erlangModule gen_statem supervisor application ets timer
syn keyword erlangModule erlang math proplists dict sets ordsets orddict
syn keyword erlangModule queue gb_trees gb_sets array digraph re crypto
syn keyword erlangModule ssl inets httpc httpd mnesia

" Constants
syn keyword erlangConstant true false undefined

" Function calls
syn match erlangFunction "\<[a-z][a-zA-Z0-9_]*\>\ze\s*("
syn match erlangFunction "\<[a-z][a-zA-Z0-9_]*\>\ze:"

" Record syntax
syn match erlangRecord "#[a-z][a-zA-Z0-9_]*"

" Macro
syn match erlangMacro "?[a-zA-Z_][a-zA-Z0-9_]*"

" Binary syntax
syn region erlangBinary start="<<" end=">>"

hi def link erlangComment Comment
hi def link erlangTodo Todo
hi def link erlangString String
hi def link erlangEscape Special
hi def link erlangQuotedAtom String
hi def link erlangAtom Constant
hi def link erlangInteger Number
hi def link erlangFloat Number
hi def link erlangChar Number
hi def link erlangVariable Identifier
hi def link erlangKeyword Keyword
hi def link erlangConditional Conditional
hi def link erlangOperator Operator
hi def link erlangModuleAttr PreProc
hi def link erlangType Type
hi def link erlangBuiltin Function
hi def link erlangModule Type
hi def link erlangConstant Constant
hi def link erlangFunction Function
hi def link erlangRecord Special
hi def link erlangMacro PreProc
hi def link erlangBinary Special

let b:current_syntax = "erlang"
