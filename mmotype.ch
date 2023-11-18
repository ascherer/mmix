@x [1] l.14
@s tetra int
@y
@s tetra int
@s octa int
@z

@x [1] l.20 Use standard C99 types. Use MMIX-ARITH interface stuff.
#include <string.h>
@<Prototype preparations@>@;
@<Type definitions@>@;
@y
#include <string.h>
#include <stdint.h>
@#
#include "mmix-arith.h" /* |@!tetra|, |@!octa|;
  we do \\{not} link against \.{mmix-arith.o} */
@#
@<Type definition@>@;
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
@s uint8_t int
@<Type...@>=
typedef uint8_t byte; /* a monobyte */
@z

@x [8] l.102 C99 prototypes for C2x.
octa incr @,@,@[ARGS((octa,int))@];
octa incr(o,delta)
  octa o;
  int delta;
@y
octa incr(
  octa o,
  int delta)
@z

@x [8] l.111 Compound literal.
    if (o.l<=t) x.l=o.l+delta, x.h=o.h;
    else x.l=o.l-t-1, x.h=o.h+1;
@y
    if (o.l<=t) x=(octa){o.h, o.l+delta};
    else x=(octa){o.h+1, o.l-t-1};
@z

@x [8] l.115 Compound literal.
    if (o.l>=t) x.l=o.l-t, x.h=o.h;
    else x.l=o.l+(0xffffffff+delta)+1, x.h=o.h-1;
@y
    if (o.l>=t) x=(octa){o.h, o.l-t};
    else x=(octa){o.h-1, o.l+(0xffffffff+delta)+1};
@z

@x [9] l.127 C99 prototypes for C2x.
void read_tet @,@,@[ARGS((void))@];
void read_tet()
@y
void read_tet(void)
@z

@x [9] l.142 C99 prototypes for C2x.
byte read_byte @,@,@[ARGS((void))@];
byte read_byte()
@y
byte read_byte(void)
@z

@x [17] l.217 Compound literal.
cur_loc.h=cur_loc.l=0;
@y
cur_loc=(octa){0,0};
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

@x [39] l.457 Change from MMIX home.
else if (count!=stab_start+yz+1)
  fprintf(stderr,"YZ field at lop_end should have been %d!\n",count-yz-1);
@y
else if (count-stab_start-1!=yz)
  fprintf(stderr,"YZ field at lop_end should have been %d!\n",count-stab_start-1);
@z
