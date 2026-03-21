" Vim syntax file
" Language:    AWK
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword awkTodo contained TODO FIXME XXX NOTE HACK BUG
syn match awkComment "#.*$" contains=awkTodo

" Strings
syn region awkString start=+"+ skip=+\\"+ end=+"+ contains=awkEscape
syn match awkEscape "\\[\\\"abfnrtv/]" contained
syn match awkEscape "\\[0-7]\{1,3}" contained
syn match awkEscape "\\x[0-9a-fA-F]\{1,2}" contained

" Regex
syn region awkRegex start="/" skip="\\/" end="/" oneline

" Numbers
syn match awkNumber "\<\d\+\>"
syn match awkNumber "\<0[xX][0-9a-fA-F]\+\>"
syn match awkNumber "\<0[0-7]\+\>"
syn match awkNumber "\<\d\+\.\d*\([eE][+-]\?\d\+\)\?\>"
syn match awkNumber "\<\.\d\+\([eE][+-]\?\d\+\)\?\>"
syn match awkNumber "\<\d\+[eE][+-]\?\d\+\>"

" Patterns/special blocks
syn keyword awkStatement BEGIN END BEGINFILE ENDFILE

" Keywords
syn keyword awkConditional if else
syn keyword awkRepeat while for do
syn keyword awkKeyword break continue delete exit next nextfile
syn keyword awkKeyword function return getline
syn keyword awkKeyword in

" I/O keywords
syn keyword awkFunction print printf sprintf

" Built-in variables
syn match awkVariable "\<NR\>"
syn match awkVariable "\<NF\>"
syn match awkVariable "\<FS\>"
syn match awkVariable "\<RS\>"
syn match awkVariable "\<OFS\>"
syn match awkVariable "\<ORS\>"
syn match awkVariable "\<FILENAME\>"
syn match awkVariable "\<FNR\>"
syn match awkVariable "\<ARGC\>"
syn match awkVariable "\<ARGV\>"
syn match awkVariable "\<ENVIRON\>"
syn match awkVariable "\<OFMT\>"
syn match awkVariable "\<CONVFMT\>"
syn match awkVariable "\<SUBSEP\>"
syn match awkVariable "\<RSTART\>"
syn match awkVariable "\<RLENGTH\>"
syn match awkVariable "\<FIELDWIDTHS\>"
syn match awkVariable "\<FPAT\>"
syn match awkVariable "\<BINMODE\>"
syn match awkVariable "\<LINT\>"
syn match awkVariable "\<PREC\>"
syn match awkVariable "\<ROUNDMODE\>"
syn match awkVariable "\<TEXTDOMAIN\>"
syn match awkVariable "\<ERRNO\>"

" Field variables
syn match awkVariable "\$[0-9]\+"
syn match awkVariable "\$NF\>"

" Built-in functions
syn keyword awkFunction length substr index split sub gsub match patsplit
syn keyword awkFunction tolower toupper
syn keyword awkFunction system
syn keyword awkFunction mktime systime strftime
syn keyword awkFunction sin cos atan2 exp log sqrt int rand srand
syn keyword awkFunction and or xor compl lshift rshift
syn keyword awkFunction close fflush

" Pipe and redirection
syn match awkOperator "|"
syn match awkOperator "|&"
syn match awkOperator ">"
syn match awkOperator ">>"
syn match awkOperator "<"

" Operators
syn match awkOperator "[+\-*/%^]"
syn match awkOperator "++\|--"
syn match awkOperator "[+\-*/%^]="
syn match awkOperator "==\|!=\|<=\|>=\|<\|>"
syn match awkOperator "&&\|||"
syn match awkOperator "[!~]"
syn match awkOperator "?:"
syn match awkOperator "\.\."

" Highlight links
hi def link awkComment Comment
hi def link awkTodo Todo
hi def link awkString String
hi def link awkEscape Special
hi def link awkRegex String
hi def link awkNumber Number
hi def link awkStatement Statement
hi def link awkConditional Conditional
hi def link awkRepeat Repeat
hi def link awkKeyword Keyword
hi def link awkFunction Function
hi def link awkVariable Identifier
hi def link awkOperator Operator

let b:current_syntax = "awk"
