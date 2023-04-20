%include "st_io.inc"

section .data
arr dd 1, 2, 3, 4, 5, -6, -7, -8, -9, -10, 11, -12, 13, 14, -15, -16, 17, 18, 19, 20
k dd 0
min dd 0
max dd 0

global _start

section .text
_start:
mov eax, 0
mov ebx, [arr+eax*4]
mov dword[min], ebx
mov dword[max], ebx
mov ecx, 20
cycle:
mov ebx, dword[min]
mov ebp, dword[max]
cmp [arr+eax*4], ebx
jle ifmin
to_cycle_1:
cmp [arr+eax*4], ebp
jge ifmax
to_cycle_2:
inc eax
loop cycle

PRINT 'min = '
SIGNINT [min]
PUTCHAR 0xa
PRINT 'max = '
SIGNINT [max]
PUTCHAR 0xa

mov eax, 0
mov ebx, dword[min]
mov ebp, dword[max]
mov ecx, 20
cycle_1:
cmp dword [arr + eax*4], ebx
jne next_1
mov dword [arr+eax*4], ebp
jmp next_2
next_1:
cmp dword [arr+eax*4], ebp
jne next_2
mov dword [arr+eax*4], ebx
next_2:
inc eax
loop cycle_1

SIGNINT [arr+15*4]
PUTCHAR 0xa
SIGNINT [arr+19*4]
PUTCHAR 0xa

mov eax, 0
mov ecx, 20
cycle_2:
mov dword [k], ecx
mov ecx, 0
jecxz fprint
return:
mov ecx, [k]
inc eax
loop cycle_2

PUTCHAR 0xa

FINISH

fprint:
SIGNINT [arr+eax*4]
PUTCHAR ' '
jmp return

ifmin:
mov edx, [arr+eax*4]
mov dword [min], edx
jmp to_cycle_1

ifmax:
mov edx, [arr+eax*4]
mov dword [max], edx
jmp to_cycle_2
