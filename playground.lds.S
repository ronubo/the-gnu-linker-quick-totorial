/* Simple file with data */

/* INPUT() specify input file, or input files separated by space, to be included */
OUTPUT(myoutput)

OUTPUT_FORMAT(elf32-i386)
/*Optional, not hurting *OUTPUT_ARCH(i386)

However if you link with a -m32 gcc object you want to set the arch, otherwise:
ld: i386 architecture of input file `../empty_32.o' is incompatible with i386:x86-64 output
*/
OUTPUT_ARCH(i386)
ENTRY(my_starting_point)

/* Define some variable/addresses - they will be *ABS* in objdump -t because they do not belong to a section*/
foo = 0xf000;
bar = 0xbaa7;

/* Will have no effect
. = 0x12345678;
*/

SECTIONS
{
  . = 0x200000 ; 
  iamsection : { KEEP(*(iamsection)) ; iamvar = 5; } = 0x11111111
  . = 0x1000 ; 
  .iamsection :  { KEEP(*(.iamsection)) ; LONG(0x1234) ; BYTE(0x52) ; BYTE(0x6f) ; BYTE(0x6e) ; BYTE(0x4d) ; iamvar2 = 0xbeef; }
  .nop  : { . = 0x10 ;  LONG(0xaaaaaaaa);  } = 0x90909090   
  .nop2 : { . = 0x100 ; LONG(0xbbbbbbbb) } = 0xDEADC0DE
}


. = 0x30 ; 
an_end_var = 7;
