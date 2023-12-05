@x [0] l.9 CWEB 3.5 learned this.
@s bool int
@y
@z

@x [2] l.29 Improved typography.
the module called \.{mmix-config}. The program file is either
@y
the module called {\mc MMIX-CONFIG}. The program file is either
@z

@x [2] l.39 Improved module structure with interfaces.
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mmix-pipe.h"
@y
#include "mmix-arith.h" /* |@!zero_octa|, |@!neg_one|, |@!incr| */
#include "mmix-config.h" /* |@!MMIX_config| */
#include "mmix-io.h" /* |@!mmix_io_init| */
#include "mmix-pipe.h" /* |@!MMIX_init|, |@!read_hex| et al. */
@#
#include <string.h> /* |@!strlen| */
@#
@h
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

@x [2] l.48 C99 prototypes for C2x.
int main(argc,argv)
  int argc;
  char *argv[];
@y
int main(
  int argc,
  char *argv[])
@z

@x [3] l.76 Use 'panic' macro.
if (argc!=n+2) {
  fprintf(stderr,"Usage: %s [-s] configfile progfile\n",argv[0]);
@.Usage: ...@>
  exit(-3);
}
@y
if (argc!=n+2)
  panic(-3,"Usage: %s [-s] configfile progfile\n",argv[0]);
@.Usage: ...@>
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

@x [6] l.124 Use 'panic' macro.
  if (!prog_file) {
    fprintf(stderr,"Panic: Can't open MMIX hexadecimal file %s!\n",prog_file_name);
@.Can't open...@>
    exit(-3);
  }
@y
  if (!prog_file)
    panic(-3,"Panic: Can't open MMIX hexadecimal file %s!\n",prog_file_name);
@.Can't open...@>
@z

@x [6] l.132 Use 'panic' macro.
    if (buffer[strlen(buffer)-1]!='\n') {
      fprintf(stderr,"Panic: Hexadecimal file line too long: `%s...'!\n",buffer);
@.Hexadecimal file line...@>
      exit(-3);
    }
@y
    if (buffer[strlen(buffer)-1]!='\n')
      panic(-3,"Panic: Hexadecimal file line too long: `%s...'!\n",buffer);
@.Hexadecimal file line...@>
@z

@x [6] l.139 Use 'panic' macro.
    else {
      fprintf(stderr,"Panic: Improper hexadecimal file line: `%s'!\n",buffer);
@.Improper hexadecimal...@>
      exit(-3);
    }
@y
    else
      panic(-3,"Panic: Improper hexadecimal file line: `%s'!\n",buffer);
@.Improper hexadecimal...@>
@z

@x [7] l.149 Use 'panic' macro.
  if (sscanf(buffer,"%4x%8x",&cur_loc.h,&cur_loc.l)!=2) {
    fprintf(stderr,"Panic: Improper hexadecimal file location: `%s'!\n",buffer);
@.Improper hexadecimal...@>
    exit(-3);
  }
@y
  if (sscanf(buffer,"%4x%8x",&cur_loc.h,&cur_loc.l)!=2)
    panic(-3,"Panic: Improper hexadecimal file location: `%s'!\n",buffer);
@.Improper hexadecimal...@>
@z

@x [8] l.159 Use 'panic' macro.
  if (sscanf(buffer+1,"%8x%8x",&cur_dat.h,&cur_dat.l)!=2) {
    fprintf(stderr,"Panic: Improper hexadecimal file data: `%s'!\n",buffer);
@.Improper hexadecimal...@>
    exit(-3);
  }
@y
  if (sscanf(buffer+1,"%8x%8x",&cur_dat.h,&cur_dat.l)!=2)
    panic(-3,"Panic: Improper hexadecimal file data: `%s'!\n",buffer);
@.Improper hexadecimal...@>
@z

@x [9] l.197 Use 'panic' macro.
  if (!prog_file) {
    fprintf(stderr,"Panic: Can't open MMIX binary file %s!\n",prog_file_name);
@.Can't open...@>
    exit(-3);
  }
@y
  if (!prog_file)
    panic(-3,"Panic: Can't open MMIX binary file %s!\n",prog_file_name);
@.Can't open...@>
@z

@x [10] l.220 Purge a few 'goto's.
@<Sub...@>=
static bool undump_octa @,@,@[ARGS((void))@];@+@t}\6{@>
static bool undump_octa()
@y
@d oops { @+
  fprintf(stderr,"Premature end of file on %s!\n",prog_file_name); @+
@.Premature end of file...@>
  return false; @+ }

@<Sub...@>=
static bool undump_octa(void)
@z

@x [10] l.226 Purge a few 'goto's.
  t1=fgetc(prog_file);@+ if (t1==EOF) goto oops;
  t2=fgetc(prog_file);@+ if (t2==EOF) goto oops;
  t3=fgetc(prog_file);@+ if (t3==EOF) goto oops;
  cur_dat.h=(t0<<24)+(t1<<16)+(t2<<8)+t3;
  t0=fgetc(prog_file);@+ if (t0==EOF) goto oops;
  t1=fgetc(prog_file);@+ if (t1==EOF) goto oops;
  t2=fgetc(prog_file);@+ if (t2==EOF) goto oops;
  t3=fgetc(prog_file);@+ if (t3==EOF) goto oops;
  cur_dat.l=(t0<<24)+(t1<<16)+(t2<<8)+t3;
  return true;
oops: fprintf(stderr,"Premature end of file on %s!\n",prog_file_name);
@.Premature end of file...@>
  return false;
@y
  t1=fgetc(prog_file);@+ if (t1==EOF) oops;
  t2=fgetc(prog_file);@+ if (t2==EOF) oops;
  t3=fgetc(prog_file);@+ if (t3==EOF) oops;
  cur_dat.h=(t0<<24)+(t1<<16)+(t2<<8)+t3;
  t0=fgetc(prog_file);@+ if (t0==EOF) oops;
  t1=fgetc(prog_file);@+ if (t1==EOF) oops;
  t2=fgetc(prog_file);@+ if (t2==EOF) oops;
  t3=fgetc(prog_file);@+ if (t3==EOF) oops;
  cur_dat.l=(t0<<24)+(t1<<16)+(t2<<8)+t3;
  return true;
@z

@x [11] l.249 Use 'panic' macro.
  if (bad_address) {
    fprintf(stderr,"Panic: Unsupported virtual address %08x%08x!\n",
@.Unsupported virtual address@>
                     cur_loc.h,cur_loc.l);
    exit(-5);
  }
@y
  if (bad_address)
    panic(-5,"Panic: Unsupported virtual address %08x%08x!\n",
@.Unsupported virtual address@>
                     cur_loc.h,cur_loc.l);
@z

@x [12] l.276 Use 'panic' macro.
if (cur_loc.h!=3) {
  fprintf(stderr,"Panic: MMIX binary file didn't set up the stack!\n");
@.MMIX binary file...@>
  exit(-6);
}
@y
if (cur_loc.h!=3)
  panic(-6,"Panic: MMIX binary file didn't set up the stack!\n");
@.MMIX binary file...@>
@z

@x [12] l.284 Change from MMIX home.
g[255].o=incr(cur_loc,-8); /* place to \.{UNSAVE} */
@y
g[255].o=incr(cur_loc,-8); /* place to \.{UNSAVE} */
@:g}{\|g (global registers)@>
@z

@x [12] l.290 Compound literal.
cur_dat.h=(RESUME<<24)+1, cur_dat.l=0, cur_loc.h=5, cur_loc.l=0;
@y
cur_dat=(octa){(RESUME<<24)+1, 0};@+ cur_loc=(octa){5, 0};
@z

@x [12] l.293 Compound literal.
cur_loc.h=6, cur_loc.l=8;
@y
cur_loc=(octa){6, 8};
@z

@x [12] l.295 Compound literal.
cur_dat.h=(GET<<24)+rQ, cur_dat.l=(PUTI<<24)+(rQ<<16), cur_loc.l=0;
@y
cur_dat=(octa){(GET<<24)+rQ, (PUTI<<24)+(rQ<<16)};@+ cur_loc.l=0;
@z

@x [12] l.297 Compound literal.
cur_dat.h=0, cur_dat.l=7; /* generate a PTE with \.{rwx} permission */
@y
cur_dat=(octa){0, 7}; /* generate a PTE with \.{rwx} permission */
@z

@x [13] l.374 Don't ignore return code from fgets().
  fgets(buffer,BUF_SIZE,stdin);
@y
  if (!fgets(buffer,BUF_SIZE,stdin)) break;
@z

@x [13] l.380 Improved typography.
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
so we had better move it ``down'' (together with the |static| variable~|d|
in the previous section).
Instead, we place some internal prototypes here.
We also have room for the variadic macro |panic| used in error situations.

@d panic(r,m,...) {@+fprintf(stderr,
  @[m @,@m __VA_OPT__(,) @,@, __VA_ARGS__@]);@+exit(r);@+}

@<Proto...@>=
static bool undump_octa(void);
static octa sl3(octa);
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
static octa sl3(y) /* shift left by 3 bits */
  octa y;
@y
static octa sl3( /* shift left by 3 bits */
  octa y)
@z

@x [20] l.494 Compound literal.
    y.h=yhl+ylh;@+ y.l<<=3;
@y
    y=(octa){yhl+ylh, y.l<<=3};
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
