%include "st_io.inc"

section .data
arr_1 db 0, 0, 0, 0, 0
arr_2 db 0, 0, 0, 0, 0
a dd 0
b db 0
c db 0

global _start

section .text
_start:
mov ecx, 5
cycle_1:
mov dword [a], ecx
mov ecx, 0
jecxz fscanf_1
return_1:
mov ecx, [a]
inc esi
mov eax, 0
loop cycle_1

jmp next
fscanf_1:
GETUN eax
mov byte [arr_1+esi*1], al
jmp return_1

next:
PRINT 'arr_1 = '
mov eax, 0
mov esi, 0
mov ecx, 5
cycle_2:
mov dword [a], ecx
mov ecx, 0
jecxz fprint_1
return_2:
mov ecx, [a]
inc esi
mov eax, 0
loop cycle_2

jmp next_1

fprint_1:
mov al, [arr_1+esi*1]
UNSINT eax
PUTCHAR ' '
jmp return_2

next_1:
PUTCHAR 0xa
mov eax, 0
mov esi, 0
mov ecx, 5
cycle_3:
mov dword [a], ecx
mov ecx, 0
jecxz fscanf_2
return_3:
mov ecx, [a]
inc esi
mov eax, 0
loop cycle_3

jmp next_2

fscanf_2:
GETUN eax
mov byte [arr_2+esi*1], al
jmp return_3

next_2:
PRINT 'arr_2 = '
mov eax, 0
mov esi, 0
mov ecx, 5
cycle_4:
mov dword [a], ecx
mov ecx, 0
jecxz fprint_2
return_4:
mov ecx, [a]
inc esi
mov eax, 0
loop cycle_4

jmp next_3

fprint_2:
mov al, [arr_2+esi*1]
UNSINT eax
PUTCHAR ' '
jmp return_4

next_3:
PUTCHAR 0xa
mov eax, 0
mov esi, 0
mov ecx, 5
cycle_5:
mov al, [arr_1+esi*1]
mov ah, 0
div byte [arr_2+esi*1]
add bl, ah
inc esi
mov eax, 0
loop cycle_5

mov al, bl

mov ah, 0
mov dx, 0
mov edx, 0

UNSINT eax
PUTCHAR 0xa
FINISH
