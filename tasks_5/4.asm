%include "st_io.inc"

section .data
a dw 250
b dw 255

global _start

section .text
_start:

mov ax,  word[b]
add word[a], ax
mov ax, word[b+2]
adc word[a+2], ax

UNSINT [a] 
PUTCHAR 0xa


FINISH
