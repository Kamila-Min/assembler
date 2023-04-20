%include "st_io.inc"

section .data
a dd 1, 0, 3, 4, 5, 0, 7, 8, 0, 9
k dd 0
n dd 10
b dd 0
m db 0

global _start

section .text
_start:

mov edx, 0
mov ecx, [n]
cycle:
push dword [a+edx]
add edx, 4
loop cycle

mov ecx, [n]
cycle_1:
pop dword [a]
mov ebx, [a]
cmp ebx, 0
jne next
inc al
next:
loop cycle_1

cbw
cwde
SIGNINT eax
PUTCHAR 0xa

FINISH
