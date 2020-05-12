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

/* . = . + SIZEOF_HEADERS ;  */
PHDRS
{
/*    null PT_NULL;
    headers PT_PHDR PHDRS  ;   */
/*  interp PT_INTERP ; */ 
/*  text PT_LOAD FILEHDR PHDRS ; */
/*  data PT_LOAD ; */
    custom PT_LOAD FILEHDR PHDRS ; 
/*  dynamic PT_DYNAMIC ; */
}


SECTIONS
{
  .some.section : {/* Nothing is define here so you will not see it in the output*/}
  .another.section : {
     somevariable = 0x42 ;   /* offset with respect to the current section address */
     KEEP( *(.another.section) );
  }

  /* . = 0x800000;  this sets the VA */
     . = 0x200054 ;
  custom :  { *(custom) } : custom 
  

  /DISCARD/ : {*(.symtab)}
  /* Important note: GNU ld does not let .shstrtab .symtab and .strtab  be discarded. As per the time of writing, LLVM's ld doesn't allow it either (and errs when trying) */

}


somevariable2 = 0x42 ;   /* global offset. If we called it in the same name - the global would override the section one! */


