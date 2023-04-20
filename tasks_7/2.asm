%include "st_io.inc"

section .data
a db 7
x db 2
b db 10
c db 5

global _start

section .text
_start:

mov al, [x]
mul al
mov bl, al
mul byte [b]
add al, [c]
mov bh, al
mov al, bl
mul byte [x]
neg al
sub al, bh
cbw
idiv byte [a]
mov bh, ah

movsx eax, al

SIGNINT eax

PUTCHAR 0xa

mov ah, bh
movsx eax, ah

SIGNINT eax

PUTCHAR 0xa

FINISH
