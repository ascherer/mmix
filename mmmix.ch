@x [0] l.9 CWEB 3.5 learned this.
@s bool int
@y
@z

@x [2] l.29 Improved typography.
the module called \.{mmix-config}. The program file is either
@y
the module called {\mc MMIX-CONFIG}. The program file is either
@z

@x [2] l.39 Improved module structure with intefaces.
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mmix-pipe.h"
@y
#include "mmix-arith.h" /* |@!zero_octa|, |@!neg_one|, |@!incr| */
#include "mmix-config.h" /* |@!MMIX_config| */
#include "mmix-io.h" /* |@!mmix_io_init| */
#include "mmix-mem.h" /* |@!read_hex| */
#include "mmix-pipe.h" /* |@!MMIX_init| et al. */
@#
#include <string.h> /* |@!strlen| */
@#
@h
@#
@z

@x [2] l.44 Untangle private stuff.
char *config_file_name, *prog_file_name;
@y
static char *config_file_name, *prog_file_name;
@z

@x [2] l.46 Prototypes.
@<Subroutines@>@;
@y
@<Prototypes@>@;
@<Subroutines@>@;
@z

@x [5] l.115 Untangle private stuff.
octa cur_loc;
octa cur_dat;
bool new_chunk;
char buffer[BUF_SIZE];
FILE *prog_file;
@y
static octa cur_loc;
static octa cur_dat;
static bool new_chunk;
static char buffer[BUF_SIZE];
static FILE *prog_file;
@z

@x [10] l.221
static bool undump_octa @,@,@[ARGS((void))@];@+@t}\6{@>
@y
@z

@x [12] l.284 Change from MMIX home.
g[255].o=incr(cur_loc,-8); /* place to \.{UNSAVE} */
@y
g[255].o=incr(cur_loc,-8); /* place to \.{UNSAVE} */
@:g}{\|g (global registers)@>
@z

@x [13] l.374 Don't ignore return code from fgets().
  fgets(buffer,BUF_SIZE,stdin);
@y
  if (!fgets(buffer,BUF_SIZE,stdin)) break;
@z

@x [13} l.380 Improved typography.
  @<Cases for interaction@>@;
@y
  @t\4@>@<Cases for interaction@>@;
@z

@x [15] l.424 Change from MMIX home.
    g[rK].o.h&=-2; /* disable interrupts on |P_BIT| */
@y
    g[rK].o.h&=-2; /* disable interrupts on |P_BIT| */
@:g}{\|g (global registers)@>
@z

@x [16,17] l.430 Avoid cyclic dependeny. Move this part to MMIX-MEM.
int n,m; /* temporary integer */
octa bp={-1,-1}; /* breakpoint */
octa tmp; /* an octabyte of temporary interest */
static unsigned char d[BUF_SIZE];

@ Here's a simple program to read an octabyte in hexadecimal notation
from a buffer. It changes the buffer by storing a null character
after the input.
@^radix conversion@>

@<Sub...@>=
octa read_hex @,@,@[ARGS((char *))@];@+@t}\6{@>
octa read_hex(p)
  char *p;
{
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
@y
static int n,m; /* temporary integer */
static octa bp={-1,-1}; /* breakpoint */
static octa tmp; /* an octabyte of temporary interest */

@ Function |read_hex| is used in {\mc MMIX-MEM} (referenced as |extern|),
so we had better move it ``up'' (together with the |static| variable~|d|
in the previous section). Instead, we place some internal prototypes here.

@<Proto...@>=
static bool undump_octa @,@,@[ARGS((void))@];
static octa sl3 @,@,@[ARGS((octa))@];
@z

@x [18] l.469 Change from MMIX home.
  printf("  l[%d]=%08x%08x\n",n,l[n].o.h,l[n].o.l);@+continue;
@y
  printf("  l[%d]=%08x%08x\n",n,l[n].o.h,l[n].o.l);@+continue;
@:l}{\|l (ring of local registers)@>
@z

@x [19] l.475 Change from MMIX home.
examining the pipeline.
@y
examining the pipeline.
@:g}{\|g (global registers)@>
@z

@x [20] l.489
static octa sl3 @,@,@[ARGS((octa))@];@+@t}\6{@>
@y
@z

@x [21] l.505 Change from MMIX home.
case 'i':@+ if (sscanf(buffer+1,"%d",&n)==1) g[rI].o=incr(zero_octa,n);
@y
case 'i':@+ if (sscanf(buffer+1,"%d",&n)==1) g[rI].o=incr(zero_octa,n);
@:g}{\|g (global registers)@>
@z

@x [22] l.511 RAII.
   register fetch* new_tail;
   if (tail==fetch_bot) new_tail=fetch_top;
   else new_tail=tail-1;
@y
   register fetch* new_tail=tail==fetch_bot?fetch_top:tail-1;
@z

@x [23] l.537 Change from MMIX home.
   g[rK].o=neg_one;
@y
   g[rK].o=neg_one;
@:g}{\|g (global registers)@>
@z

@x [25] l.556 Untangle private stuff from MMIX-ARITH.
bool silent=false;
bool bad_address;
extern bool page_bad;
extern octa page_mask;
extern int page_r,page_s,page_b[5];
extern octa zero_octa;
extern octa neg_one;
octa seven_octa={0,7};
extern octa incr @,@,@[ARGS((octa y,int delta))@];
  /* unsigned $y+\delta$ ($\delta$ is signed) */
extern void mmix_io_init @,@,@[ARGS((void))@];
extern void MMIX_config @,@,@[ARGS((char*))@];
@y
static bool silent=false;
static bool bad_address;
static octa seven_octa={0,7};
@z
