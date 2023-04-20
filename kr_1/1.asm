%include "st_io.inc"

section .bss
a resb 4
b resb 4
x resb 1

global _start

section .text
_start:
PRINT 'a = '
GETUN [a]

mov ebx, [a]
UNSINT ebx
PUTCHAR 0xa

PRINT 'b = '
GETUN [b]

mov ecx, [b]
UNSINT ecx
PUTCHAR 0xa

mov al, 0

PRINT 'x = '
GETUN [x]

mov al, [x]

mov ah, 0
mov dx, 0
mov edx, 0
 
cmp eax, ebx
ja next

PRINT 'The x is in the zone 1'
PUTCHAR 0xa
FINISH

next:
cmp eax, ecx
ja end

PRINT 'The x is in the zone 2'
PUTCHAR 0xa
FINISH

end:
PRINT 'The x is in the zone 3'
PUTCHAR 0xa
FINISH
