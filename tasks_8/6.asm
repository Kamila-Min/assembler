%include "st_io.inc"

global _start

section .data
a dd 1
b dd 1
n dd 2
num dd 10

section .text
_start:

inc bh
mov edx, [a]
mov ecx, [b]
mov ebx, [num]

cycle:
cmp dword [n], ebx

jb fib
je end

end:
UNSINT ecx
PUTCHAR 0xa
FINISH

fib:
mov eax, edx
add eax, ecx
mov ebx, eax

inc dword [n]

mov edx, ecx
mov ecx, ebx
mov ebx, [num]

jmp cycle

