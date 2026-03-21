" Vim syntax file
" Language:    Assembly (x86/x86_64, GAS/NASM)
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case ignore

" Comments
syn keyword asmTodo contained TODO FIXME XXX NOTE HACK BUG
syn match asmComment ";.*$" contains=asmTodo
syn match asmComment "#.*$" contains=asmTodo
syn region asmComment start="/\*" end="\*/" contains=asmTodo

" Labels
syn match asmLabel "^\s*[a-zA-Z_.][a-zA-Z0-9_$.]*:"
syn match asmLabel "\<\.[a-zA-Z_][a-zA-Z0-9_]*:"

" Strings
syn region asmString start=+"+ skip=+\\"+ end=+"+
syn region asmString start=+'+ skip=+\\'+ end=+'+

" Numbers
syn match asmNumber "\<\d[0-9_]*\>"
syn match asmNumber "\<0[xX][0-9a-fA-F_]\+\>"
syn match asmNumber "\<0[bB][01_]\+\>"
syn match asmNumber "\<0[oO]\?[0-7_]\+\>"
syn match asmNumber "\<\d[0-9_]*\.\d[0-9_]*\>"
syn match asmNumber "\$[0-9a-fA-F]\+\>"
syn match asmNumber "[0-9][0-9a-fA-F]*[hH]\>"

" Registers - 64-bit
syn keyword asmRegister rax rbx rcx rdx rsi rdi rsp rbp
syn keyword asmRegister r8 r9 r10 r11 r12 r13 r14 r15
syn keyword asmRegister rip

" Registers - 32-bit
syn keyword asmRegister eax ebx ecx edx esi edi esp ebp
syn keyword asmRegister r8d r9d r10d r11d r12d r13d r14d r15d
syn keyword asmRegister eflags

" Registers - 16-bit
syn keyword asmRegister ax bx cx dx si di sp bp
syn keyword asmRegister r8w r9w r10w r11w r12w r13w r14w r15w

" Registers - 8-bit
syn keyword asmRegister al bl cl dl ah bh ch dh
syn keyword asmRegister sil dil spl bpl
syn keyword asmRegister r8b r9b r10b r11b r12b r13b r14b r15b

" Segment registers
syn keyword asmRegister cs ds es fs gs ss

" SSE/AVX registers
syn match asmRegister "\<[xyz]mm\([0-9]\|[12][0-9]\|3[01]\)\>"

" GAS directives
syn match asmPreProc "\.\(text\|data\|bss\|section\|global\|globl\|extern\)\>"
syn match asmPreProc "\.\(byte\|word\|long\|quad\|float\|double\)\>"
syn match asmPreProc "\.\(ascii\|asciz\|string\|zero\|fill\|space\)\>"
syn match asmPreProc "\.\(align\|balign\|p2align\|org\)\>"
syn match asmPreProc "\.\(equ\|set\|macro\|endm\)\>"
syn match asmPreProc "\.\(if\|else\|endif\|ifdef\|ifndef\)\>"
syn match asmPreProc "\.\(include\|incbin\|comm\|lcomm\)\>"
syn match asmPreProc "\.\(type\|size\|file\|loc\)\>"
syn match asmPreProc "\.\(cfi_startproc\|cfi_endproc\|cfi_def_cfa\|cfi_offset\)\>"

" NASM directives
syn keyword asmPreProc DB DW DD DQ DT
syn keyword asmPreProc RESB RESW RESD RESQ REST
syn keyword asmPreProc SECTION SEGMENT GLOBAL EXTERN
syn keyword asmPreProc BITS ORG TIMES EQU
syn match asmPreProc "%define\>"
syn match asmPreProc "%macro\>"
syn match asmPreProc "%endmacro\>"
syn match asmPreProc "%include\>"
syn match asmPreProc "%if\>"
syn match asmPreProc "%else\>"
syn match asmPreProc "%endif\>"
syn match asmPreProc "%ifdef\>"
syn match asmPreProc "%ifndef\>"

" Size specifiers
syn keyword asmType byte word dword qword tword oword yword zword
syn keyword asmType BYTE WORD DWORD QWORD TWORD OWORD YWORD ZWORD
syn keyword asmType ptr PTR near far NEAR FAR

" Data movement instructions
syn keyword asmKeyword mov movzx movsx movsxd lea push pop
syn keyword asmKeyword xchg cmpxchg lock bswap
syn keyword asmKeyword cmovcc

" Arithmetic instructions
syn keyword asmKeyword add sub mul imul div idiv inc dec neg
syn keyword asmKeyword adc sbb

" Logic/bit instructions
syn keyword asmKeyword not and or xor
syn keyword asmKeyword shl shr sal sar rol ror rcl rcr
syn keyword asmKeyword bt bts btr btc bsf bsr

" Comparison/test
syn keyword asmKeyword cmp test

" Control flow
syn keyword asmKeyword call ret jmp nop
syn keyword asmKeyword je jne jz jnz jg jge jl jle
syn keyword asmKeyword ja jae jb jbe jc jnc jo jno js jns
syn keyword asmKeyword loop loope loopne
syn keyword asmKeyword int syscall sysenter
syn keyword asmKeyword enter leave

" Conversion
syn keyword asmKeyword cdq cqo cbw cwde cdqe

" String instructions
syn keyword asmKeyword rep repe repne repz repnz
syn keyword asmKeyword movs movsb movsw movsd movsq
syn keyword asmKeyword stos stosb stosw stosd stosq
syn keyword asmKeyword lods lodsb lodsw lodsd lodsq
syn keyword asmKeyword cmps cmpsb cmpsw cmpsd
syn keyword asmKeyword scas scasb

" Flag instructions
syn keyword asmKeyword clc stc cld std cli sti

" Setcc
syn keyword asmKeyword setcc sete setne setz setnz setg setge setl setle
syn keyword asmKeyword seta setae setb setbe setc setnc seto setno sets setns

" System
syn keyword asmKeyword hlt cpuid rdtsc rdtscp pause

" Memory fence
syn keyword asmKeyword lfence sfence mfence clflush
syn keyword asmKeyword prefetch prefetcht0 prefetcht1 prefetcht2 prefetchnta

" SSE scalar
syn keyword asmKeyword movaps movups movdqa movdqu
syn keyword asmKeyword addps subps mulps divps
syn keyword asmKeyword addpd subpd mulpd divpd
syn keyword asmKeyword addss subss mulss divss
syn keyword asmKeyword addsd subsd mulsd divsd
syn keyword asmKeyword sqrtps sqrtpd sqrtss sqrtsd
syn keyword asmKeyword maxps minps cmpps cmppd

" SSE integer/pack
syn keyword asmKeyword pxor por pand pandn
syn keyword asmKeyword paddb paddw paddd paddq
syn keyword asmKeyword psubb psubw psubd psubq
syn keyword asmKeyword pmullw pmulld
syn keyword asmKeyword psllw pslld psllq psrlw psrld psrlq psraw psrad
syn keyword asmKeyword pcmpeqb pcmpeqw pcmpeqd pcmpgtb pcmpgtw pcmpgtd
syn keyword asmKeyword punpcklbw punpcklwd punpckldq
syn keyword asmKeyword punpckhbw punpckhwd punpckhdq
syn keyword asmKeyword packuswb packsswb packssdw

" Conversion
syn keyword asmKeyword cvtsi2ss cvtsi2sd cvtss2si cvtsd2si cvtss2sd cvtsd2ss

" Highlight links
hi def link asmComment Comment
hi def link asmTodo Todo
hi def link asmString String
hi def link asmNumber Number
hi def link asmLabel Label
hi def link asmRegister Identifier
hi def link asmPreProc PreProc
hi def link asmType Type
hi def link asmKeyword Keyword

let b:current_syntax = "asm"
