%include "st_io.inc"

section .data
a db 1
b dw 1
c dd 1
x dd 0
a1 db 0
b1 dw 0
c1 dd 0

global _start

section .text
_start:

for_db:
mov al, [a]
mov ecx, 100

cycle_1:
inc byte [a]
mov byte [a1], al
mul byte [a]
jo of1_1
loop cycle_1

for_dw:
mov ax, [b]
mov ecx, 100

cycle_2:
inc word [b]
mov word [b1], ax
mul word [b]
jo of2_1
loop cycle_2

for_dd:
mov eax, [c]
mov ecx, 100

cycle_3:
inc dword [c]
mov dword [c1], eax
mul dword [c]
jo of3_1
loop cycle_3

end:
PRINT 'max factorial for db: '
SIGNINT ebx
PRINT ' , of number '
dec byte [a]
mov al, [a]
cbw
cwde
SIGNINT eax
PUTCHAR 0xa
PRINT 'max factorial for dw: '
SIGNINT [x]
PRINT ' , of number '
dec word [b]
mov ax, [b]
cwde
SIGNINT eax
PUTCHAR 0xa
PRINT 'max factorial for dd: '
SIGNINT edx
PRINT ' , of number '
dec dword [c]
mov eax, [c]
SIGNINT eax
PUTCHAR 0xa

FINISH

of1_1:
mov ecx, 0
jc cf1_1
PRINT "ERROR, OF=1, CF<>0"

cf1_1:
mov al, byte [a1]
cbw
cwde
mov ebx, eax
mov eax, 0
jmp for_dw

of2_1:
mov ecx, 0
jc cf2_1
PRINT "ERROR, OF=1, CF<>0"

cf2_1:
mov dword [x], eax
mov ax, word [b1]
cwde
jmp for_dd

of3_1:
mov ecx, 0
jc cf3_1
PRINT "ERROR, OF=1, CF<>0"

cf3_1:
mov eax, dword [c1]
mov edx, eax
mov eax, 0
jmp end
