" Vim syntax file
" Language:    Ada
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case ignore

" Comments
syn match adaComment "--.*$" contains=adaTodo
syn keyword adaTodo contained TODO FIXME XXX NOTE HACK BUG

" Strings
syn region adaString start=+"+ end=+"+
syn match adaString "'.'"

" Numbers
syn match adaNumber "\<\d[0-9_]*\>"
syn match adaNumber "\<\d[0-9_]*\.\d[0-9_]*\([eE][+-]\?\d[0-9_]*\)\?\>"
syn match adaNumber "\<\d[0-9_]*#[0-9a-fA-F_]\+#\>"
syn match adaNumber "\<\d[0-9_]*#[0-9a-fA-F_]\+\.[0-9a-fA-F_]*#\>"

" Boolean
syn keyword adaBoolean True False

" Keywords
syn keyword adaKeyword abort abs abstract accept access aliased all
syn keyword adaKeyword array at body constant declare delay delta digits
syn keyword adaKeyword entry exception generic goto
syn keyword adaKeyword in interface is limited mod new not null
syn keyword adaKeyword of or others out overriding package parallel pragma
syn keyword adaKeyword private procedure protected raise range record rem
syn keyword adaKeyword renames requeue return reverse select separate some
syn keyword adaKeyword subtype synchronized tagged task terminate
syn keyword adaKeyword type until use when with xor
syn keyword adaKeyword and or not xor

" Conditionals
syn keyword adaConditional if then else elsif case

" Loops
syn keyword adaRepeat for while loop end do

" Statements
syn keyword adaStatement begin end return exit

" Types
syn keyword adaType Integer Natural Positive Float Long_Float Duration
syn keyword adaType Character Wide_Character Wide_Wide_Character
syn keyword adaType String Wide_String Boolean Access Address
syn keyword adaType Storage_Element Storage_Offset Storage_Count
syn keyword adaType Task_Id Exception_Id Exception_Occurrence Tag

" Standard library packages
syn match adaIdentifier "\<Ada\.\(Text_IO\|Integer_Text_IO\|Float_Text_IO\)\>"
syn match adaIdentifier "\<Ada\.Strings\(\.\(Fixed\|Unbounded\|Maps\)\)\?\>"
syn match adaIdentifier "\<Ada\.Characters\.\(Handling\|Latin_1\)\>"
syn match adaIdentifier "\<Ada\.Calendar\(\.\(Formatting\)\)\?\>"
syn match adaIdentifier "\<Ada\.Numerics\(\.\(Elementary_Functions\|Float_Random\)\)\?\>"
syn match adaIdentifier "\<Ada\.Containers\.\(Vectors\|Doubly_Linked_Lists\|Hashed_Maps\|Ordered_Maps\|Hashed_Sets\|Ordered_Sets\)\>"
syn match adaIdentifier "\<Ada\.\(Directories\|Environment_Variables\|Command_Line\|Exceptions\)\>"
syn match adaIdentifier "\<Ada\.\(Streams\|Sequential_IO\|Direct_IO\|Tags\)\>"
syn match adaIdentifier "\<Ada\.Streams\.Stream_IO\>"
syn match adaIdentifier "\<Ada\.\(Task_Identification\|Synchronous_Task_Control\|Real_Time\)\>"
syn match adaIdentifier "\<GNAT\.\(OS_Lib\|Sockets\|Regpat\|String_Split\)\>"
syn match adaIdentifier "\<\(System\|Interfaces\)\>"
syn match adaIdentifier "\<Interfaces\.C\(\.\(Strings\)\)\?\>"

" Builtin subprograms
syn keyword adaFunction Put Put_Line Get Get_Line New_Line Set_Col Col Line Page
syn keyword adaFunction Count Open Close Create Delete Reset
syn keyword adaFunction End_Of_File End_Of_Line End_Of_Page Flush
syn keyword adaFunction Length Element Replace_Element Append Prepend Insert
syn keyword adaFunction First_Index Last_Index Contains Find_Index
syn keyword adaFunction Cursor Has_Element Next Previous
syn keyword adaFunction To_String To_Unbounded_String Trim Head Tail Index
syn keyword adaFunction Replace_Slice Overwrite Translate
syn keyword adaFunction Image Value Succ Pred Pos Val Min Max Abs

" Preprocessor
syn match adaPreProc "^\s*pragma\>"

hi def link adaComment Comment
hi def link adaTodo Todo
hi def link adaString String
hi def link adaNumber Number
hi def link adaBoolean Constant
hi def link adaKeyword Keyword
hi def link adaConditional Conditional
hi def link adaRepeat Repeat
hi def link adaStatement Statement
hi def link adaType Type
hi def link adaIdentifier Identifier
hi def link adaFunction Function
hi def link adaPreProc PreProc

let b:current_syntax = "ada"
