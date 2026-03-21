" Vim syntax file
" Language:    Ruby
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword rubyTodo contained TODO FIXME XXX BUG NOTE HACK WARN OPTIMIZE
syn match rubyComment "#.*$" contains=rubyTodo
syn region rubyMultilineComment start="^=begin" end="^=end" contains=rubyTodo

" Strings
syn region rubyString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=rubyEscape,rubyInterp
syn region rubyString start=+'+ skip=+\\\\\|\\'+ end=+'+
syn match rubyEscape contained +\\[abefnrstv\\'"\d]+
syn match rubyEscape contained +\\x[0-9a-fA-F]\{1,2}+
syn match rubyEscape contained +\\u[0-9a-fA-F]\{4}+
syn match rubyEscape contained +\\u{[0-9a-fA-F ]\+}+
syn region rubyInterp contained matchgroup=rubyInterpDelim start="#{" end="}"

" Heredocs
syn region rubyHeredoc start=+<<[-~]\?\z(\w\+\)+ end=+^\s*\z1$+ contains=rubyEscape,rubyInterp
syn region rubyHeredoc start=+<<[-~]\?"\z(\w\+\)"+ end=+^\s*\z1$+ contains=rubyEscape,rubyInterp
syn region rubyHeredoc start=+<<[-~]\?'\z(\w\+\)'+ end=+^\s*\z1$+

" Percent literals
syn region rubyPercentString start=+%[qQ]\?{+ end=+}+ contains=rubyEscape,rubyInterp
syn region rubyPercentString start=+%[qQ]\?\[+ end=+\]+ contains=rubyEscape,rubyInterp
syn region rubyPercentString start=+%[qQ]\?(+ end=+)+ contains=rubyEscape,rubyInterp
syn region rubyPercentArray start=+%w\[+ end=+\]+
syn region rubyPercentArray start=+%w(+ end=+)+
syn region rubyPercentArray start=+%i\[+ end=+\]+
syn region rubyPercentArray start=+%i(+ end=+)+

" Regex
syn region rubyRegex start=+/+ skip=+\\\\\|\\/+ end=+/[imxouesn]*+ oneline

" Symbols
syn match rubySymbol /:\([a-zA-Z_]\w*[!?=]\?\|[-+*\/%&|^~<>]=\?\|===\?\|<<=\?\|>>=\?\|\[\]=\?\)/ contains=rubySymbolName
syn region rubySymbol start=+:"+ skip=+\\\\\|\\"+ end=+"+

" Numbers
syn match rubyInteger "\<\d[0-9_]*\>"
syn match rubyInteger "\<0[xX][0-9a-fA-F_]\+\>"
syn match rubyInteger "\<0[oO]\?[0-7_]\+\>"
syn match rubyInteger "\<0[bB][01_]\+\>"
syn match rubyFloat "\<\d[0-9_]*\.\d[0-9_]*\>"
syn match rubyFloat "\<\d[0-9_]*\(\.\d[0-9_]*\)\?[eE][+-]\?\d[0-9_]*\>"
syn match rubyRational "\<\d[0-9_]*r\>"
syn match rubyComplex "\<\d[0-9_]*i\>"

" Keywords
syn keyword rubyKeyword def class module end if elsif else unless
syn keyword rubyKeyword while until for do begin rescue ensure raise
syn keyword rubyKeyword return yield super self then case when in
syn keyword rubyKeyword and or not defined? alias undef
syn keyword rubyKeyword BEGIN END __END__

" Conditional
syn keyword rubyConditional if elsif else unless case when then

" Repeat
syn keyword rubyRepeat while until for do

" Exception
syn keyword rubyException begin rescue ensure raise retry

" Block keywords
syn keyword rubyKeyword block_given? lambda proc

" Access modifiers
syn keyword rubyAccess public private protected

" Attribute macros
syn keyword rubyMacro attr_reader attr_writer attr_accessor
syn keyword rubyMacro include extend prepend
syn keyword rubyMacro require require_relative

" Constants and booleans
syn keyword rubyConstant nil true false __FILE__ __LINE__ __dir__ __method__ __ENCODING__
syn match rubyConstant /\<[A-Z][A-Z0-9_]*\>/

" Types / classes
syn keyword rubyType Integer Float String Symbol Array Hash Regexp Range
syn keyword rubyType Proc Lambda Method IO File Dir Time Thread Mutex Fiber
syn keyword rubyType Numeric Complex Rational Struct Class Module Object
syn keyword rubyType BasicObject Kernel Enumerable Comparable

" Built-in functions
syn keyword rubyBuiltin puts print p pp gets open rand srand sleep
syn keyword rubyBuiltin exit abort at_exit loop freeze frozen? dup clone
syn keyword rubyBuiltin respond_to? send method is_a? kind_of? instance_of?
syn keyword rubyBuiltin nil? class object_id inspect
syn keyword rubyBuiltin to_s to_i to_f to_a to_h
syn keyword rubyBuiltin map select reject each reduce inject collect
syn keyword rubyBuiltin detect find flat_map zip sort sort_by min max
syn keyword rubyBuiltin count any? all? none? empty? include?
syn keyword rubyBuiltin push pop shift unshift length size
syn keyword rubyBuiltin first last compact uniq flatten join split
syn keyword rubyBuiltin gsub sub match scan strip chomp chop
syn keyword rubyBuiltin upcase downcase capitalize
syn keyword rubyBuiltin catch throw

" Instance variables
syn match rubyInstanceVar /@[a-zA-Z_]\w*/

" Class variables
syn match rubyClassVar /@@[a-zA-Z_]\w*/

" Global variables
syn match rubyGlobalVar /\$[a-zA-Z_]\w*/
syn match rubyGlobalVar /\$[0-9]/
syn match rubyGlobalVar /\$[-!@&+`'=~\/\\,;.<>_*$?:"]/

" Method definitions
syn match rubyMethodDef /\<def\s\+\w\+[!?=]\?/

" Operators
syn match rubyOperator /[-+*\/%&|^~<>=!]=\?/
syn match rubyOperator /<=>/
syn match rubyOperator /===/
syn match rubyOperator /\.\./
syn match rubyOperator /\.\.\./
syn match rubyOperator /&&\|||/
syn match rubyOperator /<</
syn match rubyOperator />>/
syn match rubyOperator /=>/
syn match rubyOperator /&\./
syn match rubyOperator /::/

" Block arguments
syn match rubyBlockArg /|[^|]*|/

hi def link rubyComment Comment
hi def link rubyMultilineComment Comment
hi def link rubyTodo Todo
hi def link rubyString String
hi def link rubyHeredoc String
hi def link rubyPercentString String
hi def link rubyPercentArray String
hi def link rubyEscape Special
hi def link rubyInterp Special
hi def link rubyInterpDelim Special
hi def link rubyRegex String
hi def link rubySymbol Constant
hi def link rubyInteger Number
hi def link rubyFloat Number
hi def link rubyRational Number
hi def link rubyComplex Number
hi def link rubyKeyword Keyword
hi def link rubyConditional Conditional
hi def link rubyRepeat Repeat
hi def link rubyException Exception
hi def link rubyAccess Keyword
hi def link rubyMacro PreProc
hi def link rubyConstant Constant
hi def link rubyType Type
hi def link rubyBuiltin Function
hi def link rubyInstanceVar Identifier
hi def link rubyClassVar Identifier
hi def link rubyGlobalVar Identifier
hi def link rubyMethodDef Function
hi def link rubyOperator Operator
hi def link rubyBlockArg Special

let b:current_syntax = "ruby"
