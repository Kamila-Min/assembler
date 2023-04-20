%include "st_io.inc"

section .data
a dw 15000
b db 2
c dd 0

global _start

section .text
_start:

mov al, byte [a]
mul byte [b]

mov bx, ax

mov al, byte [a+1]
mul byte [b]

mov cx, ax

mov byte [c], bl

add bh, cl
mov byte [c+1], bh

adc ch, 0
mov byte [c+2], ch


SIGNINT [c]

PUTCHAR 0xa

FINISH
