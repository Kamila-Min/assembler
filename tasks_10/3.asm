%include "st_io.inc"

section .data
a db -1, 10, -7, 52, 99
arr db 0, 0, 0, 0, 0
brr db 0, 0, 0, 0, 0
c dd 0
b db 2
sum dd 0

global _start

section .text
_start:

mov edx, 0
mov eax, 0
mov esi, 0
mov ecx, 5
cycle_1:
mov al, [a+esi*1]
mov dl, al
cbw
div byte [b]
cmp ah, 0
jne not_div_2
mov byte [arr+esi*1], dl
mov eax, 0
inc ebp
inc esi
not_div_2:
mov byte [brr+esi*1], dl
mov eax, 0
inc esi
inc edi
loop cycle_1

PRINT 'arr = '
mov eax, 0
mov esi, 0
mov ecx, ebp
cycle_2:
mov dword [c], ecx
mov ecx, 0
jecxz fprint_1
return_1:
mov ecx, [c]
inc esi
mov eax, 0
loop cycle_2

jmp next

fprint_1:
mov al, [arr+esi*1]
UNSINT eax
PUTCHAR ' '
jmp return_1

next:
PRINT 'brr = '
mov eax, 0
mov esi, 0
mov ecx, edi
cycle_3:
mov dword [c], ecx
mov ecx, 0
jecxz fprint_2
return_2:
mov ecx, [c]
inc esi
mov eax, 0
loop cycle_3

jmp end

fprint_2:
mov al, [brr+esi*1]
UNSINT eax
PUTCHAR ' '
jmp return_2

end:
PUTCHAR 0xa
FINISH
