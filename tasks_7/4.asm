%include "st_io.inc"

section .data
a1 dd 1500

b1 dd 2500

c1 dd 250

d dd 0

section .bss
a resb 3
b resb 3
c resb 3


global _start

section .text
_start:

;переместим все соответствующие значения в a, b, c

mov al, byte [a1]
mov bl, byte [a1+1]
mov cl, byte [a1+2]

mov byte [a], al
mov byte [a+1], bl
mov byte [a+2], cl

mov al, byte [b1]
mov bl, byte [b1+1]
mov cl, byte [b1+2]

mov byte [b], al
mov byte [b+1], bl
mov byte [b+2], cl

mov al, byte [c1]
mov bl, byte [c1+1]
mov cl, byte [c1+2]

mov byte [c], al
mov byte [c+1], bl
mov byte [c+2], cl

sub byte [b], 1
sbb byte [b+1], 0
sbb byte [b+2], 0

mov al, byte [b]
mov bl, byte [b+1]
mov cl, byte [b+2]

add al, byte [a]
adc bl, byte [a+1]
adc cl, byte [a+2]

sub al, byte [c]
sbb bl, byte [c+1]
sbb cl, byte [c+2]

mov byte [d], al
mov byte [d+1], bl
mov byte [d+2], cl
mov byte [d+3], 0

UNSINT [d]

PUTCHAR 0xa

FINISH
