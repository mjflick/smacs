" Vim syntax file
" Language:    MATLAB
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword matlabTodo TODO FIXME XXX NOTE HACK BUG contained
syn match matlabLineComment "%.*$" contains=matlabTodo
syn region matlabBlockComment start="%{" end="%}" contains=matlabTodo

" Strings
syn region matlabString start=+"+ skip=+""+ end=+"+
syn region matlabString start=+'+ skip=+''+ end=+'+

" Numbers
syn match matlabNumber "\<\d\+\>"
syn match matlabNumber "\<\d\+\.\d*\([eE][+-]\?\d\+\)\?\>"
syn match matlabNumber "\<\.\d\+\([eE][+-]\?\d\+\)\?\>"
syn match matlabNumber "\<\d\+[eE][+-]\?\d\+\>"
syn match matlabNumber "\<0[xX][0-9a-fA-F]\+\>"
syn match matlabNumber "\<\d\+[ij]\>"
syn match matlabNumber "\<\d\+\.\d*\([eE][+-]\?\d\+\)\?[ij]\>"

" Keywords
syn keyword matlabKeyword break case catch classdef continue else elseif end
syn keyword matlabKeyword enumeration events for function global if methods
syn keyword matlabKeyword otherwise parfor persistent properties return spmd
syn keyword matlabKeyword switch try while

" Conditional / Repeat / Exception
syn keyword matlabConditional if else elseif switch case otherwise
syn keyword matlabRepeat for while parfor
syn keyword matlabException try catch

" Statement
syn keyword matlabStatement end function return

" Types
syn keyword matlabType double single int8 int16 int32 int64 uint8 uint16 uint32
syn keyword matlabType uint64 logical char string cell struct table timetable
syn keyword matlabType categorical function_handle

" containers.Map is special
syn match matlabType "containers\.Map"

" Builtins - Display and I/O
syn keyword matlabBuiltin disp fprintf sprintf input error warning assert

" Builtins - Array creation and manipulation
syn keyword matlabBuiltin length size numel ndims zeros ones eye rand randn
syn keyword matlabBuiltin linspace logspace reshape repmat cat vertcat horzcat

" Builtins - Sorting and searching
syn keyword matlabBuiltin sort sortrows unique find

" Builtins - Math and statistics
syn keyword matlabBuiltin max min sum prod mean median std var abs sqrt log log10
syn keyword matlabBuiltin log2 exp sin cos tan asin acos atan atan2 ceil floor
syn keyword matlabBuiltin round fix mod rem power

" Builtins - Plotting
syn keyword matlabBuiltin plot figure subplot title xlabel ylabel legend grid hold
syn keyword matlabBuiltin axis xlim ylim close

" Builtins - File I/O
syn keyword matlabBuiltin fopen fclose fread fwrite fscanf fgets feof

" Builtins - Type checking
syn keyword matlabBuiltin exist isempty isnumeric ischar islogical iscell isstruct
syn keyword matlabBuiltin class isa fieldnames rmfield

" Builtins - Conversion
syn keyword matlabBuiltin cell2mat num2str str2num str2double

" Builtins - String operations
syn keyword matlabBuiltin strcmp strcmpi strfind strrep regexp regexprep strsplit
syn keyword matlabBuiltin strjoin upper lower strtrim

" Operators
syn match matlabOperator "[-+*/\\^<>=~&|@]"
syn match matlabOperator "\.\*\|\./\|\.\\\.^\|\.\'"
syn match matlabOperator "==\|~=\|<=\|>=\|&&\|||"
syn match matlabOperator "\.\.\."

" Transpose
syn match matlabOperator "'"

" Special constants
syn keyword matlabConstant pi eps inf Inf nan NaN true false

" Labels (for end matching)
syn keyword matlabLabel end

" Highlighting
hi def link matlabTodo Todo
hi def link matlabLineComment Comment
hi def link matlabBlockComment Comment
hi def link matlabString String
hi def link matlabNumber Number
hi def link matlabKeyword Keyword
hi def link matlabConditional Conditional
hi def link matlabRepeat Repeat
hi def link matlabException Exception
hi def link matlabStatement Statement
hi def link matlabType Type
hi def link matlabBuiltin Function
hi def link matlabOperator Operator
hi def link matlabConstant Constant
hi def link matlabLabel Label

let b:current_syntax = "matlab"
