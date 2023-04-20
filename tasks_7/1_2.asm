%include "st_io.inc"

section .data
a db 5
b dw 4

global _start

section .text
_start:

movsx ax, byte [a]
mov [b], ax
cwde

SIGNINT [b]

PUTCHAR 0xa

FINISH
