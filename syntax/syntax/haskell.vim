" Vim syntax file
" Language:    Haskell
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn match hsComment "--.*$" contains=hsTodo
syn region hsBlockComment start="{-" end="-}" contains=hsBlockComment,hsTodo
syn keyword hsTodo contained TODO FIXME XXX NOTE HACK BUG

" Pragmas
syn region hsPragma start="{-#" end="#-}"

" Strings
syn region hsString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=hsEscape
syn match hsChar +'[^\\]'+
syn match hsChar +'\\[\\'"abfnrtv0]'+
syn match hsChar +'\\[0-9]\+'+
syn match hsChar +'\\o[0-7]\+'+
syn match hsChar +'\\x[0-9a-fA-F]\+'+
syn match hsEscape +\\[\\'"abfnrtv0&]+ contained
syn match hsEscape +\\[0-9]\++ contained
syn match hsEscape +\\o[0-7]\++ contained
syn match hsEscape +\\x[0-9a-fA-F]\++ contained
syn match hsEscape +\\NUL\|\\SOH\|\\STX\|\\ETX\|\\EOT\|\\ENQ\|\\ACK\|\\BEL+ contained
syn match hsEscape +\\BS\|\\HT\|\\LF\|\\VT\|\\FF\|\\CR\|\\SO\|\\SI+ contained
syn match hsEscape +\\DLE\|\\DC1\|\\DC2\|\\DC3\|\\DC4\|\\NAK\|\\SYN\|\\ETB+ contained
syn match hsEscape +\\CAN\|\\EM\|\\SUB\|\\ESC\|\\FS\|\\GS\|\\RS\|\\US\|\\SP\|\\DEL+ contained
syn match hsEscape +\\^[@A-Z\[\\\]\^_]+ contained

" Numbers
syn match hsNumber +\<\d\++
syn match hsNumber +\<\d\+\.\d\+\([eE][-+]\?\d\+\)\?+
syn match hsNumber +\<0[xX][0-9a-fA-F]\++
syn match hsNumber +\<0[oO][0-7]\++
syn match hsNumber +\<0[bB][01]\++

" Keywords
syn keyword hsKeyword case class data default deriving do else forall
syn keyword hsKeyword foreign hiding if import in infix infixl infixr
syn keyword hsKeyword instance let module newtype of qualified then
syn keyword hsKeyword type where family pattern role
syn keyword hsConditional if then else case of
syn keyword hsStatement module import where let in do

" Special keywords
syn keyword hsKeyword as hiding qualified

" Boolean and special constants
syn keyword hsConstant True False
syn keyword hsConstant Nothing Just
syn keyword hsConstant Left Right
syn keyword hsConstant LT GT EQ
syn keyword hsConstant otherwise

" Types
syn match hsType +\<[A-Z]\w*+
syn keyword hsType Bool Char Double Float Int Integer IO Maybe Either
syn keyword hsType String Ordering Rational Word IORef MVar STRef
syn keyword hsType Map Set Seq Vector Text ByteString Array Void

" Typeclasses
syn keyword hsTypeclass Eq Ord Show Read Enum Bounded Num Integral
syn keyword hsTypeclass Fractional Floating RealFloat Functor Applicative
syn keyword hsTypeclass Monad MonadIO MonadTrans Foldable Traversable
syn keyword hsTypeclass Semigroup Monoid Alternative MonadPlus

" Builtins
syn keyword hsBuiltin map filter foldl foldr scanl scanr head tail init last
syn keyword hsBuiltin length null reverse concat concatMap zip zipWith unzip
syn keyword hsBuiltin take drop takeWhile dropWhile span elem notElem lookup
syn keyword hsBuiltin maximum minimum sum product any all iterate repeat
syn keyword hsBuiltin replicate cycle words unwords lines unlines show read
syn keyword hsBuiltin print putStr putStrLn getLine getChar readFile writeFile
syn keyword hsBuiltin appendFile interact error undefined seq id const flip
syn keyword hsBuiltin curry uncurry fst snd not maybe either fromIntegral
syn keyword hsBuiltin toInteger fromInteger negate abs signum div mod rem quot
syn keyword hsBuiltin succ pred enumFrom enumFromTo enumFromThen enumFromThenTo
syn keyword hsBuiltin return pure fmap sequence mapM forM when unless

" Operators
syn match hsOperator +[-!#$%&*+./<=>?@\\^|~:]\++
syn match hsOperator +`\w\+`+
syn match hsSpecialOp +::+
syn match hsSpecialOp +=>\?+
syn match hsSpecialOp +->+
syn match hsSpecialOp +<-+
syn match hsSpecialOp +\\+
syn match hsSpecialOp +|+
syn match hsSpecialOp +@+
syn match hsSpecialOp +\~+
syn match hsSpecialOp +_+

" Type signatures
syn match hsTypeSig +^\s*\w\+\s*::+ contains=hsSpecialOp

" Module qualified names
syn match hsModule +\<[A-Z]\w*\.+

" CPP directives (common in Haskell)
syn match hsPreProc +^#\s*\(if\|ifdef\|ifndef\|else\|elif\|endif\|define\|undef\|include\|error\|warning\|line\|pragma\)\>+

" Highlighting
hi def link hsComment Comment
hi def link hsBlockComment Comment
hi def link hsTodo Todo
hi def link hsPragma PreProc
hi def link hsString String
hi def link hsChar String
hi def link hsEscape Special
hi def link hsNumber Number
hi def link hsKeyword Keyword
hi def link hsConditional Conditional
hi def link hsStatement Statement
hi def link hsConstant Constant
hi def link hsType Type
hi def link hsTypeclass Type
hi def link hsBuiltin Function
hi def link hsOperator Operator
hi def link hsSpecialOp Operator
hi def link hsTypeSig Function
hi def link hsModule Identifier
hi def link hsPreProc PreProc

let b:current_syntax = "haskell"
