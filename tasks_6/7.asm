%include "st_io.inc"

section .data
x dd -2147483640
y dd 4294967293
s dd 1

global _start

section .text
_start:

mov al, byte [x]
mov bl, byte [x+1]
mov cl, byte [x+2]
mov dl, byte [x+3]

add al, 1
adc bl, 0
adc cl, 0
adc dl, 0

mov byte [x], al
mov byte [x+1], bl
mov byte [x+2], cl
mov byte [x+3], dl

SIGNINT [x]

PUTCHAR 0xa

mov al, byte [y]
mov bl, byte [y+1]
mov cl, byte [y+2]
mov dl, byte [y+3]

add al, 1
adc bl, 0
adc cl, 0
adc dl, 0

mov byte [y], al
mov byte [y+1], bl
mov byte [y+2], cl
mov byte [y+3], dl


UNSINT [y]

PUTCHAR 0xa

FINISH
