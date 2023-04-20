%include "st_io.inc"

section .data
a dd 0

global _start

section .text
_start:

mov eax, ((5684//4 + 357//3 + 245//5)*3)
xchg [a], eax

SIGNINT [a] 
PUTCHAR 0xa

FINISH
