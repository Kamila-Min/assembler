%include "st_io.inc"

section .data
a dd 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
k dd 0
c dd 0
d dd 0
n dd 10
b dd 0

global _start

section .text
_start:

mov dword [c], edx
mov dword [d], ecx

mov edx, 0
mov ecx, [n]
cycle:
push dword [a+edx]
add edx, 4
loop cycle

pop dword [k]
pop dword [b]
push dword [k]
push dword [b]

pop dword [a]
SIGNINT [a]
PUTCHAR ' '
pop dword [a]
SIGNINT [a]
PUTCHAR ' '
pop dword [a]
SIGNINT [a]
PUTCHAR ' '
pop dword [a]
SIGNINT [a]
PUTCHAR ' '
pop dword [a]
SIGNINT [a]
PUTCHAR ' '
pop dword [a]
SIGNINT [a]
PUTCHAR ' '
pop dword [a]
SIGNINT [a]
PUTCHAR ' '
pop dword [a]
SIGNINT [a]
PUTCHAR ' '
pop dword [a]
SIGNINT [a]
PUTCHAR ' '
pop dword [a]
SIGNINT [a]
PUTCHAR 0xa

mov edx, [c]
mov ebx, [d]

FINISH

