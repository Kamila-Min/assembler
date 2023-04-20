%include "st_io.inc"

section .data
arr dw 0, 0, 0, 0, 0
brr db 0, 0, 0, 0, 0
a dd 0
b dd 5
sum dd 0

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
mov word [arr+esi*2], ax
jmp return_1

next:
PRINT 'arr = '
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
mov ax, [arr+esi*2]
UNSINT eax
PUTCHAR ' '
jmp return_2

next_1:
PUTCHAR 0xa
mov edx, 0
mov eax, 0
mov esi, 0
mov ecx, 5
cycle_3:
mov bx, [arr+esi*2]
cmp bx, 12
jb continue
cmp bx, 25
ja continue
add dword [sum], ebx
mov byte [brr+edi*1], dl
inc edi
continue:
inc esi
inc dl
loop cycle_3

mov edx, 0
mov eax, [sum]
div edi
PRINT 'ср.ар. = '
UNSINT eax
PUTCHAR ' '
PRINT 'ост.'
PUTCHAR ' '
UNSINT edx
PUTCHAR 0xa

PRINT 'brr = '
mov eax, 0
mov esi, 0
mov ecx, edi
cycle_4:
mov dword [a], ecx
mov ecx, 0
jecxz fprint_2
return_3:
mov ecx, [a]
inc esi
mov eax, 0
loop cycle_4

jmp end

fprint_2:
mov al, [brr+esi*1]
UNSINT eax
PUTCHAR ' '
jmp return_3

end:
PUTCHAR 0xa
FINISH
