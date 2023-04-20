;считает сумму отр. чисел начиная с -11, хотя должен с -10;

%include "st_io.inc"

section .data
arr dd 1, 2, 3, 4, 5, -6, -7, -8, 9, -10, -11, -12, 13, 14, -15, -16, 17, 18, 19, -20
k dd 10
c dd 0

global _start

section .text
_start:

mov edx, 0
mov eax, 0
mov esi, 0
mov ecx, 20
cycle:
inc eax
cmp eax, dword [k]
jg after_k
to_cycle:
inc esi
loop cycle

PRINT 'the sum of negative elements after the first k = '
SIGNINT edx
PUTCHAR 0xa

FINISH

after_k:
mov ebx, [arr+esi*4]
cmp ebx, 0
jge to_cycle
neg:
add edx, ebx
jmp to_cycle

