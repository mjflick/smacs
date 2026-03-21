" Vim syntax file
" Language:    Tcl
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword tclTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region tclComment start="^\s*#" end="$" contains=tclTodo
syn region tclComment start="\;\s*#" end="$" contains=tclTodo

" String literals
syn region tclString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=tclEscape,tclVariable,tclCommand
syn region tclBraces start=+{+ end=+}+ contains=tclBraces
syn match tclEscape contained +\\[abfnrtv\\"{}[\]$; ]+
syn match tclEscape contained +\\x[0-9a-fA-F]\{1,2}+
syn match tclEscape contained +\\u[0-9a-fA-F]\{1,4}+
syn match tclEscape contained +\\[0-7]\{1,3}+
syn match tclEscape contained +\\\n+

" Variable substitution
syn match tclVariable /\$\w\+/
syn match tclVariable /\${\w[^}]*}/
syn match tclVariable /\$::\w\+/
syn match tclVariable /\$\w\+(\w\+)/

" Command substitution
syn region tclCommand start=+\[+ end=+\]+ contains=tclString,tclVariable,tclCommand,tclKeyword,tclBuiltin

" Numbers
syn match tclDecimalInt "\<\d\+\>"
syn match tclHexInt "\<0[xX][0-9a-fA-F]\+\>"
syn match tclOctInt "\<0[oO]\?[0-7]\+\>"
syn match tclBinInt "\<0[bB][01]\+\>"
syn match tclFloat "\<\d\+\.\d*\([eE][+-]\?\d\+\)\?\>"
syn match tclFloat "\<\.\d\+\([eE][+-]\?\d\+\)\?\>"
syn match tclFloat "\<\d\+[eE][+-]\?\d\+\>"

" Keywords
syn keyword tclKeyword after append apply array auto_execok auto_import
syn keyword tclKeyword auto_load auto_mkindex auto_qualify auto_reset
syn keyword tclKeyword bgerror binary break catch cd chan clock close
syn keyword tclKeyword concat continue coroutine dde dict encoding eof
syn keyword tclKeyword error eval exec exit expr fblocked fconfigure
syn keyword tclKeyword fcopy file fileevent flush for foreach format
syn keyword tclKeyword gets glob global history http if incr info interp
syn keyword tclKeyword join lappend lassign lindex linsert list llength
syn keyword tclKeyword lmap load lrange lrepeat lreplace lreverse lsearch
syn keyword tclKeyword lset lsort namespace open package pid platform
syn keyword tclKeyword proc puts pwd read refchan regexp registry regsub
syn keyword tclKeyword rename return safe scan seek set socket source
syn keyword tclKeyword split string subst switch tailcall tcl tell throw
syn keyword tclKeyword time tm trace transchan try unload unset update
syn keyword tclKeyword uplevel upvar variable vwait while yield yieldto zlib

" Conditional
syn keyword tclConditional if else elseif switch

" Repeat
syn keyword tclRepeat for foreach while

" Statement
syn keyword tclStatement return break continue exit error throw

" Exception
syn keyword tclException catch try throw error

" Built-in commands
syn keyword tclBuiltin expr string list dict array file info regexp
syn keyword tclBuiltin regsub format scan clock encoding binary namespace
syn keyword tclBuiltin package interp chan socket fconfigure fileevent http

" OOP
syn match tclBuiltin /\<oo::class\>/
syn match tclBuiltin /\<oo::object\>/
syn match tclBuiltin /\<oo::define\>/
syn match tclBuiltin /\<oo::objdefine\>/
syn match tclBuiltin /\<oo::copy\>/
syn match tclBuiltin /\<oo::next\>/
syn match tclBuiltin /\<oo::nextto\>/
syn keyword tclBuiltin my self variable constructor destructor method
syn keyword tclBuiltin forward mixin superclass unexport export filter

" Operators
syn match tclOperator /[-+%<>!&|^*=]=\?/
syn match tclOperator /&&\|||/
syn match tclOperator /\<eq\>\|\<ne\>/
syn match tclOperator /\<in\>\|\<ni\>/

" Procedure definitions
syn match tclFunction /\<proc\s\+\w\+/

" Namespace separators
syn match tclSpecial /::/

hi def link tclComment Comment
hi def link tclTodo Todo
hi def link tclString String
hi def link tclBraces String
hi def link tclEscape Special
hi def link tclVariable Identifier
hi def link tclCommand Special
hi def link tclDecimalInt Number
hi def link tclHexInt Number
hi def link tclOctInt Number
hi def link tclBinInt Number
hi def link tclFloat Number
hi def link tclKeyword Keyword
hi def link tclConditional Conditional
hi def link tclRepeat Repeat
hi def link tclStatement Statement
hi def link tclException Exception
hi def link tclBuiltin Function
hi def link tclOperator Operator
hi def link tclFunction Function
hi def link tclSpecial Special

let b:current_syntax = "tcl"
