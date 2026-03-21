" Vim syntax file
" Language:    Common Lisp
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case ignore

" Comments
syn keyword lispTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region lispComment start=";" end="$" contains=lispTodo
syn region lispComment start="#|" end="|#" contains=lispTodo,lispComment

" String literals
syn region lispString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=lispEscape
syn match lispEscape contained +\\[\\'"abfnrtv]+

" Characters
syn match lispCharacter /#\\\w\+/
syn match lispCharacter /#\\./

" Numbers
syn match lispNumber "\<[+-]\?\d\+\>"
syn match lispNumber "\<[+-]\?\d\+\.\d*\>"
syn match lispNumber "\<[+-]\?\.\d\+\>"
syn match lispNumber "\<[+-]\?\d\+[eEdDfFlLsS][+-]\?\d\+\>"
syn match lispNumber "\<[+-]\?\d\+/\d\+\>"
syn match lispNumber "\<#[xX][0-9a-fA-F]\+\>"
syn match lispNumber "\<#[oO][0-7]\+\>"
syn match lispNumber "\<#[bB][01]\+\>"

" Keywords (symbol starting with colon)
syn match lispLabel /:\w[^ \t()"]*/

" Special forms and macros
syn keyword lispKeyword defun defmacro defgeneric defmethod defclass
syn keyword lispKeyword defvar defparameter defconstant defstruct defpackage
syn keyword lispKeyword deftype defsetf define-condition define-compiler-macro
syn keyword lispKeyword define-method-combination define-modify-macro
syn keyword lispKeyword define-setf-expander define-symbol-macro
syn keyword lispKeyword lambda let let* flet labels macrolet symbol-macrolet
syn keyword lispKeyword block return-from tagbody go catch throw unwind-protect
syn keyword lispKeyword progn prog1 prog2 if when unless cond case typecase
syn keyword lispKeyword ecase etypecase loop do do* dolist dotimes
syn keyword lispKeyword multiple-value-bind multiple-value-prog1
syn keyword lispKeyword the declare locally special ignore ignorable
syn keyword lispKeyword dynamic-extent type ftype inline notinline optimize
syn keyword lispKeyword speed safety space debug compilation-speed
syn keyword lispKeyword setf setq psetf psetq incf decf push pop pushnew
syn keyword lispKeyword rotatef shiftf
syn keyword lispKeyword with-open-file with-open-stream
syn keyword lispKeyword with-input-from-string with-output-to-string
syn keyword lispKeyword with-slots with-accessors
syn keyword lispKeyword handler-case handler-bind restart-case restart-bind
syn keyword lispKeyword with-simple-restart with-condition-restarts
syn keyword lispKeyword invoke-restart invoke-debugger signal error warn cerror
syn keyword lispKeyword assert check-type
syn keyword lispKeyword in-package use-package export import shadow
syn keyword lispKeyword shadowing-import require provide
syn keyword lispKeyword eval-when compile load eval funcall apply
syn keyword lispKeyword values multiple-value-list nth-value

" Conditional
syn keyword lispConditional if when unless cond case typecase ecase etypecase

" Repeat
syn keyword lispRepeat loop do do* dolist dotimes

" Statement
syn keyword lispStatement defun defmacro defmethod defgeneric setf setq return-from

" Exception
syn keyword lispException handler-case handler-bind restart-case catch throw
syn keyword lispException signal error warn cerror unwind-protect

" Types
syn keyword lispType t nil fixnum bignum integer ratio rational float
syn keyword lispType single-float double-float long-float short-float
syn keyword lispType real complex number character base-char standard-char
syn keyword lispType string base-string simple-string simple-base-string
syn keyword lispType symbol keyword package cons list null atom sequence
syn keyword lispType vector simple-vector bit-vector simple-bit-vector
syn keyword lispType array simple-array hash-table readtable
syn keyword lispType pathname logical-pathname stream file-stream
syn keyword lispType string-stream broadcast-stream concatenated-stream
syn keyword lispType two-way-stream echo-stream synonym-stream
syn keyword lispType function compiled-function generic-function
syn keyword lispType method method-combination standard-object structure-object
syn keyword lispType condition simple-condition serious-condition
syn keyword lispType simple-error type-error program-error control-error
syn keyword lispType cell-error unbound-variable undefined-function
syn keyword lispType arithmetic-error division-by-zero
syn keyword lispType floating-point-overflow floating-point-underflow
syn keyword lispType package-error stream-error end-of-file file-error
syn keyword lispType print-not-readable reader-error storage-condition
syn keyword lispType restart class standard-class built-in-class structure-class

" Built-in functions
syn keyword lispBuiltin car cdr cons list list* append nconc reverse nreverse
syn keyword lispBuiltin length nth nthcdr first second third fourth fifth
syn keyword lispBuiltin sixth seventh eighth ninth tenth rest last butlast nbutlast
syn keyword lispBuiltin mapcar mapcan mapc mapl maplist mapcon reduce
syn keyword lispBuiltin count find find-if find-if-not position position-if
syn keyword lispBuiltin remove remove-if remove-if-not delete delete-if
syn keyword lispBuiltin sort stable-sort merge substitute nsubstitute
syn keyword lispBuiltin search mismatch every some notevery notany
syn keyword lispBuiltin member assoc rassoc acons pairlis sublis
syn keyword lispBuiltin union intersection set-difference set-exclusive-or
syn keyword lispBuiltin subsetp adjoin copy-list copy-tree tree-equal
syn keyword lispBuiltin mod rem floor ceiling truncate round max min abs
syn keyword lispBuiltin gcd lcm expt exp log sqrt isqrt
syn keyword lispBuiltin sin cos tan asin acos atan sinh cosh tanh
syn keyword lispBuiltin asinh acosh atanh float rational rationalize
syn keyword lispBuiltin numerator denominator realpart imagpart conjugate phase
syn keyword lispBuiltin random make-random-state
syn keyword lispBuiltin zerop plusp minusp evenp oddp numberp integerp
syn keyword lispBuiltin rationalp realp floatp complexp
syn keyword lispBuiltin eq eql equal equalp not
syn keyword lispBuiltin char= char/= char< char> string= string/= string< string>
syn keyword lispBuiltin string-equal string-upcase string-downcase string-capitalize
syn keyword lispBuiltin string-trim string-left-trim string-right-trim
syn keyword lispBuiltin concatenate subseq char schar make-string
syn keyword lispBuiltin char-code code-char char-name name-char
syn keyword lispBuiltin digit-char digit-char-p alpha-char-p
syn keyword lispBuiltin upper-case-p lower-case-p both-case-p
syn keyword lispBuiltin char-upcase char-downcase
syn keyword lispBuiltin format prin1 princ print pprint write
syn keyword lispBuiltin write-to-string prin1-to-string princ-to-string
syn keyword lispBuiltin read read-from-string read-line read-char peek-char
syn keyword lispBuiltin unread-char read-byte write-byte
syn keyword lispBuiltin open close with-open-file pathname make-pathname
syn keyword lispBuiltin merge-pathnames namestring file-namestring
syn keyword lispBuiltin directory-namestring enough-namestring parse-namestring
syn keyword lispBuiltin truename probe-file delete-file rename-file
syn keyword lispBuiltin file-write-date file-author directory ensure-directories-exist
syn keyword lispBuiltin make-hash-table gethash remhash maphash
syn keyword lispBuiltin hash-table-count hash-table-size clrhash sxhash
syn keyword lispBuiltin make-instance slot-value slot-boundp
syn keyword lispBuiltin initialize-instance shared-initialize
syn keyword lispBuiltin print-object describe-object
syn keyword lispBuiltin make-condition

" Constants
syn keyword lispConstant t nil most-positive-fixnum most-negative-fixnum
syn keyword lispConstant pi most-positive-single-float most-negative-single-float
syn keyword lispConstant most-positive-double-float most-negative-double-float

" Special operators
syn match lispSpecial /'/
syn match lispSpecial /`/
syn match lispSpecial /,@\?/
syn match lispSpecial /#'/

" Reader macros
syn match lispPreProc /#\+\w\+/
syn match lispPreProc /#-\w\+/
syn match lispPreProc /#\.\w\+/

" Parentheses
syn match lispSpecial /[()]/

hi def link lispComment Comment
hi def link lispTodo Todo
hi def link lispString String
hi def link lispEscape Special
hi def link lispCharacter String
hi def link lispNumber Number
hi def link lispLabel Label
hi def link lispKeyword Keyword
hi def link lispConditional Conditional
hi def link lispRepeat Repeat
hi def link lispStatement Statement
hi def link lispException Exception
hi def link lispType Type
hi def link lispBuiltin Function
hi def link lispConstant Constant
hi def link lispSpecial Special
hi def link lispPreProc PreProc

let b:current_syntax = "lisp"
