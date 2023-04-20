%include "st_io.inc"

section .data
arr dw 1, 2, 3, 4, 5, -6, -7, -8, -9, -10, 11, -12, 13, 14, -15, -16, 17, 18, 19, 20
k dw 0
n dw 20
m dd 0
b dd 0

global _start

section .text
_start:

mov bx, word [arr+eax*2]
mov cx, [n]
cycle:
mov bx, word [arr+eax*2]
mov word [k], cx
mov cx, [n]
mov dword [m], eax
mov eax, 0
cycle_1:
cmp bx, word [arr+eax*2]
jle next
mov dx, word [arr+eax*2]
mov word [arr+eax*2], bx
mov dword [b], eax
mov eax, [m]
mov word [arr+eax*2], dx
mov eax, [b]
next:
inc eax
loop cycle_1
mov cx, [k]
mov eax, [m]
inc eax
loop cycle

mov eax, 0
SIGNINT [arr+eax*2]
PUTCHAR 0xa

mov eax, 0
mov cx, 20
cycle_2:
mov word [k], cx
mov cx, 0
jecxz fprint
return:
mov cx, [k]
inc eax
loop cycle_2

PUTCHAR 0xa

FINISH

fprint:
SIGNINT [arr+eax*2]
PUTCHAR ' '
jmp return
