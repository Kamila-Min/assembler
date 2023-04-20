%include "st_io.inc"

global _start

section .data
t dd 10000
k dd 0
c1 dd 3600
c2 dd 60
count dd 0

section .text
_start:

mov eax, [t]
inc eax
mov dword [k], eax
jmp lp
jmp prnt

lp:
div dword [c1]
mov ebx, eax

mov eax, edx
mov edx, 0
div dword [c2]
mov ecx, eax ;ebx - hours, ecx - min, edx - sec 

prnt:
cmp ebx, 10
jb with_null1
jae wthout_null1

wthout_null1:
UNSINT ebx
jmp next1

with_null1:
PUTCHAR '0'
UNSINT ebx

next1:
PUTCHAR ':'

cmp ecx, 10
jb with_null2

jae wthout_null2
wthout_null2:
UNSINT ecx
jmp next2

with_null2:
PUTCHAR '0'
UNSINT ecx

next2:
PUTCHAR ':'

cmp edx, 10
jb with_null3
jae wthout_null3

wthout_null3:
UNSINT edx
PUTCHAR 0xa
FINISH

with_null3:
PUTCHAR '0'
UNSINT edx
PUTCHAR 0xa
FINISH


