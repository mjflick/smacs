" Vim syntax file
" Language:    Python
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn match pythonComment "#.*$" contains=pythonTodo
syn keyword pythonTodo contained TODO FIXME XXX NOTE HACK BUG

" Docstrings (triple-quoted strings used as documentation)
syn region pythonDocstring start=+"""+ end=+"""+ contains=pythonEscape,pythonInterp,pythonTodo
syn region pythonDocstring start=+'''+ end=+'''+ contains=pythonEscape,pythonTodo

" Strings
syn region pythonString start=+"""+ end=+"""+ contains=pythonEscape,pythonInterp
syn region pythonString start=+'''+ end=+'''+ contains=pythonEscape
syn region pythonString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=pythonEscape,pythonInterp
syn region pythonString start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=pythonEscape

" f-strings
syn region pythonFString start=+f"+ skip=+\\\\\|\\"+ end=+"+ contains=pythonEscape,pythonFStringExpr
syn region pythonFString start=+f'+ skip=+\\\\\|\\'+ end=+'+ contains=pythonEscape,pythonFStringExpr
syn region pythonFString start=+f"""+ end=+"""+ contains=pythonEscape,pythonFStringExpr
syn region pythonFString start=+f'''+ end=+'''+ contains=pythonEscape,pythonFStringExpr
syn region pythonFStringExpr contained start=+{+ end=+}+ contains=pythonBuiltin,pythonKeyword,pythonNumber

" r-strings (raw)
syn region pythonRawString start=+r"+ skip=+\\\\\|\\"+ end=+"+
syn region pythonRawString start=+r'+ skip=+\\\\\|\\'+ end=+'+
syn region pythonRawString start=+r"""+ end=+"""+
syn region pythonRawString start=+r'''+ end=+'''+

" b-strings (bytes)
syn region pythonBytesString start=+b"+ skip=+\\\\\|\\"+ end=+"+ contains=pythonEscape
syn region pythonBytesString start=+b'+ skip=+\\\\\|\\'+ end=+'+ contains=pythonEscape
syn region pythonBytesString start=+b"""+ end=+"""+ contains=pythonEscape
syn region pythonBytesString start=+b'''+ end=+'''+ contains=pythonEscape

" rb/br strings
syn region pythonRawString start=+rb"+ skip=+\\\\\|\\"+ end=+"+
syn region pythonRawString start=+rb'+ skip=+\\\\\|\\'+ end=+'+
syn region pythonRawString start=+br"+ skip=+\\\\\|\\"+ end=+"+
syn region pythonRawString start=+br'+ skip=+\\\\\|\\'+ end=+'+

" Escape sequences
syn match pythonEscape contained "\\[\\nrtfabe0'\""]"
syn match pythonEscape contained "\\x[0-9a-fA-F]\{2}"
syn match pythonEscape contained "\\u[0-9a-fA-F]\{4}"
syn match pythonEscape contained "\\U[0-9a-fA-F]\{8}"
syn match pythonEscape contained "\\N{[^}]*}"
syn match pythonEscape contained "\\[0-7]\{1,3}"

" String interpolation (in double-quoted and f-strings)
syn match pythonInterp contained "{\w\+}"

" Numbers
syn match pythonNumber "\<\d\+\>"
syn match pythonNumber "\<\d\+\.\d*\>"
syn match pythonNumber "\<\d*\.\d\+\>"
syn match pythonNumber "\<\d\+[eE][+-]\?\d\+\>"
syn match pythonNumber "\<\d\+\.\d*[eE][+-]\?\d\+\>"
syn match pythonNumber "\<0x[0-9a-fA-F]\+\>"
syn match pythonNumber "\<0b[01]\+\>"
syn match pythonNumber "\<0o[0-7]\+\>"
syn match pythonNumber "\<\d\+[jJ]\>"
syn match pythonNumber "\<\d\+\.\d*[jJ]\>"

" Keywords
syn keyword pythonKeyword def class if elif else for while try except finally
syn keyword pythonKeyword with as import from return yield lambda pass
syn keyword pythonKeyword break continue raise global nonlocal async await
syn keyword pythonKeyword assert del in is not and or match case

" Conditional
syn keyword pythonConditional if elif else

" Repeat
syn keyword pythonRepeat for while

" Statement
syn keyword pythonStatement return yield pass break continue raise
syn keyword pythonStatement import from as global nonlocal del assert

" Exception
syn keyword pythonException try except finally raise

" Operators (word-based)
syn keyword pythonOperator and or not in is lambda

" Types and constants
syn keyword pythonType int float str bool list dict tuple set frozenset
syn keyword pythonType bytes bytearray complex type object range
syn keyword pythonType enumerate zip map filter memoryview

" Constants
syn keyword pythonConstant None True False NotImplemented Ellipsis
syn keyword pythonConstant __name__ __main__ __file__ __doc__ __all__
syn keyword pythonConstant __init__ __del__ __repr__ __str__ __len__
syn keyword pythonConstant __getitem__ __setitem__ __delitem__ __iter__ __next__
syn keyword pythonConstant __enter__ __exit__ __call__ __eq__ __hash__
syn keyword pythonConstant __lt__ __gt__ __le__ __ge__ __ne__
syn keyword pythonConstant __add__ __sub__ __mul__ __truediv__ __floordiv__
syn keyword pythonConstant __mod__ __pow__ __and__ __or__ __xor__
syn keyword pythonConstant __contains__ __bool__ __int__ __float__

" Built-in functions
syn keyword pythonBuiltin print len range enumerate zip map filter
syn keyword pythonBuiltin sorted reversed min max sum abs round
syn keyword pythonBuiltin any all isinstance issubclass hasattr getattr setattr delattr
syn keyword pythonBuiltin id hash hex oct bin chr ord repr type super
syn keyword pythonBuiltin property classmethod staticmethod
syn keyword pythonBuiltin open input format iter next
syn keyword pythonBuiltin vars dir globals locals eval exec compile __import__
syn keyword pythonBuiltin callable breakpoint memoryview
syn keyword pythonBuiltin frozenset set dict list tuple int float str bool bytes bytearray complex
syn keyword pythonBuiltin slice object ascii divmod pow
syn keyword pythonBuiltin map filter zip enumerate reversed sorted

" Built-in exceptions
syn keyword pythonException Exception BaseException
syn keyword pythonException TypeError ValueError KeyError IndexError AttributeError
syn keyword pythonException NameError RuntimeError StopIteration StopAsyncIteration
syn keyword pythonException OSError IOError FileNotFoundError PermissionError
syn keyword pythonException ImportError ModuleNotFoundError
syn keyword pythonException ZeroDivisionError OverflowError FloatingPointError
syn keyword pythonException SyntaxError IndentationError TabError
syn keyword pythonException SystemExit KeyboardInterrupt GeneratorExit
syn keyword pythonException AssertionError NotImplementedError RecursionError
syn keyword pythonException MemoryError BufferError
syn keyword pythonException UnicodeError UnicodeDecodeError UnicodeEncodeError
syn keyword pythonException ConnectionError TimeoutError
syn keyword pythonException Warning DeprecationWarning FutureWarning UserWarning

" Decorators
syn match pythonDecorator "@\w\+\(\.\w\+\)*"

" Self and cls
syn keyword pythonSelf self cls

" Function and class definitions
syn match pythonFuncDef "\<def\s\+[a-zA-Z_][a-zA-Z0-9_]*" contains=pythonKeyword
syn match pythonClassDef "\<class\s\+[a-zA-Z_][a-zA-Z0-9_]*" contains=pythonKeyword

" Highlighting links
hi def link pythonComment Comment
hi def link pythonTodo Todo
hi def link pythonDocstring Comment
hi def link pythonString String
hi def link pythonFString String
hi def link pythonFStringExpr Special
hi def link pythonRawString String
hi def link pythonBytesString String
hi def link pythonEscape Special
hi def link pythonInterp Special
hi def link pythonNumber Number
hi def link pythonKeyword Keyword
hi def link pythonConditional Conditional
hi def link pythonRepeat Repeat
hi def link pythonStatement Statement
hi def link pythonException Exception
hi def link pythonOperator Operator
hi def link pythonType Type
hi def link pythonConstant Constant
hi def link pythonBuiltin Function
hi def link pythonDecorator PreProc
hi def link pythonSelf Identifier
hi def link pythonFuncDef Function
hi def link pythonClassDef Function

let b:current_syntax = "python"
