%include "st_io.inc"

global _start

section .data
a dd 712345612
b dd 1

section .text
_start:

mov eax, [a]
mov ebx, [b]

mul ebx

jo of_1

of_0:
jc cf2_1 

cf2_0:
PRINT 'FIT'
PUTCHAR 0xa
FINISH

cf2_1:
PRINT 'ERROR'
PUTCHAR 0xa
FINISH

of_1:
jc cf1_1

cf1_0:
PRINT 'ERROR'
PUTCHAR 0xa
FINISH

cf1_1:
PRINT 'NOT FIT'
PUTCHAR 0xa
FINISH
