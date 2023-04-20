global _start

section .bss
c resb 20

section .text
_start:

mov eax, 3
mov ebx, 2
mov ecx, c
mov edx, 19

int 0x80

mov eax, 4
mov ebx, 1
mov ecx, c
mov edx, 19

int 0x80

mov eax, 1
mov ebx, 0

int 0x80
