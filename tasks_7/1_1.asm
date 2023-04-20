%include "st_io.inc"

section .data
a db 1
b dd 4

global _start

section .text
_start:

movzx eax, byte [a]
mov dword [b], eax

UNSINT eax

PUTCHAR 0xa

FINISH
