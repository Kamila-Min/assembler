%include "st_io.inc"

section .data
a dd 12345678
n dd 0
b dd 10

global _start

section .text
_start:

mov eax, [a]
mov edx, 0
mov ebx, 0

mov ecx, 10

count:
div dword [b]
inc dword [n]
mov edx, 0
cmp eax, ebx
loopne count

end:
SIGNINT [n]
PUTCHAR 0xa
FINISH
