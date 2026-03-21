" Vim syntax file
" Language:    C#
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword csTodo TODO FIXME XXX NOTE HACK BUG contained
syn match csLineComment "//.*$" contains=csTodo
syn region csBlockComment start="/\*" end="\*/" contains=csTodo

" XML doc comments
syn region csXmlComment start="///.*$"lc=3 end="$" contains=csTodo,csXmlTag
syn match csXmlTag "<[/!]\?\w\+[^>]*>" contained

" Strings
syn region csString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=csEscape
syn region csVerbatimString start=+@"+ end=+""+me=e-1 end=+"[^"]+me=e-1
syn region csInterpolatedString start=+\$"+ skip=+\\\\\|\\"+ end=+"+ contains=csEscape,csInterpolation
syn region csInterpolation start=+{+ end=+}+ contained contains=csString,csNumber,csKeyword
syn match csChar "'[^'\\]'"
syn match csChar "'\\[nrt\\'"0abfv]'"
syn match csChar "'\\u[0-9a-fA-F]\{4}'"
syn match csEscape "\\[nrt\\\"'0abfv]" contained
syn match csEscape "\\u[0-9a-fA-F]\{4}" contained
syn match csEscape "\\x[0-9a-fA-F]\{1,4}" contained

" Numbers
syn match csNumber "\<\d\+[lLuU]*\>"
syn match csNumber "\<0[xX][0-9a-fA-F]\+[lLuU]*\>"
syn match csNumber "\<0[bB][01]\+[lLuU]*\>"
syn match csNumber "\<\d\+\.\d*\([eE][+-]\?\d\+\)\?[fFdDmM]\?\>"
syn match csNumber "\<\.\d\+\([eE][+-]\?\d\+\)\?[fFdDmM]\?\>"
syn match csNumber "\<\d\+[eE][+-]\?\d\+[fFdDmM]\?\>"
syn match csNumber "\<\d\+[fFdDmM]\>"

" Keywords
syn keyword csKeyword abstract as base break byte case catch checked class const
syn keyword csKeyword continue decimal default delegate do double else enum event
syn keyword csKeyword explicit extern finally fixed for foreach goto if implicit in
syn keyword csKeyword interface internal is lock long namespace new operator out
syn keyword csKeyword override params private protected public readonly record ref
syn keyword csKeyword return sbyte sealed short sizeof stackalloc static struct switch
syn keyword csKeyword this throw try typeof uint ulong unchecked unsafe ushort using
syn keyword csKeyword var virtual void volatile while yield async await dynamic global
syn keyword csKeyword init nint nuint required scoped file when and or not with
syn keyword csKeyword managed unmanaged

" Conditional / Repeat / Exception
syn keyword csConditional if else switch case default when
syn keyword csRepeat for foreach while do
syn keyword csException try catch finally throw

" Boolean / Null
syn keyword csConstant true false null

" Types
syn keyword csType bool byte char decimal double float int long object sbyte short
syn keyword csType string uint ulong ushort void var dynamic nint nuint

" Framework types
syn keyword csFrameworkType String Int32 Int64 Double Boolean Object List Dictionary
syn keyword csFrameworkType HashSet Queue Stack Array Task Func Action IEnumerable
syn keyword csFrameworkType IList IDictionary Tuple ValueTuple Span Memory Nullable
syn keyword csFrameworkType Exception ArgumentException InvalidOperationException Console
syn keyword csFrameworkType Math File Path Directory Stream StringBuilder Regex DateTime
syn keyword csFrameworkType TimeSpan Guid CancellationToken HttpClient

" Builtins / common method calls
syn match csBuiltin "Console\.WriteLine\|Console\.ReadLine"
syn match csBuiltin "Math\.Max\|Math\.Min\|Math\.Abs\|Math\.Round"
syn match csBuiltin "Math\.Floor\|Math\.Ceiling\|Math\.Pow\|Math\.Sqrt"
syn match csBuiltin "String\.Format\|String\.Join\|String\.IsNullOrEmpty\|String\.IsNullOrWhiteSpace"
syn match csBuiltin "Convert\.ToInt32\|Convert\.ToString"
syn match csBuiltin "Int32\.Parse\|Int32\.TryParse"
syn match csBuiltin "Enumerable\.Range\|Enumerable\.Select\|Enumerable\.Where"
syn match csBuiltin "Task\.Run\|Task\.WhenAll\|Task\.WhenAny\|Task\.Delay"
syn match csBuiltin "File\.ReadAllText\|File\.WriteAllText"
syn match csBuiltin "Path\.Combine"
syn match csBuiltin "Directory\.GetFiles"

" LINQ
syn keyword csLinq from where select orderby group into join on equals ascending
syn keyword csLinq descending let

" Preprocessor
syn region csPreProc start="^\s*#" end="$" keepend
syn match csPreProc "^\s*#\s*\(if\|else\|elif\|endif\|define\|undef\|region\|endregion\|pragma\|nullable\)\>"

" Operators
syn match csOperator "[-+*/%&|^~<>=!?:]"
syn match csOperator "=>"
syn match csOperator "->"
syn match csOperator "\.\."
syn match csOperator "??"
syn match csOperator "??="
syn match csOperator "?\."

" Attributes
syn region csAttribute start="\[" end="\]" contains=csString,csNumber

" Highlighting
hi def link csTodo Todo
hi def link csLineComment Comment
hi def link csBlockComment Comment
hi def link csXmlComment Comment
hi def link csXmlTag Special
hi def link csString String
hi def link csVerbatimString String
hi def link csInterpolatedString String
hi def link csChar String
hi def link csEscape Special
hi def link csNumber Number
hi def link csKeyword Keyword
hi def link csConditional Conditional
hi def link csRepeat Repeat
hi def link csException Exception
hi def link csConstant Constant
hi def link csType Type
hi def link csFrameworkType Type
hi def link csBuiltin Function
hi def link csLinq Statement
hi def link csPreProc PreProc
hi def link csOperator Operator
hi def link csAttribute Label

let b:current_syntax = "cs"
