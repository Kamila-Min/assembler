%include "st_io.inc"

section .data
a dd 0
b dd 20
c dd 5
d dd 3

global _start

section .text
_start:

PRINT '['
SIGNINT [a]
PRINT ';'
SIGNINT [b]
PRINT ']'
PUTCHAR 0xa
PRINT 'step - '
SIGNINT [c]
PUTCHAR 0xa

mov eax, [a]
mov ebx, dword [b]
sub ebx, dword [a]
mov ecx, ebx
cycle:
mov ebx, eax
div dword [d]
mov esi, ecx
mov ecx, 0
jecxz fprint
to_cycle:
mov ecx, esi
mov eax, ebx
add eax, dword [c] 
cmp eax, dword [b]
jg end
mov edx, 0
loop cycle

fprint: 
SIGNINT edx
PRINT ' '
jmp to_cycle

end:
PUTCHAR 0xa
FINISH
