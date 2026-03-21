" Vim syntax file
" Language:    COBOL
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case ignore

" Comments - fixed form (column 7 indicator)
syn match cobolComment "^\s\{6\}[*].*$" contains=cobolTodo
" Comments - free form
syn match cobolComment "\*>.*$" contains=cobolTodo
syn keyword cobolTodo contained TODO FIXME XXX NOTE HACK BUG

" Strings
syn region cobolString start=+"+ end=+"+
syn region cobolString start=+'+ end=+'+

" Numbers
syn match cobolNumber "\<\d\+\>"
syn match cobolNumber "\<\d\+\.\d*\>"
syn match cobolNumber "[+-]\d\+\>"
syn match cobolNumber "[+-]\d\+\.\d*\>"

" Boolean / special values
syn keyword cobolConstant TRUE FALSE ZEROES ZEROS SPACES SPACE
syn keyword cobolConstant LOW-VALUES LOW-VALUE HIGH-VALUES HIGH-VALUE
syn keyword cobolConstant NULL NULLS QUOTE QUOTES

" Division headers
syn keyword cobolLabel IDENTIFICATION ENVIRONMENT DATA PROCEDURE
syn keyword cobolLabel DIVISION SECTION PARAGRAPH

" Data division keywords
syn keyword cobolKeyword WORKING-STORAGE LOCAL-STORAGE LINKAGE FILE
syn keyword cobolKeyword FD SD COPY REPLACE
syn keyword cobolKeyword PIC PICTURE OCCURS REDEFINES RENAMES
syn keyword cobolKeyword INDEXED ASCENDING DESCENDING KEY DEPENDING
syn keyword cobolKeyword USAGE COMP COMP-1 COMP-2 COMP-3 COMP-5
syn keyword cobolKeyword BINARY PACKED-DECIMAL INDEX POINTER
syn keyword cobolKeyword SIGN LEADING TRAILING SEPARATE
syn keyword cobolKeyword JUST JUSTIFIED BLANK WHEN ZERO FILLER
syn keyword cobolKeyword LEVEL VALUE

" Statement keywords
syn keyword cobolStatement ACCEPT ADD ALTER CALL CANCEL CLOSE COMPUTE
syn keyword cobolStatement CONTINUE DELETE DISPLAY DIVIDE
syn keyword cobolStatement ENTRY EXEC EXECUTE EXIT
syn keyword cobolStatement GO GOBACK INITIALIZE INSPECT INVOKE
syn keyword cobolStatement MERGE MOVE MULTIPLY
syn keyword cobolStatement NEXT OPEN PERFORM READ RELEASE RETURN
syn keyword cobolStatement REWRITE SEARCH SET SORT START STOP
syn keyword cobolStatement STRING SUBTRACT UNSTRING WRITE

" End markers
syn keyword cobolStatement END-ADD END-CALL END-COMPUTE END-DELETE
syn keyword cobolStatement END-DISPLAY END-DIVIDE END-EVALUATE END-IF
syn keyword cobolStatement END-MULTIPLY END-PERFORM END-READ END-RETURN
syn keyword cobolStatement END-REWRITE END-SEARCH END-START END-STRING
syn keyword cobolStatement END-SUBTRACT END-UNSTRING END-WRITE END-EXEC

" Conditionals
syn keyword cobolConditional IF ELSE EVALUATE WHEN THEN

" Loops
syn keyword cobolRepeat PERFORM UNTIL VARYING THRU THROUGH TIMES

" Operators / clauses
syn keyword cobolOperator NOT AND OR
syn keyword cobolKeyword FROM BY TO GIVING INTO USING RETURNING
syn keyword cobolKeyword ALSO OTHER CORRESPONDING SIZE OVERFLOW ON
syn keyword cobolKeyword REMAINDER ROUNDED TALLYING REPLACING
syn keyword cobolKeyword FIRST INITIAL REFERENCE CONTENT
syn keyword cobolKeyword LENGTH DELIMITED COUNT WITH ALL

" Scope terminators
syn keyword cobolKeyword DISPLAY

" Picture clause patterns
syn match cobolSpecial "PIC\(TURE\)\?\s\+[9AXVSZ()\.,\+\-*/BCRDP]\+" contains=cobolKeyword

" Level numbers
syn match cobolSpecial "^\s*\(01\|02\|03\|04\|05\|06\|07\|08\|09\|[1-4][0-9]\|66\|77\|88\)\>"

" Paragraph/section names (identifiers followed by period at start of line in procedure div)
syn match cobolIdentifier "^\s\+[A-Za-z][A-Za-z0-9-]*\."

hi def link cobolComment Comment
hi def link cobolTodo Todo
hi def link cobolString String
hi def link cobolNumber Number
hi def link cobolConstant Constant
hi def link cobolLabel Label
hi def link cobolKeyword Keyword
hi def link cobolStatement Statement
hi def link cobolConditional Conditional
hi def link cobolRepeat Repeat
hi def link cobolOperator Operator
hi def link cobolSpecial Special
hi def link cobolIdentifier Identifier

let b:current_syntax = "cobol"
