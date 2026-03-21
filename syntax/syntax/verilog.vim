" Vim syntax file
" Language:    Verilog/SystemVerilog
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword verilogTodo contained TODO FIXME XXX NOTE HACK BUG
syn match verilogComment "//.*$" contains=verilogTodo
syn region verilogComment start="/\*" end="\*/" contains=verilogTodo

" Strings
syn region verilogString start=+"+ skip=+\\"+ end=+"+

" Numbers
syn match verilogNumber "\<\d\+\>"
syn match verilogNumber "\<\d\+'[bB][01_xXzZ]\+\>"
syn match verilogNumber "\<\d\+'[oO][0-7_xXzZ]\+\>"
syn match verilogNumber "\<\d\+'[dD][0-9_xXzZ]\+\>"
syn match verilogNumber "\<\d\+'[hH][0-9a-fA-F_xXzZ]\+\>"
syn match verilogNumber "'[bB][01_xXzZ]\+\>"
syn match verilogNumber "'[oO][0-7_xXzZ]\+\>"
syn match verilogNumber "'[dD][0-9_xXzZ]\+\>"
syn match verilogNumber "'[hH][0-9a-fA-F_xXzZ]\+\>"
syn match verilogNumber "\<[0-9_]\+\.[0-9_]*\([eE][+-]\?[0-9_]\+\)\?\>"
syn match verilogNumber "\<[0-9_]\+[eE][+-]\?[0-9_]\+\>"

" System tasks and functions
syn match verilogSystemTask "\$\w\+"

" Compiler directives
syn match verilogPreProc "`\w\+"

" Verilog keywords
syn keyword verilogKeyword module endmodule input output inout
syn keyword verilogKeyword assign always initial
syn keyword verilogKeyword begin end
syn keyword verilogKeyword parameter localparam defparam
syn keyword verilogKeyword generate endgenerate genvar
syn keyword verilogKeyword function endfunction task endtask
syn keyword verilogKeyword fork join join_any join_none
syn keyword verilogKeyword disable wait
syn keyword verilogKeyword specify endspecify
syn keyword verilogKeyword primitive endprimitive
syn keyword verilogKeyword table endtable
syn keyword verilogKeyword event force release deassign

" Control flow
syn keyword verilogConditional if else case casex casez endcase default
syn keyword verilogRepeat for while repeat forever do foreach

" Edge keywords
syn keyword verilogKeyword posedge negedge

" Gate primitives
syn keyword verilogKeyword or and not nand nor xor xnor
syn keyword verilogKeyword buf bufif0 bufif1 notif0 notif1
syn keyword verilogKeyword pullup pulldown
syn keyword verilogKeyword supply0 supply1
syn keyword verilogKeyword strong0 strong1 pull0 pull1 weak0 weak1
syn keyword verilogKeyword highz0 highz1

" Types
syn keyword verilogType wire reg integer real time realtime
syn keyword verilogType tri tri0 tri1 triand trior trireg wand wor

" SystemVerilog keywords
syn keyword verilogKeyword class endclass extends implements
syn keyword verilogKeyword interface endinterface
syn keyword verilogKeyword package endpackage
syn keyword verilogKeyword program endprogram
syn keyword verilogKeyword property endproperty
syn keyword verilogKeyword sequence endsequence
syn keyword verilogKeyword checker endchecker
syn keyword verilogKeyword clocking endclocking
syn keyword verilogKeyword covergroup endgroup
syn keyword verilogKeyword constraint solve
syn keyword verilogKeyword rand randc
syn keyword verilogKeyword virtual pure extern static automatic
syn keyword verilogKeyword protected local
syn keyword verilogKeyword import export typedef
syn keyword verilogKeyword packed tagged
syn keyword verilogKeyword new null this super
syn keyword verilogKeyword return break continue
syn keyword verilogKeyword inside dist
syn keyword verilogKeyword unique priority unique0 priority0
syn keyword verilogKeyword iff matches
syn keyword verilogKeyword assert assume cover expect
syn keyword verilogKeyword cross bins ignore_bins illegal_bins wildcard
syn keyword verilogKeyword first_match throughout intersect within with

" SystemVerilog types
syn keyword verilogType logic bit byte shortint int longint shortreal
syn keyword verilogType string chandle void
syn keyword verilogType enum struct union
syn keyword verilogType const ref type

" Operators
syn match verilogOperator "[&|~^!<>=+\-*/%]"
syn match verilogOperator "&&\|||"
syn match verilogOperator "<<\|>>\|<<<\|>>>"
syn match verilogOperator "===\|!==\|==\|!="
syn match verilogOperator "<=\|>="
syn match verilogOperator "?:"
syn match verilogOperator "->>\|->"
syn match verilogOperator "##"

" Highlight links
hi def link verilogComment Comment
hi def link verilogTodo Todo
hi def link verilogString String
hi def link verilogNumber Number
hi def link verilogKeyword Keyword
hi def link verilogConditional Conditional
hi def link verilogRepeat Repeat
hi def link verilogType Type
hi def link verilogOperator Operator
hi def link verilogSystemTask Function
hi def link verilogPreProc PreProc

let b:current_syntax = "verilog"
