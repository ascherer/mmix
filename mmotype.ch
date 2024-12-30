@x [0] l.7
\def\Hex#1{\hbox{$^{\scriptscriptstyle\#}$\tt#1}} % experimental hex constant
@y
\def\Hex#1{\hbox{$^{\scriptscriptstyle\#}$\tt#1}} % experimental hex constant

\input pdfwebtocfront

@z

@x [1] l.14
@s tetra int
@y
@s byte int
@s tetra int
@s octa int
@z

@x [1] l.19 Use standard C99 types. Use MMIX-ARITH interface stuff.
#include <time.h>
#include <string.h>
@<Prototype preparations@>@;
@<Type definitions@>@;
@y
#include <string.h>
#include <time.h>
@#
#include "mmix-arith.h" /* |@!byte|, |@!tetra|, |@!octa|, |@!incr| */
#include "mmix-lop.h" /* loader opcodes from \MMIXAL\ */
@#
@z

@x [1] l.26 C99 prototypes for C2x.
int main(argc,argv)
  int argc;@+char*argv[];
@y
int main(
  int argc,char*argv[])
@z

@x [1] l.29
  register int j,delta,postamble=0;
  register char *p;
@y
  register int j,delta;
  register char *p;
  bool postamble=false;
@z

@x [1] l.34 CWEB 3.0 does this.
  do @<List the next item@>@;@+while (!postamble);
@y
  do @<List the next item@>@; while (!postamble);
@z

@x [2] l.41
listing=1, verbose=0;
@y
listing=true, verbose=false;
@z

@x [2] l.43
  if (argv[j][1]=='s') listing=0;
  else if (argv[j][1]=='v') verbose=1;
@y
  if (argv[j][1]=='s') listing=false;
  else if (argv[j][1]=='v') verbose=true;
@z

@x [4] l.62
int listing; /* are we listing everything? */
int verbose; /* are we also showing the tetras of input as they are read? */
@y
bool listing; /* are we listing everything? */
bool verbose; /* are we also showing the tetras of input as they are read? */
@z

@x [5] l.66 Purge MMIX-ARITH stuff.
@ @<Prototype preparations@>=
#ifdef __STDC__
#define ARGS(list) list
#else
#define ARGS(list) ()
#endif
@y
@ (This section remains empty for historic reasons.)
@z

@x [6] l.74
Here we need to define only the basic constants used for interpretation.
@y
@z
@x [6] l.77
@d mm 0x98 /* the escape code of \.{mmo} format */
@d lop_quote 0x0 /* the quotation lopcode */
@d lop_loc 0x1 /* the location lopcode */
@d lop_skip 0x2 /* the skip lopcode */
@d lop_fixo 0x3 /* the octabyte-fix lopcode */
@d lop_fixr 0x4 /* the relative-fix lopcode */
@d lop_fixrx 0x5 /* extended relative-fix lopcode */
@d lop_file 0x6 /* the file name lopcode */
@d lop_line 0x7 /* the file position lopcode */
@d lop_spec 0x8 /* the special hook lopcode */
@d lop_pre 0x9 /* the preamble lopcode */
@d lop_post 0xa /* the postamble lopcode */
@d lop_stab 0xb /* the symbol table lopcode */
@d lop_end 0xc /* the end-it-all lopcode */
@y
@z

@x [7] l.92 Improve typography.
whenever an |int| has at least 32 bits.
@y
whenever type |int| has at least 32~bits.
@z

@x [7] l.94 Use standard C99 types.
@<Type...@>=
typedef unsigned char byte; /* a monobyte */
typedef unsigned int tetra; /* a tetrabyte */
typedef struct {@+tetra h,l;}@+octa; /* an octabyte */
@y
@z

@x [8] l.99 Use 'incr' from MMIX-ARITH.
@ The |incr| subroutine adds a signed integer to an (unsigned) octabyte.

@<Sub...@>=
octa incr @,@,@[ARGS((octa,int))@];
octa incr(o,delta)
  octa o;
  int delta;
{
  register tetra t;
  octa x;
  if (delta>=0) {
    t=0xffffffff-delta;
    if (o.l<=t) x.l=o.l+delta, x.h=o.h;
    else x.l=o.l-t-1, x.h=o.h+1;
  } else {
    t=-delta;
    if (o.l>=t) x.l=o.l-t, x.h=o.h;
    else x.l=o.l+(0xffffffff+delta)+1, x.h=o.h-1;
  }
  return x;
}
@y
@ We had better check that our 32-bit assumption holds.

@<Initialize e...@>=
if (shift_left(neg_one,1).h!=0xffffffff) {
  fprintf(stderr,"Panic: Incorrect implementation of type tetra!\n");
@.Incorrect implementation...@>
  exit(-8);
}
@z

@x [9] l.124
and pack them into a tetrabyte, instead of reading a single tetrabyte.
@y
and pack them into a tetrabyte, instead of reading a single tetrabyte.

@d y buf[2] /* the next-to-least significant byte */
@d z buf[3] /* the least significant byte */
@z
@x [9] l.127 C99 prototypes for C2x.
void read_tet @,@,@[ARGS((void))@];
void read_tet()
@y
void read_tet(void)
@z
@x [9] l.135
  yz=(buf[2]<<8)+buf[3];
@y
  yz=(y<<8)+z;
@z

@x [10] l.142 C99 prototypes for C2x.
byte read_byte @,@,@[ARGS((void))@];
byte read_byte()
@y
byte read_byte(void)
@z

@x [13] l.172 Fix glitch with 'cweave -f'.
   @t\4@>@<Cases for lopcodes in the main loop@>@;
@y
 @/@t\4@>@<Cases for lopcodes in the main loop@>@;
@z

@x [13] l.176
  if (listing) @<List |tet| as a normal item@>;
@y
  if (listing) @<List \9{t}|tet| as a normal item@>;
@z

@x [15] l.190
@<List |tet| as a normal item@>=
@y
@<List \9{t}|tet| as a normal item@>=
@z

@x [17] l.217 Compound literal.
cur_loc.h=cur_loc.l=0;
@y
cur_loc=zero_octa;
@z

@x [18] l.225
@d y buf[2] /* the next-to-least significant byte */
@d z buf[3] /* the least significant byte */

@y
@z

@x [20] l.281
     *p=buf[0];@+*(p+1)=buf[1];@+*(p+2)=buf[2];@+*(p+3)=buf[3];
@y
     memcpy(p,buf,4);
@z

@x [21] l.302
 while(1) {
@y
 while (true) {
@z

@x [22] l.316
case lop_post: postamble=1;
@y
case lop_post: postamble=true;
@z

@x [26] l.386 C99 prototypes for C2x.
void print_stab @,@,@[ARGS((void))@];
void print_stab()
@y
void print_stab(void)
@z

@x [30] l.457 Change from MMIX home.
else if (count!=stab_start+yz+1)
  fprintf(stderr,"YZ field at lop_end should have been %d!\n",count-yz-1);
@y
else if (count-stab_start-1!=yz)
  fprintf(stderr,"YZ field at lop_end should have been %d!\n",count-stab_start-1);
@z
