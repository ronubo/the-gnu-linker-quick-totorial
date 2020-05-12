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
  iamsection : { iamvar = 5; }
  .iamsection : { iamvar2 = 0xbeef; }
 
}
