@x [0] l.7
@s octa int
@y
@s tetra int
@s octa int
@z

@x [1] l.25
#include <stdio.h>
#include "mmix-pipe.h" /* header file for all modules */
@y
#include "mmix-mem.h" /* we use our own interface first;
  see |@(mmix-mem.h@>| */
#include "mmix-pipe.h" /* |@!verbose| and much more */
@#
#include <stdio.h> /* |@!printf| */
@#
@z

@x [1] l.27
extern octa read_hex(); /* found in the main program module */
@y
@z

@x [1] l.30
extern octa shift_left @,@,@[ARGS((octa y,int s))@];
  /* $y\LL s$, $0\le s\le64$ */
extern octa shift_right @,@,@[ARGS((octa y,int s,int u))@];
  /* $y\GG s$, signed if |!u| */
@y
@z

@x [2] l.40
octa spec_read @,@,@[ARGS((octa,int))@];@+@t}\6{@>
@y
@z

@x [2] l.49
    fgets(buf,20,stdin);
@y
    if (fgets(buf,20,stdin)) {}
@z

@x l.53
case 0: val.l&=0xff;
case 1: val.l&=0xffff;
case 2: val.h=0;
@y
case 0: val.l&=0xff; @=/* fall through */@>@;
case 1: val.l&=0xffff; @=/* fall through */@>@;
case 2: val.h=0; @=/* fall through */@>@;
@z

@x [3] l.75
void spec_write @,@,@[ARGS((octa,octa,int))@];@+@t}\6{@>
@y
@z

Resolve cyclic dependency. Move function from mmmix.w here.

@x [5/6] l.99
@* Index.
@y
@ Here's a simple program to read an octabyte in hexadecimal notation
from a buffer. It changes the buffer by storing a null character
after the input.
@^radix conversion@>

@d BUF_SIZE 100

@c
octa read_hex(p)
  char *p;
{
  unsigned char d[BUF_SIZE];
  register int j,k;
  octa val;
  val.h=val.l=0;
  for (j=0;;j++) {
    if (p[j]>='0' && p[j]<='9') d[j]=p[j]-'0';
    else if (p[j]>='a' && p[j]<='f') d[j]=p[j]-'a'+10;
    else if (p[j]>='A' && p[j]<='F') d[j]=p[j]-'A'+10;
    else break;
  }
  p[j]='\0';
  for (j--,k=0;k<=j;k++) {
    if (k>=8) val.h+=d[j-k]<<(4*k-32);
    else val.l+=d[j-k]<<(4*k);
  }
  return val;
}

@ Here comes the exported interface of this {\mc MMIX-MEM} program module.

@(mmix-mem.h@>=
#ifndef MMIX_MEM_H
#define MMIX_MEM_H
@#
#include "mmix-arith.h" /* |@!ARGS|, |@!octa| */
@#
extern octa spec_read @,@,@[ARGS((octa,int))@];
  /* for memory mapped I/O */
extern void spec_write @,@,@[ARGS((octa,octa,int))@];
  /* likewise */
@#
extern octa read_hex @,@,@[ARGS((char *))@];
  /* see {\mc MMMIX} */
@#
#endif /* |MMIX_MEM_H| */

@* Index.
@z
