" Vim syntax file
" Language:    C++
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn match cppComment "//.*$" contains=cppTodo
syn region cppComment start="/\*" end="\*/" contains=cppTodo
syn keyword cppTodo contained TODO FIXME XXX NOTE HACK BUG

" Strings
syn region cppString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=cppEscape
syn region cppCharacter start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=cppEscape

" Raw strings (C++11)
syn region cppRawString start=+R"[^(]*\z((+ end=+)\z1"+

" Escape sequences
syn match cppEscape contained "\\[\\nrtfabe0'\""]"
syn match cppEscape contained "\\x[0-9a-fA-F]\{1,2}"
syn match cppEscape contained "\\u[0-9a-fA-F]\{4}"
syn match cppEscape contained "\\U[0-9a-fA-F]\{8}"
syn match cppEscape contained "\\[0-7]\{1,3}"

" Numbers
syn match cppNumber "\<\d\+[uUlL]*\>"
syn match cppNumber "\<\d\+\.\d*[fFlL]*\>"
syn match cppNumber "\<\d*\.\d\+[fFlL]*\>"
syn match cppNumber "\<\d\+[eE][+-]\?\d\+[fFlL]*\>"
syn match cppNumber "\<\d\+\.\d*[eE][+-]\?\d\+[fFlL]*\>"
syn match cppNumber "\<0x[0-9a-fA-F]\+[uUlL]*\>"
syn match cppNumber "\<0b[01]\+[uUlL]*\>"
syn match cppNumber "\<0[0-7]\+[uUlL]*\>"
syn match cppNumber "\<\d[0-9']*\d[uUlL]*\>"

" Preprocessor
syn match cppPreProc "^\s*#\s*include\>"
syn match cppPreProc "^\s*#\s*define\>"
syn match cppPreProc "^\s*#\s*undef\>"
syn match cppPreProc "^\s*#\s*ifdef\>"
syn match cppPreProc "^\s*#\s*ifndef\>"
syn match cppPreProc "^\s*#\s*if\>"
syn match cppPreProc "^\s*#\s*elif\>"
syn match cppPreProc "^\s*#\s*else\>"
syn match cppPreProc "^\s*#\s*endif\>"
syn match cppPreProc "^\s*#\s*pragma\>"
syn match cppPreProc "^\s*#\s*error\>"
syn match cppPreProc "^\s*#\s*warning\>"
syn match cppPreProc "^\s*#\s*line\>"

" C keywords (inherited)
syn keyword cppKeyword auto break case continue default do else for goto
syn keyword cppKeyword if return sizeof static switch while
syn keyword cppKeyword const extern inline register restrict volatile
syn keyword cppKeyword typedef struct union enum

" C++ keywords
syn keyword cppKeyword class namespace template typename using
syn keyword cppKeyword try catch throw new delete
syn keyword cppKeyword virtual override final explicit friend
syn keyword cppKeyword constexpr consteval constinit
syn keyword cppKeyword concept requires co_await co_yield co_return
syn keyword cppKeyword noexcept nullptr auto decltype
syn keyword cppKeyword static_assert alignas alignof thread_local
syn keyword cppKeyword mutable export module import
syn keyword cppKeyword public private protected operator
syn keyword cppKeyword typeid dynamic_cast static_cast reinterpret_cast const_cast

" Conditional
syn keyword cppConditional if else switch case default

" Repeat
syn keyword cppRepeat for while do

" Statement
syn keyword cppStatement return break continue goto throw

" Exception
syn keyword cppException try catch throw noexcept

" Operators (word-based)
syn keyword cppOperator new delete sizeof typeid alignof decltype noexcept
syn keyword cppOperator and or not and_eq or_eq not_eq xor xor_eq
syn keyword cppOperator bitand bitor compl

" C types (inherited)
syn keyword cppType void int char short long float double signed unsigned
syn keyword cppType size_t ssize_t ptrdiff_t
syn keyword cppType int8_t int16_t int32_t int64_t
syn keyword cppType uint8_t uint16_t uint32_t uint64_t
syn keyword cppType intptr_t uintptr_t intmax_t uintmax_t
syn keyword cppType FILE DIR
syn keyword cppType pid_t uid_t gid_t off_t mode_t time_t

" C++ types
syn keyword cppType bool wchar_t char8_t char16_t char32_t
syn keyword cppType nullptr_t

" STL types (without std:: prefix)
syn keyword cppType string wstring string_view
syn keyword cppType vector list deque array forward_list
syn keyword cppType map multimap unordered_map unordered_multimap
syn keyword cppType set multiset unordered_set unordered_multiset
syn keyword cppType queue stack priority_queue
syn keyword cppType pair tuple optional variant any
syn keyword cppType shared_ptr unique_ptr weak_ptr
syn keyword cppType span bitset valarray complex
syn keyword cppType function bind reference_wrapper
syn keyword cppType thread mutex recursive_mutex lock_guard unique_lock shared_lock
syn keyword cppType condition_variable future promise async
syn keyword cppType atomic atomic_flag
syn keyword cppType initializer_list type_info
syn keyword cppType istream ostream iostream fstream ifstream ofstream
syn keyword cppType stringstream istringstream ostringstream
syn keyword cppType streambuf filebuf stringbuf
syn keyword cppType regex smatch

" std:: qualified types
syn match cppStdType "\<std::\w\+"

" Constants
syn keyword cppConstant NULL nullptr true false
syn keyword cppConstant EOF BUFSIZ
syn keyword cppConstant EXIT_SUCCESS EXIT_FAILURE
syn keyword cppConstant STDIN_FILENO STDOUT_FILENO STDERR_FILENO

" C++ standard library objects
syn keyword cppBuiltin cout cin cerr clog endl
syn keyword cppBuiltin npos

" C standard library functions (inherited)
syn keyword cppBuiltin printf fprintf sprintf snprintf
syn keyword cppBuiltin scanf fscanf sscanf
syn keyword cppBuiltin puts fputs putchar fputc
syn keyword cppBuiltin fgets getchar fgetc
syn keyword cppBuiltin fopen fclose fflush
syn keyword cppBuiltin fread fwrite fseek ftell rewind feof ferror
syn keyword cppBuiltin malloc calloc realloc free
syn keyword cppBuiltin atoi atol atof strtol strtoul strtod
syn keyword cppBuiltin strlen strcmp strncmp strcpy strncpy strcat strncat
syn keyword cppBuiltin strchr strrchr strstr strtok
syn keyword cppBuiltin memcpy memmove memset memcmp memchr
syn keyword cppBuiltin abs labs
syn keyword cppBuiltin rand srand exit atexit abort
syn keyword cppBuiltin qsort bsearch
syn keyword cppBuiltin sin cos tan asin acos atan atan2
syn keyword cppBuiltin sqrt pow log log10 exp
syn keyword cppBuiltin ceil floor round fabs fmod
syn keyword cppBuiltin time localtime gmtime strftime
syn keyword cppBuiltin assert

" STL algorithms and utilities
syn keyword cppBuiltin sort stable_sort partial_sort nth_element
syn keyword cppBuiltin find find_if find_if_not find_first_of
syn keyword cppBuiltin count count_if search binary_search
syn keyword cppBuiltin lower_bound upper_bound equal_range
syn keyword cppBuiltin transform for_each copy copy_if copy_n
syn keyword cppBuiltin move move_backward swap swap_ranges fill fill_n
syn keyword cppBuiltin replace replace_if replace_copy remove remove_if
syn keyword cppBuiltin unique reverse rotate shuffle
syn keyword cppBuiltin min max min_element max_element minmax minmax_element
syn keyword cppBuiltin accumulate inner_product partial_sum adjacent_difference
syn keyword cppBuiltin reduce transform_reduce
syn keyword cppBuiltin all_of any_of none_of
syn keyword cppBuiltin distance advance next prev
syn keyword cppBuiltin begin end cbegin cend rbegin rend
syn keyword cppBuiltin make_pair make_tuple make_shared make_unique
syn keyword cppBuiltin forward move static_pointer_cast dynamic_pointer_cast
syn keyword cppBuiltin get tie ignore
syn keyword cppBuiltin to_string stoi stol stoll stof stod stold
syn keyword cppBuiltin getline

" Streams
syn keyword cppBuiltin stdin stdout stderr

" Highlighting links
hi def link cppComment Comment
hi def link cppTodo Todo
hi def link cppString String
hi def link cppCharacter String
hi def link cppRawString String
hi def link cppEscape Special
hi def link cppNumber Number
hi def link cppPreProc PreProc
hi def link cppKeyword Keyword
hi def link cppConditional Conditional
hi def link cppRepeat Repeat
hi def link cppStatement Statement
hi def link cppException Exception
hi def link cppOperator Operator
hi def link cppType Type
hi def link cppStdType Type
hi def link cppConstant Constant
hi def link cppBuiltin Function

let b:current_syntax = "cpp"
