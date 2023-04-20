%include "st_io.inc"

section .data
a db 1
b db 9
c db 4
d dw 5
s db 10

global _start

section .text
_start:

mov al, [a]
add al, [b]
mov bl, al

mov al, [a]
mul byte [s]
idiv bl
movsx ax, al
mov cx, ax
cwde ;преобразовали cx в ecx

mov al, [d]
add al, [c]
mov bl, al
cbw

mov ax, [b]
mul byte [s]
idiv bx
movsx eax, ax
add eax, ecx

SIGNINT eax

PUTCHAR 0xa

FINISH
