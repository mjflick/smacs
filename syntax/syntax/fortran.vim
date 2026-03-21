" Vim syntax file
" Language:    Fortran
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case ignore

" Comments
syn match fortranComment "!.*$" contains=fortranTodo
syn match fortranComment "^[cC*].*$" contains=fortranTodo
syn keyword fortranTodo contained TODO FIXME XXX NOTE HACK BUG

" Strings
syn region fortranString start=+"+ end=+"+ skip=+\\"+
syn region fortranString start=+'+ end=+'+ skip=+\\'+

" Numbers
syn match fortranNumber "\<\d\+\>"
syn match fortranNumber "\<\d\+\.\d*\([dDeE][+-]\?\d\+\)\?\>"
syn match fortranNumber "\.\d\+\([dDeE][+-]\?\d\+\)\?\>"
syn match fortranNumber "\<\d\+[dDeE][+-]\?\d\+\>"
syn match fortranNumber "\<[bB]'[01]\+'\>"
syn match fortranNumber "\<[oO]'[0-7]\+'\>"
syn match fortranNumber "\<[zZ]'[0-9a-fA-F]\+'\>"

" Boolean
syn keyword fortranBoolean .true. .false.

" Operators
syn match fortranOperator "\.\(eq\|ne\|lt\|le\|gt\|ge\|and\|or\|not\|eqv\|neqv\)\."

" Program structure keywords
syn keyword fortranKeyword program end subroutine function module use implicit none
syn keyword fortranKeyword intent in out inout call return stop contains
syn keyword fortranKeyword interface abstract extends procedure associate
syn keyword fortranKeyword block critical concurrent forall where elsewhere
syn keyword fortranKeyword allocate deallocate nullify
syn keyword fortranKeyword open close read write print format rewind backspace
syn keyword fortranKeyword endfile inquire namelist common equivalence
syn keyword fortranKeyword data save parameter dimension allocatable
syn keyword fortranKeyword pointer target optional value volatile protected
syn keyword fortranKeyword sequence private public external intrinsic
syn keyword fortranKeyword recursive pure elemental impure result only
syn keyword fortranKeyword operator assignment generic final non_overridable
syn keyword fortranKeyword deferred enum enumerator bind import entry

" Conditionals
syn keyword fortranConditional if then else elseif endif select case default

" Loops
syn keyword fortranRepeat do while enddo go to continue exit cycle

" Types
syn keyword fortranType integer real double precision complex character logical
syn keyword fortranType type class

" Intrinsic functions
syn keyword fortranFunction abs aimag aint anint ceiling cmplx conjg dble dim dprod
syn keyword fortranFunction floor int max min mod modulo nint real sign
syn keyword fortranFunction achar adjustl adjustr char iachar ichar index len len_trim
syn keyword fortranFunction lge lgt lle llt repeat scan trim verify
syn keyword fortranFunction acos asin atan atan2 cos cosh exp log log10
syn keyword fortranFunction sin sinh sqrt tan tanh
syn keyword fortranFunction dot_product matmul transpose maxval minval product sum
syn keyword fortranFunction count any all merge pack unpack reshape spread
syn keyword fortranFunction cshift eoshift size shape lbound ubound
syn keyword fortranFunction allocated associated present kind
syn keyword fortranFunction selected_int_kind selected_real_kind transfer
syn keyword fortranFunction huge tiny epsilon precision range radix digits
syn keyword fortranFunction maxexponent minexponent nearest spacing rrspacing
syn keyword fortranFunction scale set_exponent fraction exponent
syn keyword fortranFunction bit_size btest iand ior ieor ibclr ibset ishft ishftc not mvbits
syn keyword fortranFunction date_and_time system_clock cpu_time
syn keyword fortranFunction random_number random_seed
syn keyword fortranFunction command_argument_count get_command_argument
syn keyword fortranFunction get_environment_variable

" Preprocessor
syn match fortranPreProc "^#\s*\(include\|define\|undef\|if\|ifdef\|ifndef\|else\|elif\|endif\)\>"

hi def link fortranComment Comment
hi def link fortranTodo Todo
hi def link fortranString String
hi def link fortranNumber Number
hi def link fortranBoolean Constant
hi def link fortranOperator Operator
hi def link fortranKeyword Keyword
hi def link fortranConditional Conditional
hi def link fortranRepeat Repeat
hi def link fortranType Type
hi def link fortranFunction Function
hi def link fortranPreProc PreProc

let b:current_syntax = "fortran"
