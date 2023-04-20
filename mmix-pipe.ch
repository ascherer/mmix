@x l.10
@s bool normal @q unreserve a C++ keyword @>
@y
@z

@x [3] l.128
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "abstime.h"
@y
@#
@#
#include "mmix-pipe.h" /* we use our own interface first;
  see |@(mmix-pipe.h@>| */
#include "mmix-mem.h" /* |@!spec_read|, |@!spec_write| */
#include "mmix-io.h" /* |@!mmix_fopen|, |@!mmix_fclose|, etc. */
@#
@z

@x [3] l.130
@<Header definitions@>@;
@<Type definitions@>@;
@y
@z

@x [3] l.335
@<External prototypes@>@;
@y
@z

@x [5] l.152
@(mmix-pipe.h@>=
@y
@(mmix-pipe.h@>=
#ifndef MMIX_PIPE_H
#define MMIX_PIPE_H
#include <math.h> /* we'll override |fsqrt| below */
#include <stdlib.h> /* we'll override |div| and |random| below */
#include "mmix-arith.h" /* |@!tetra|, |@!octa|, etc. */
@z

@x [5] l.157
@<External prototypes@>@;
@y
@<External prototypes@>@;
#undef Extern
#endif /* |MMIX_PIPE_H| */
@z

@x [6] l.161
The following preprocessor commands make this work correctly with both
new-style and old-style compilers.
@^prototypes for functions@>

@<Header def...@>=
#ifdef __STDC__
#define ARGS(list) list
#else
#define ARGS(list) ()
#endif
@y
@z

@x [10] l.229
  @<Local variables@>;
@y
  @<Local variables@>; (void)breakpoint_hit;
@z

@x l.256
 cease:;
@y
@z

@x [11] l.259
@ @<Type...@>=
typedef enum {@!false, @!true, @!wow}@+bool; /* slightly extended booleans */
@y
@ (This section remains empty for historic reasons.)
@z

@x [17] l.326
for the assembler and for the non-pipelined simulator. The
definition of type \&{tetra} should be changed, if necessary, to conform with
the definitions found there.
@^system dependencies@>

@<Type...@>=
typedef unsigned int tetra;
  /* for systems conforming to the LP-64 data model */
typedef struct { tetra h,l;} octa; /* two tetrabytes make one octabyte */
@y
for the assembler and for the non-pipelined simulator.
@s uint32_t int
@s tetra int
@s octa int
@z

@x [20] l.347
@ @<Glob...@>=
extern octa zero_octa; /* |zero_octa.h=zero_octa.l=0| */
extern octa neg_one; /* |neg_one.h=neg_one.l=-1| */
extern octa aux; /* auxiliary output of a subroutine */
extern bool overflow; /* set by certain subroutines for signed arithmetic */
extern int exceptions; /* bits set by floating point operations */
extern int cur_round; /* the current rounding mode */
@y
@ (This section remains empty for historic reasons.)
@z

@x [21] l.361
@<Sub...@>=
extern octa oplus @,@,@[ARGS((octa y,octa z))@];
  /* unsigned $y+z$ */
extern octa ominus @,@,@[ARGS((octa y,octa z))@];
  /* unsigned $y-z$ */
extern octa incr @,@,@[ARGS((octa y,int delta))@];
  /* unsigned $y+\delta$ ($\delta$ is signed) */
extern octa oand @,@,@[ARGS((octa y,octa z))@];
  /* $y\land z$ */
extern octa oandn @,@,@[ARGS((octa y,octa z))@];
  /* $y\land \bar z$ */
extern octa shift_left @,@,@[ARGS((octa y,int s))@];
  /* $y\LL s$, $0\le s\le64$ */
extern octa shift_right @,@,@[ARGS((octa y,int s,int u))@];
  /* $y\GG s$, signed if |!u| */
extern octa omult @,@,@[ARGS((octa y,octa z))@];
  /* unsigned $(|aux|,x)=y\times z$ */
extern octa signed_omult @,@,@[ARGS((octa y,octa z))@];
  /* signed $x=y\times z$, setting |overflow| */
extern octa odiv @,@,@[ARGS((octa x,octa y,octa z))@];
  /* unsigned $(x,y)/z$; $|aux|=(x,y)\bmod z$ */
extern octa signed_odiv @,@,@[ARGS((octa y,octa z))@];
  /* signed $y/z$, when $z\ne0$; $|aux|=y\bmod z$ */
extern int count_bits @,@,@[ARGS((tetra z))@];
  /* $x=\nu(z)$ */
extern tetra byte_diff @,@,@[ARGS((tetra y,tetra z))@];
  /* half of \.{BDIF} */
extern tetra wyde_diff @,@,@[ARGS((tetra y,tetra z))@];
  /* half of \.{WDIF} */
extern octa bool_mult @,@,@[ARGS((octa y,octa z,bool xor))@];
  /* \.{MOR} or \.{MXOR} */
extern octa load_sf @,@,@[ARGS((tetra z))@];
  /* load short float */
extern tetra store_sf @,@,@[ARGS((octa x))@];
  /* store short float */
extern octa fplus @,@,@[ARGS((octa y,octa z))@];
  /* floating point $x=y\oplus z$ */
extern octa fmult @,@,@[ARGS((octa y ,octa z))@];
  /* floating point $x=y\otimes z$ */
extern octa fdivide @,@,@[ARGS((octa y,octa z))@];
  /* floating point $x=y\oslash z$ */
extern octa froot @,@,@[ARGS((octa,int))@];
  /* floating point $x=\sqrt z$ */
extern octa fremstep @,@,@[ARGS((octa y,octa z,int delta))@];
  /* floating point $x\,{\rm rem}\,z=y\,{\rm rem}\,z$ */
extern octa fintegerize @,@,@[ARGS((octa z,int mode))@];
  /* floating point $x={\rm round}(z)$ */
extern int fcomp @,@,@[ARGS((octa y,octa z))@];
  /* $-1$, 0, 1, or 2 if $y<z$, $y=z$, $y>z$, $y\parallel z$ */
extern int fepscomp @,@,@[ARGS((octa y,octa z,octa eps,int sim))@];
  /* $x=|sim|?\ [y\sim z\ (\epsilon)]:\ [y\approx z\ (\epsilon)]$ */
extern octa floatit @,@,@[ARGS((octa z,int mode,int unsgnd,int shrt))@];
  /* fix to float */
extern octa fixit @,@,@[ARGS((octa z,int mode))@];
  /* float to fix */
@y
@z

@x [89] l.1865
(The macro \.{ABSTIME} is defined externally in the file \.{abstime.h},
which should have just been created by {\mc ABSTIME}\kern.05em;
{\mc ABSTIME} is
a trivial program that computes the value of the standard library function
|time(NULL)|. We assume that this number, which is the number of seconds in
@y
(The macro \.{ABSTIME} will be set to a numeric value at compilation-time in
\.{Makefile}. We assume that this number, which is the number of seconds in
@z

@x l.1874
@d VERSION 1 /* version of the \MMIX\ architecture that we support */
@y
@d ABSTIME /* number of seconds in “the epoch” */
@d VERSION 1 /* version of the \MMIX\ architecture that we support */
@z

@x [91] l.1902
    if (a.l<32) printf(special_name[a.l]);
@y
    if (a.l<32) printf("%s",special_name[a.l]);
@z

@x [111] l.2136
  if (mem_slots) mem_slots--;@+else goto stall;
@y
  { if (mem_slots) mem_slots--;@+else goto stall; }
@z

@x [120] l.2306
    new_O=incr(cool_O,-x-1);
@y
    new_O=incr(cool_O,-(int)x-1);
@z

@x l.2310
    if (x<new_L)
@y
    if (x<(unsigned int)new_L)
@z

@x [132] l.2519
  @<Cases for stage 1 execution@>;
@y
  @<Cases for stage 1 execution@>;
  default:@+; @=/* fall through */@>@;
@z

@x [157] l.2968
 case 0: b=o.h>>31;@+break; /* negative? */
@y
 default: case 0: b=o.h>>31;@+break; /* negative? */
@z

@x [187] l.3418
   return &s[l-aa];
  }
@y
   return &s[l-aa];
  }
  return NULL;
@z

@x [208] l.3724
@<Sub...@>=
extern octa spec_read @,@,@[ARGS((octa addr,int size))@];
 /* for memory mapped I/O */
extern void spec_write @,@,@[ARGS((octa addr,octa val,int size))@];
 /* likewise */
@y
@z

@x [236] l.4292
DTcache->filler_ctl.ptr_c=(void*)&DPTco[0];
@y
DTcache->filler_ctl.ptr_c=(void*)&DPTco[0];
@#
page_bad=true; /* variable delared below */
@z

@x [238] l.4329
convenience. Whenever rV changes, we recompute all these variables.

@<Glob...@>=
int page_n; /* the 10-bit |n| field of rV, times 8 */
int page_r; /* the 27-bit |r| field of rV */
int page_s; /* the 8-bit |s| field of rV */
int page_f; /* the 3-bit |f| field of rV */
int page_b[5]; /* the 4-bit |b| fields of rV; |page_b[0]=0| */
octa page_mask; /* the least significant |s| bits */
bool page_bad=true; /* does rV violate the rules? */
@y
convenience. Whenever rV changes, we recompute all these variables.

@<External var...@>=
Extern int page_n; /* the 10-bit |n| field of rV, times 8 */
Extern int page_r; /* the 27-bit |r| field of rV */
Extern int page_s; /* the 8-bit |s| field of rV */
Extern int page_f; /* the 3-bit |f| field of rV */
Extern int page_b[5]; /* the 4-bit |b| fields of rV; |page_b[0]=0| */
Extern octa page_mask; /* the least significant |s| bits */
Extern bool page_bad; /* does rV violate the rules? */
@z

@x [257] l.4621
    if (ticks.l-write_head->stamp<holding_time && !speed_lock)
@y
    if (ticks.l-write_head->stamp<(tetra)holding_time && !speed_lock)
@z

@x [269] l.4855
if (((data->z.o.l<<PROT_OFFSET)&j)!=j) {
@y
if (((data->z.o.l<<PROT_OFFSET)&j)!=(tetra)j) {
@z

@x [271] l.4901
  case st: data->state=st_ready;@+pass_after(1);@+goto passit;
@y
  case st: data->state=st_ready;@+pass_after(1);@+goto passit;
  default:@+; @=/* fall through */@>@;
@z

@x [272] l.4958
 case DT_miss:@+if (DTcache->filler.next)
     if (data->i==preld || data->i==prest) goto fin_ex;@+ else goto square_one;
   if (no_hardware_PT || page_f)
     if (data->i==preld || data->i==prest) goto fin_ex;@+else goto emulate_virt;
@y
 case DT_miss:@+if (DTcache->filler.next)
   { if (data->i==preld || data->i==prest) goto fin_ex;@+ else goto square_one; }
   if (no_hardware_PT || page_f)
   { if (data->i==preld || data->i==prest) goto fin_ex;@+else goto emulate_virt;}
@z

@x [275] l.5030
   ((data->y.o.l+(data->xx&(Dcache->bb-1))+1)^data->y.o.l)>=Dcache->bb)
@y
   ((data->y.o.l+(data->xx&(Dcache->bb-1))+1)^data->y.o.l)>=(tetra)(Dcache->bb))
@z

@x [279] l.5089
      if ((data->x.o.h&sign_bit)==0 || (data->x.o.l&0x1ff8)!=page_n)
@y
      if ((data->x.o.h&sign_bit)==0 || (data->x.o.l&0x1ff8)!=(tetra)page_n)
@z

@x l.5093
    case LDPTE>>1:@+if ((data->x.o.l&0x1ff8)!=page_n) data->x.o=zero_octa;
@y
    case LDPTE>>1:@+if ((data->x.o.l&0x1ff8)!=(tetra)page_n) data->x.o=zero_octa;
@z

@x [280] l.5105
   if (Dcache && Dcache->bb<data->b.o.l) data->b.o.l=Dcache->bb;
   goto do_syncid;
@y
   if (Dcache && (tetra)(Dcache->bb)<data->b.o.l) data->b.o.l=Dcache->bb;
   goto do_syncid;
 default:@+; @=/* fall through */@>@;
@z

@x [298] l.5349
 case IT_miss:@+if (ITcache->filler.next)
     if (data->i==prego) goto fin_ex;@+else wait(1);
@y
 case IT_miss:@+if (ITcache->filler.next) {
     if (data->i==prego) goto fin_ex;@+else wait(1); }
@z

@x l.5354
   if (!p) /* hey, it was present after all */
     if (data->i==prego) goto fin_ex;@+else goto new_fetch;
@y
   if (!p) /* hey, it was present after all */
     { if (data->i==prego) goto fin_ex;@+else goto new_fetch; }
@z

@x [348] l.6200
 case FCMPE:@+ if (j) goto cmp_zero_or_invalid;
@y
 case FCMPE:@+ if (j) goto cmp_zero_or_invalid;
 default:@+; @=/* fall through */@>@;
@z

@x [364] l.6458
   if (data->i==syncd) goto fin_ex;@+ else goto next_sync;
@y
   { if (data->i==syncd) goto fin_ex;@+ else goto next_sync; }
@z

@x [369] l.6519
  data->y.o.l &= -data->b.o.l;
@y
  data->y.o.l &= -(int)data->b.o.l;
@z

@x [376] l.6595
interfaces on which they depend.

@ @<Glob...@>=
extern octa mmix_fopen @,@,@[ARGS((unsigned char,octa,octa))@];
extern octa mmix_fclose @,@,@[ARGS((unsigned char))@];
extern octa mmix_fread @,@,@[ARGS((unsigned char,octa,octa))@];
extern octa mmix_fgets @,@,@[ARGS((unsigned char,octa,octa))@];
extern octa mmix_fgetws @,@,@[ARGS((unsigned char,octa,octa))@];
extern octa mmix_fwrite @,@,@[ARGS((unsigned char,octa,octa))@];
extern octa mmix_fputs @,@,@[ARGS((unsigned char,octa))@];
extern octa mmix_fputws @,@,@[ARGS((unsigned char,octa))@];
extern octa mmix_fseek @,@,@[ARGS((unsigned char,octa))@];
extern octa mmix_ftell @,@,@[ARGS((unsigned char))@];
extern void print_trip_warning @,@,@[ARGS((int,octa))@];
@y
interfaces on which they depend.

@ The following three functions are not declared in |@(mmix-pipe.h@>|, although
they are used in {\mc MMIX-IO}. Similar functions are defined in the simplified
\MMIX\ computer {\mc MMIX-SIM}.

@<Internal proto...@>=
int mmgetchars @,@,@[ARGS((char*,int,octa,int))@];
void mmputchars @,@,@[ARGS((unsigned char*,int,octa))@];
char stdin_chr @,@,@[ARGS((void))@];
@z

@x [377] l.6611
int mmgetchars @,@,@[ARGS((char*,int,octa,int))@];
void mmputchars @,@,@[ARGS((unsigned char*,int,octa))@];
char stdin_chr @,@,@[ARGS((void))@];
octa magic_read @,@,@[ARGS((octa))@];
void magic_write @,@,@[ARGS((octa,octa))@];
@y
static octa magic_read @,@,@[ARGS((octa))@];
static void magic_write @,@,@[ARGS((octa,octa))@];
@z

@x [378] l.6623
octa magic_read(addr)
@y
static octa magic_read(addr)
@z

@x [379] l.6656
void magic_write(addr,val)
@y
static void magic_write(addr,val)
@z

@x [387] l.6827
    fgets(stdin_buf,256,stdin);
@y
    if (fgets(stdin_buf,256,stdin)) {}
@z
