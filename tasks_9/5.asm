%include "st_io.inc"

section .data
arr dd 1, 2, 3, 4, 5, -6, -7, -8, -9, -10, 0, -12, 13, 14, -15, -16, 17, 18, 19, 20
k dd 0
n dd 1
min dd 0
max dd 0
sum dd 0

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
inc eax
cmp [arr+eax*4], edi
je end
cmp [arr+eax*4], ebx
jle ifmin
to_cycle_1:
cmp [arr+eax*4], ebp
jge ifmax
to_cycle_2:
mov ebx, [arr+eax*4]
cmp ebx, 0
jl ifsum
to_cycle_3:
inc dword [n]
loop cycle

end:
PRINT 'min = '
SIGNINT [min]
PUTCHAR 0xa
PRINT 'max = '
SIGNINT [max]
PUTCHAR 0xa
PRINT 'sum = '
SIGNINT [sum]
PUTCHAR 0xa
PRINT 'number = '
SIGNINT [n]
PUTCHAR 0xa

FINISH

ifsum:
add esi, ebx
mov dword [sum], esi
jmp to_cycle_3

ifmin:
mov edx, [arr+eax*4]
mov dword [min], edx
jmp to_cycle_1

ifmax:
mov edx, [arr+eax*4]
mov dword [max], edx
jmp to_cycle_2
