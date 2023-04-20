%include "st_io.inc"

global _start

section .data
a db 244
x db 0
b db 10
count db 0

section .text
_start:

mov cl, [a]
inc bx

jmp l

l:
cmp bx, 0
jne cycle
cycle:
mov al, cl
mov ah, 0 ;расширение до ax
div byte [b]
mov cl, al

cmp ah, 5
je if_5

jne next

if_5:
inc byte [count]

next:
cmp cl, 0 
je endofcycle
jne not_end

endofcycle:
cmp byte [count], 0
je no
jne yes

no:
PRINT "There is not the figure 5 in number"
PUTCHAR 0xa
FINISH

yes:
PRINT "There is the figure 5 in number"
PUTCHAR 0xa
FINISH

not_end:
jmp l
