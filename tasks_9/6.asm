%include "st_io.inc"

section .data
k dd 4967296
m dd 4569
c dq 0
arr db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
a dd 11
s db 10


global _start

section .text
_start:

mov eax, dword [k]
mov edx, 0
mul dword [m]

mov dword [c], eax
mov dword [c+4], edx

mov ecx, [a]
mov esi, [a]

cycle:
cmp eax, 0
je next
return:
div dword [s]
mov byte [arr+esi*1], ah
mov ah, 0
mov di, ax
mov ax, 0
dec esi
mov edx, 0
loop cycle
jmp next_1

next:
mov eax, edx
jmp return

next_1:

PUTCHAR '!'

mov ebx, 0
mov edx, 0
mov eax, 0
mov ecx, 0

PUTCHAR [arr+1*1]

PUTCHAR 0xa

int 0x80

mov eax, 4
mov ebx, 1
mov ecx, arr
mov edx, 11

int 0x80

PUTCHAR 0xa

FINISH

