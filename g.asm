global _start

section .data
  msg: db "1 ", 10
  msglen: equ $ - msg
  msgg: db "0 ", 10
  msglenn: equ $ - msgg
  x: dd 2
  y: dd 5

section .text

_start:

  mov rdi, 2        ;
  mov rsi, 8        ;
  call checkGreater ;

  mov rax, 60       ; exit(
  mov rdi, 0        ;   EXIT_SUCCESS
  syscall           ; );

checkGreater:
  mov rax, rdi      ;
  mov rdx, rsi      ;
  cmp rax, rdx      ;
  jle greater       ;
  jmp less          ;

greater:
  mov rax, 1        ; write(
  mov rdi, 1        ;   STDOUT_FILENO,
  mov rsi, msg      ;   "Hello, world!\n",
  mov rdx, msglen   ;   sizeof("Hello, world!\n")
  syscall           ; );  
  ret               ;

 less:
  mov rax, 1        ; write(
  mov rdi, 1        ;   STDOUT_FILENO,
  mov rsi, msgg      ;   "Hello, world!\n",
  mov rdx, msglenn   ;   sizeof("Hello, world!\n")
  syscall           ; );  
  ret               ;
