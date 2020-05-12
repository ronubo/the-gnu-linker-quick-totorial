.section custom, "ax"
.globl my_starting_point
my_starting_point:
nop
/* exit */
movl $1, %eax
movl $42,%ebx
.byte 0xcd
.byte 0x80
nop

.globl main
main:
nop
nop

/* write 
mv $4, %eax
*/
