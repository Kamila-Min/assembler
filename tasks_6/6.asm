%include "st_io.inc"

section .data
x dd 25
y dd 25
t dd 19 
xp dd 0

global _start

section .text
_start:

mov eax, dword t
mov [xp], eax
xchg [x], eax
mov eax, [y]
mov [xp], eax

SIGNINT [x] 
PUTCHAR 0xa
SIGNINT [xp]
PUTCHAR 0xa

FINISH
