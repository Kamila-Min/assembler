%include "st_io.inc"

global _start

section .data:
r dd 17
x dd 0
y dd 0
m dd 12

section .text
_start:

mov ebx, [m]
mov eax, [r]
div ebx

mov ecx, [y]

cmp edx, 0
je then

jne else
else:
mov ecx, edx
jmp next

then:
mov ecx, [m]
jmp next

next:
mov eax, [r] 
sub eax, ecx
mov edx, 0
div ebx

cmp eax, 10
jb with_null1

jae wthout_null1
wthout_null1:
UNSINT eax
jmp continue

with_null1:
PUTCHAR '0'
UNSINT eax

continue:
PUTCHAR ':'

cmp ecx, 10
jb with_null2

jae wthout_null2
wthout_null2:
UNSINT ecx
PUTCHAR 0xa
FINISH

with_null2:
PUTCHAR '0'
UNSINT ecx
PUTCHAR 0xa
FINISH

