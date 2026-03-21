" Vim syntax file
" Language:    Rust
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword rustTodo contained TODO FIXME XXX BUG NOTE HACK WARN SAFETY
syn region rustComment start="//" end="$" contains=rustTodo
syn region rustComment start="/\*" end="\*/" contains=rustTodo,rustComment
syn region rustDocComment start="///" end="$" contains=rustTodo
syn region rustDocComment start="//!" end="$" contains=rustTodo
syn region rustDocComment start="/\*!" end="\*/" contains=rustTodo

" Strings
syn region rustString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=rustEscape,rustFmtStr
syn region rustRawString start=+r"+ end=+"+ contains=rustFmtStr
syn region rustRawString start=+r#"+ end=+"#+ contains=rustFmtStr
syn region rustRawString start=+r##"+ end=+"##+ contains=rustFmtStr
syn match rustEscape contained +\\[nrt\\'"0]+
syn match rustEscape contained +\\x[0-9a-fA-F]\{2}+
syn match rustEscape contained +\\u{[0-9a-fA-F]\+}+

" Format strings
syn match rustFmtStr contained /{[^}]*}/

" Byte strings and chars
syn region rustByteString start=+b"+ skip=+\\\\\|\\"+ end=+"+ contains=rustEscape
syn match rustCharacter +'[^'\\]'+
syn match rustCharacter +'\\[nrt\\'"0]'+
syn match rustCharacter +'\\x[0-9a-fA-F]\{2}'+
syn match rustCharacter +'\\u{[0-9a-fA-F]\+}'+
syn match rustByteChar +b'[^'\\]'+
syn match rustByteChar +b'\\[nrt\\'"0]'+

" Numbers
syn match rustDecNumber "\<[0-9][0-9_]*\>"
syn match rustHexNumber "\<0x[0-9a-fA-F_]\+\>"
syn match rustOctNumber "\<0o[0-7_]\+\>"
syn match rustBinNumber "\<0b[01_]\+\>"
syn match rustFloat "\<[0-9][0-9_]*\.[0-9][0-9_]*\>"
syn match rustFloat "\<[0-9][0-9_]*\.[0-9][0-9_]*[eE][+-]\?[0-9_]\+\>"
syn match rustFloat "\<[0-9][0-9_]*[eE][+-]\?[0-9_]\+\>"

" Number type suffixes
syn match rustNumSuffix "\<[0-9][0-9_]*\(i8\|i16\|i32\|i64\|i128\|isize\|u8\|u16\|u32\|u64\|u128\|usize\|f32\|f64\)\>"

" Keywords
syn keyword rustKeyword as async await break const continue crate dyn
syn keyword rustKeyword else enum extern fn for if impl in let loop
syn keyword rustKeyword match mod move mut pub ref return
syn keyword rustKeyword static struct super trait type union unsafe
syn keyword rustKeyword use where while yield macro_rules

" Self
syn keyword rustSelf self Self

" Conditional
syn keyword rustConditional if else match

" Repeat
syn keyword rustRepeat for while loop

" Boolean
syn keyword rustBoolean true false

" Types
syn keyword rustType i8 i16 i32 i64 i128 isize
syn keyword rustType u8 u16 u32 u64 u128 usize
syn keyword rustType f32 f64 bool char str
syn keyword rustType String Vec HashMap HashSet
syn keyword rustType Box Rc Arc Option Result
syn keyword rustType Some None Ok Err
syn keyword rustType Cell RefCell Mutex Pin Future

" Traits
syn keyword rustTrait Display Debug Clone Copy Default
syn keyword rustTrait PartialEq Eq PartialOrd Ord Hash
syn keyword rustTrait Iterator IntoIterator From Into
syn keyword rustTrait TryFrom TryInto AsRef AsMut
syn keyword rustTrait Deref DerefMut Drop
syn keyword rustTrait Fn FnMut FnOnce
syn keyword rustTrait Send Sync Sized Unpin

" Macros
syn match rustMacro "\<\w\+!" contains=rustMacroName
syn keyword rustMacroName contained println print format vec todo
syn keyword rustMacroName contained unimplemented unreachable assert
syn keyword rustMacroName contained assert_eq assert_ne dbg cfg
syn keyword rustMacroName contained include concat stringify env
syn keyword rustMacroName contained panic eprintln write writeln

" Attributes
syn region rustAttribute start="#!\?\[" end="\]" contains=rustString,rustAttribute

" Lifetime
syn match rustLifetime /'\([a-zA-Z_][a-zA-Z0-9_]*\|static\)/

" Operators
syn match rustOperator /[-+%<>!&|^*=]=\?/
syn match rustOperator /::/
syn match rustOperator /->/
syn match rustOperator /=>/
syn match rustOperator /&&\|||/
syn match rustOperator /\.\./
syn match rustOperator /\.\.=/
syn match rustOperator /?/

" Functions
syn match rustFunction /\<\w\+\>\ze\s*(/
syn match rustFunction /\<\w\+\>\ze\s*::</

" Module paths
syn match rustModPath /\<\w\+\>::/

hi def link rustComment Comment
hi def link rustDocComment Comment
hi def link rustTodo Todo
hi def link rustString String
hi def link rustRawString String
hi def link rustByteString String
hi def link rustEscape Special
hi def link rustFmtStr Special
hi def link rustCharacter String
hi def link rustByteChar String
hi def link rustDecNumber Number
hi def link rustHexNumber Number
hi def link rustOctNumber Number
hi def link rustBinNumber Number
hi def link rustFloat Number
hi def link rustNumSuffix Type
hi def link rustKeyword Keyword
hi def link rustSelf Keyword
hi def link rustConditional Conditional
hi def link rustRepeat Repeat
hi def link rustBoolean Constant
hi def link rustType Type
hi def link rustTrait Type
hi def link rustMacro Function
hi def link rustMacroName Function
hi def link rustAttribute PreProc
hi def link rustLifetime Special
hi def link rustOperator Operator
hi def link rustFunction Function
hi def link rustModPath Identifier

let b:current_syntax = "rust"
