" Vim syntax file
" Language:    C
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn match cComment "//.*$" contains=cTodo
syn region cComment start="/\*" end="\*/" contains=cTodo
syn keyword cTodo contained TODO FIXME XXX NOTE HACK BUG

" Strings
syn region cString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=cEscape
syn region cCharacter start=+'+ skip=+\\\\\|\\'+ end=+'+
syn match cEscape contained "\\[\\nrtfabe0'""]"
syn match cEscape contained "\\x[0-9a-fA-F]\{1,2}"
syn match cEscape contained "\\[0-7]\{1,3}"

" Numbers
syn match cNumber "\<\d\+[uUlL]*\>"
syn match cNumber "\<\d\+\.\d\+[fFlL]*\>"
syn match cNumber "\<\d\+\.\d\+[eE][+-]\?\d\+[fFlL]*\>"
syn match cNumber "\<0x[0-9a-fA-F]\+[uUlL]*\>"
syn match cNumber "\<0b[01]\+[uUlL]*\>"
syn match cNumber "\<0[0-7]\+[uUlL]*\>"

" Preprocessor
syn match cPreProc "^\s*#\s*include\>"
syn match cPreProc "^\s*#\s*define\>"
syn match cPreProc "^\s*#\s*undef\>"
syn match cPreProc "^\s*#\s*ifdef\>"
syn match cPreProc "^\s*#\s*ifndef\>"
syn match cPreProc "^\s*#\s*if\>"
syn match cPreProc "^\s*#\s*elif\>"
syn match cPreProc "^\s*#\s*else\>"
syn match cPreProc "^\s*#\s*endif\>"
syn match cPreProc "^\s*#\s*pragma\>"
syn match cPreProc "^\s*#\s*error\>"
syn match cPreProc "^\s*#\s*warning\>"
syn match cPreProc "^\s*#\s*line\>"

" Keywords
syn keyword cKeyword auto break case continue default do else for goto
syn keyword cKeyword if return sizeof static switch while
syn keyword cKeyword const extern inline register restrict volatile
syn keyword cKeyword typedef struct union enum

" C11/C23
syn keyword cKeyword _Alignas _Alignof _Atomic _Bool _Complex
syn keyword cKeyword _Generic _Imaginary _Noreturn _Static_assert _Thread_local

" Types
syn keyword cType void int char short long float double signed unsigned
syn keyword cType size_t ssize_t ptrdiff_t
syn keyword cType int8_t int16_t int32_t int64_t
syn keyword cType uint8_t uint16_t uint32_t uint64_t
syn keyword cType intptr_t uintptr_t intmax_t uintmax_t
syn keyword cType bool pid_t uid_t gid_t off_t mode_t time_t clock_t
syn keyword cType FILE DIR
syn keyword cType fd_set socklen_t sa_family_t
syn keyword cType pthread_t pthread_mutex_t pthread_cond_t pthread_attr_t

" Constants
syn keyword cConstant NULL true false
syn keyword cConstant EOF BUFSIZ FILENAME_MAX PATH_MAX
syn keyword cConstant EXIT_SUCCESS EXIT_FAILURE
syn keyword cConstant STDIN_FILENO STDOUT_FILENO STDERR_FILENO
syn keyword cConstant SEEK_SET SEEK_CUR SEEK_END
syn keyword cConstant O_RDONLY O_WRONLY O_RDWR O_CREAT O_TRUNC O_APPEND O_NONBLOCK
syn keyword cConstant SIGINT SIGTERM SIGKILL SIGHUP SIGPIPE SIGCHLD
syn keyword cConstant SIGUSR1 SIGUSR2 SIGALRM SIGSTOP SIGCONT SIGTSTP
syn keyword cConstant AF_INET AF_INET6 AF_UNIX SOCK_STREAM SOCK_DGRAM
syn keyword cConstant M_PI M_E

" Standard library functions
syn keyword cBuiltin printf fprintf sprintf snprintf
syn keyword cBuiltin scanf fscanf sscanf
syn keyword cBuiltin puts fputs putchar fputc
syn keyword cBuiltin fgets getchar fgetc getc ungetc
syn keyword cBuiltin fopen fclose fflush freopen
syn keyword cBuiltin fread fwrite fseek ftell rewind feof ferror
syn keyword cBuiltin remove rename tmpfile
syn keyword cBuiltin perror
syn keyword cBuiltin malloc calloc realloc free
syn keyword cBuiltin atoi atol atof strtol strtoul strtod strtoll strtoull
syn keyword cBuiltin abs labs llabs
syn keyword cBuiltin rand srand
syn keyword cBuiltin exit atexit abort
syn keyword cBuiltin getenv system
syn keyword cBuiltin qsort bsearch
syn keyword cBuiltin strlen strcmp strncmp strcpy strncpy strcat strncat
syn keyword cBuiltin strchr strrchr strstr strtok
syn keyword cBuiltin memcpy memmove memset memcmp memchr
syn keyword cBuiltin strerror strdup strndup
syn keyword cBuiltin read write open close lseek
syn keyword cBuiltin fork exec execv execve execvp
syn keyword cBuiltin pipe dup dup2
syn keyword cBuiltin getpid getppid getuid getgid
syn keyword cBuiltin chdir getcwd chown chmod unlink mkdir rmdir
syn keyword cBuiltin access stat lstat fstat
syn keyword cBuiltin sleep usleep alarm pause
syn keyword cBuiltin signal kill raise
syn keyword cBuiltin socket connect bind listen accept
syn keyword cBuiltin send recv sendto recvfrom
syn keyword cBuiltin setsockopt getsockopt getsockname getpeername
syn keyword cBuiltin htons htonl ntohs ntohl
syn keyword cBuiltin inet_aton inet_ntoa inet_pton inet_ntop
syn keyword cBuiltin getaddrinfo freeaddrinfo
syn keyword cBuiltin pthread_create pthread_join pthread_detach pthread_exit
syn keyword cBuiltin pthread_mutex_init pthread_mutex_lock pthread_mutex_unlock pthread_mutex_destroy
syn keyword cBuiltin sin cos tan asin acos atan atan2
syn keyword cBuiltin sqrt pow log log10 exp
syn keyword cBuiltin ceil floor round fabs fmod
syn keyword cBuiltin time localtime gmtime strftime
syn keyword cBuiltin assert

" Standard streams
syn keyword cBuiltin stdin stdout stderr

" Highlighting links
hi def link cComment Comment
hi def link cTodo Todo
hi def link cString String
hi def link cCharacter String
hi def link cEscape Special
hi def link cNumber Number
hi def link cPreProc PreProc
hi def link cKeyword Keyword
hi def link cType Type
hi def link cConstant Constant
hi def link cBuiltin Function

let b:current_syntax = "c"
