@x [0] l.10 Use standard C99 type.
@s bool normal @q unreserve a C++ keyword @>
@y
@z

@x [1] l.17 Improved typography.
file called \.{mmix\_pipe.h}. The header file is used by the main routine and
@y
file called |@(mmix-pipe.h@>|. The header file is used by the main routine and
@z

@x [1] l.20 Fix typo.
Readers of this program should be familiar with the explanation of \MMIX\
@y
Readers of this program should be familiar with the explanation of \MMIX's
@z

@x [3] l.128 Improved module structure with interfaces.
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "abstime.h"
@y
#include "mmix-pipe.h" /* we use our own interface first;
  see |@(mmix-pipe.h@>| */
#include "mmix-mem.h" /* |@!spec_read|, |@!spec_write| */
#include "mmix-io.h" /* |@!mmix_fopen|, |@!mmix_fclose|, etc. */
@#
@z

@x [3] l.130 Improved module structure with interfaces.
@<Header definitions@>@;
@<Type definitions@>@;
@y
@z

@x [3] l.335 Improved module structure with interfaces.
@<External prototypes@>@;
@y
@z

@x [5] l.152 Improved module structure with interfaces.
@(mmix-pipe.h@>=
@y
@(mmix-pipe.h@>=
#ifndef MMIX_PIPE_H
#define MMIX_PIPE_H
#include <math.h> /* we'll override |fsqrt| below */
#include <stdlib.h> /* we'll override |div| and |random| below */
#include "mmix-arith.h" /* |@!tetra|, |@!octa|, etc. */
@z

@x [5] l.157 Improved module structure with interfaces.
@<External prototypes@>@;
@y
@<External prototypes@>@;
#undef Extern
#endif /* |MMIX_PIPE_H| */
@z

@x [6] l.161 Stuff from MMIX-ARITH.
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

@x [10] l.229 GCC warning.
  @<Local variables@>;
@y
  @<Local variables@>;@+(void)breakpoint_hit;
@z

@x [10] l.256 Change from MMIX home.
 cease:;
@y
@z

@x [11] l.259 Use standard C99 type. ('wow' was never used anywhere.)
@ @<Type...@>=
typedef enum {@!false, @!true, @!wow}@+bool; /* slightly extended booleans */
@y
@ (This section remains empty for historic reasons.)
@z

@x [17] l.326 Stuff from MMIX-ARITH.
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

@x [20] l.347 Stuff from MMIX-ARITH.
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

@x [21] l.361 Stuff from MMIX-ARITH.
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

@x [52] l.1129 Change from MMIX home.
\.{UNSAVE} commands store and restore special registers 0--6 and 23--27,
followed by rG~(19) and rA~(21) packed into eight bytes.
@y
\.{UNSAVE} commands store and restore special registers 0--6 and 23--27,
followed by~19 and~21.
@z

@x [75] l.1620 Improved typography.
  if (head==fetch_bot) new_head=fetch_top;@+else new_head=head-1;
@y
  new_head=head==fetch_bot?fetch_top:head-1;
@z

@x [75] l.1630 Improved typography.
  if (cool==reorder_bot) new_cool=reorder_top;@+else new_cool=cool-1;
@y
  new_cool=cool==reorder_bot?reorder_top:cool-1;
@z

@x [89] l.1865 Different approach for ABSTIME.
(The macro \.{ABSTIME} is defined externally in the file \.{abstime.h},
which should have just been created by {\mc ABSTIME}\kern.05em;
{\mc ABSTIME} is
a trivial program that computes the value of the standard library function
|time(NULL)|. We assume that this number, which is the number of seconds in
@y
(The macro \.{ABSTIME} will be set to a numeric value at compilation-time in
\.{Makefile}. We assume that this number, which is the number of seconds in
@z

@x [89] l.1874 Different approach for ABSTIME.
@d VERSION 1 /* version of the \MMIX\ architecture that we support */
@y
@d ABSTIME /* number of seconds in “the epoch” */
@d VERSION 1 /* version of the \MMIX\ architecture that we support */
@z

@x [89] l.1876 Change from MMIX home.
@d SUBSUBVERSION 0 /* further qualification to version number */
@y
@d SUBSUBVERSION 2 /* further qualification to version number */
@z

@x [89] l.1883
  g[j].addr.h=sign_bit, g[j].addr.l=j, g[j].known=true;
@y
  g[j].addr=(octa){sign_bit, j}, g[j].known=true;
@z

@x [89] l.1887
g[rN].o.h=(VERSION<<24)+(SUBVERSION<<16)+(SUBSUBVERSION<<8);
g[rN].o.l=ABSTIME; /* see comment and warning above */
@y
g[rN].o=(octa){(VERSION<<24)+(SUBVERSION<<16)+(SUBSUBVERSION<<8),@|
  ABSTIME}; /* see comment and warning above */
@z

@x [89] l.1890
  l[j].addr.h=sign_bit, l[j].addr.l=256+j, l[j].known=true;
@y
  l[j].addr=(octa){sign_bit, 256+j}, l[j].known=true;
@z

@x [91] l.1902 Change from MMIX home.
    if (a.l<32) printf(special_name[a.l]);
@y
    if (a.l<32) printf("%s",special_name[a.l]);
@z

@x [101] l.2009 Improved typography.
@<Special cases of instruction dispatch@>@;
@y
@t\4@>@<Special cases of instruction dispatch@>@;
@z

@x [111] l.2135 Change from MMIX home.
if (rename_regs<cool->ren_x+cool->ren_a) goto stall;
if (cool->mem_x)
  if (mem_slots) mem_slots--;@+else goto stall;
rename_regs-=cool->ren_x+cool->ren_a;
@y
if (rename_regs<(cool->ren_x?1:0)+(cool->ren_a?1:0)) goto stall;
if (cool->mem_x)
  { if (mem_slots) mem_slots--;@+else goto stall; }
rename_regs-=(cool->ren_x?1:0)+(cool->ren_a?1:0);
@z

@x [116] l.2222
mem.addr.h=mem.addr.l=-1;
@y
mem.addr=neg_one;
@z

@x [119] l.2278
  cool->x.known=true, cool->x.o.h=0, cool->x.o.l=x;
@y
  cool->x.known=true, cool->x.o=(octa){0, x};
@z

@x [120] l.2306 Change from MMIX home.
    new_O=incr(cool_O,-x-1);
@y
    new_O=incr(cool_O,-(int)x-1);
@z

@x [120] l.2310 Change from MMIX home.
    if (x<new_L)
@y
    if (x<(unsigned int)new_L)
@z

@x [130] l.2473 Improved typography.
  @<Special cases for states in the first stage@>;
@y
  @t\4@>@<Special cases for states in the first stage@>;
@z

@x [132] l.2517 Improved typography.
  @<Cases to compute the results of register-to-register operation@>;
  @<Cases to compute the virtual address of a memory operation@>;
  @<Cases for stage 1 execution@>;
@y
  @t\4@>@<Cases to compute the results of register-to-register operation@>;
  @t\4@>@<Cases to compute the virtual address of a memory operation@>;
  @t\4@>@<Cases for stage 1 execution@>;
  default:@+;
@z

@x [135] l.2572 Improved typography.
  @<Special cases for states in later stages@>;
@y
  @t\4@>@<Special cases for states in later stages@>;
@z

@x [25] l.2603
case and: data->x.o.h=data->y.o.h & data->z.o.h;
   data->x.o.l=data->y.o.l & data->z.o.l; break;
case andn: data->x.o.h=data->y.o.h &~data->z.o.h;
   data->x.o.l=data->y.o.l &~data->z.o.l; break;
@y
case and: data->x.o=oand(data->y.o, data->z.o); break;
case andn: data->x.o=oandn(data->y.o, data->z.o); break;
@z

@x [25] l.2609
case xor: data->x.o.h=data->y.o.h ^ data->z.o.h;
   data->x.o.l=data->y.o.l ^ data->z.o.l; break;
@y
case xor: data->x.o=oxor(data->y.o, data->z.o); break;
@z

@x [142] l.2666
case mux: data->x.o.h=(data->y.o.h&data->b.o.h)+(data->z.o.h&~data->b.o.h);
          data->x.o.l=(data->y.o.l&data->b.o.l)+(data->z.o.l&~data->b.o.l);
@y
case mux: data->x.o=(octa){(data->y.o.h&data->b.o.h)+(data->z.o.h&~data->b.o.h),@|
          (data->y.o.l&data->b.o.l)+(data->z.o.l&~data->b.o.l)};
@z

@x [157] l.2968 Change from MMIX home.
 case 0: b=o.h>>31;@+break; /* negative? */
@y
 default: case 0: b=o.h>>31;@+break; /* negative? */
@z

@x [179] l.3325
  p->tag.h=sign_bit, p->tag.l=0;
@y
  p->tag=(octa){sign_bit, 0};
@z

@x [187] l.3418 Change from MMIX home.
  panic(confusion("lru victim")); /* what happened? nobody has rank zero */
@y
 default:  panic(confusion("lru victim")); /* what happened? nobody has rank zero */
@z

@x [193] l.3496 RAII.
  register cacheset s;
  register cacheblock* p;
  s=cache_addr(c,alf); /* the set corresponding to |alf| */
@y
  register cacheblock* p;
  register cacheset s=cache_addr(c,alf); /* the set corresponding to |alf| */
@z

@x [208] l.3724 Stuff from MMIX-MEM.
@<Sub...@>=
extern octa spec_read @,@,@[ARGS((octa addr,int size))@];
 /* for memory mapped I/O */
extern void spec_write @,@,@[ARGS((octa addr,octa val,int size))@];
 /* likewise */
@y
@z

@x [216] l.3838 RAII.
  register int del=c->gg>>3; /* octabytes per granule */
  octa addr;
  addr=c->outbuf.tag;@+ off=(addr.l&0xffff)>>3;
@y
  register int del=c->gg>>3; /* octabytes per granule */
  octa addr=c->outbuf.tag;@+ off=(addr.l&0xffff)>>3;
@z

@x [219] l.3921
  addr.h=c->outbuf.tag.h;@+ addr.l=c->outbuf.tag.l&-Scache->bb;
@y
  addr=(octa){c->outbuf.tag.h, c->outbuf.tag.l&-Scache->bb};
@z

@x [221] l.3942
Scache->outbuf.tag.h=c->outbuf.tag.h;
Scache->outbuf.tag.l=c->outbuf.tag.l&(-Scache->bb);
@y
Scache->outbuf.tag=(octa){c->outbuf.tag.h, c->outbuf.tag.l&(-Scache->bb)};
@z

@x [232] l.4137 Improved typography.
@<Cases 0 through 4, for the D-cache@>;
@<Cases 5 through 9, for the S-cache@>;
@y
@t\4@>@<Cases 0 through 4, for the D-cache@>;
@t\4@>@<Cases 5 through 9, for the S-cache@>;
@z

@x [233] l.4152
  data->y.o.h=i, data->y.o.l=j;
@y
  data->y.o=(octa){i, j};
@z

@x [235} l.4199
  data->y.o.h=i, data->y.o.l=j;
@y
  data->y.o=(octa){i, j};
@z

@x [236] l.4292
DTcache->filler_ctl.ptr_c=(void*)&DPTco[0];
@y
DTcache->filler_ctl.ptr_c=(void*)&DPTco[0];
@#
page_bad=true; /* variable delared below */
@z

@x [238] l.4329 Exported variables.
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

@x [239] l.4341 RAII.
{@+octa rv;
  rv=data->z.o;
@y
{@+octa rv=data->z.o;
@z

@x [239] l.4350
  else if (page_s<32) page_mask.h=0,page_mask.l=(1<<page_s)-1;
  else page_mask.h=(1<<(page_s-32))-1,page_mask.l=0xffffffff;
@y
  else if (page_s<32) page_mask=(octa){0, (1<<page_s)-1};
  else page_mask=(octa){(1<<(page_s-32))-1, 0xffffffff};
@z

@x [241] l.4370 RAII.
{@+octa t;
  t=oandn(trans,page_mask); /* zero out the \\{ynp} fields of a PTE */
@y
{@+octa t=oandn(trans,page_mask); /* zero out the \\{ynp} fields of a PTE */
@z

@x [243] l.4395
  co[2*j].ctl->z.o.h=0, co[2*j].ctl->z.o.l=(aaaaa.l&0x3ff)<<3;
@y
  co[2*j].ctl->z.o=(octa){0, (aaaaa.l&0x3ff)<<3};
@z

@x [257] l.4621 Change from MMIX home.
    if (ticks.l-write_head->stamp<holding_time && !speed_lock)
@y
    if (ticks.l-write_head->stamp<(tetra)holding_time && !speed_lock)
@z

@x [259] l.4649
Dcache->outbuf.tag.h=write_head->addr.h;
Dcache->outbuf.tag.l=write_head->addr.l&(-Dcache->bb);
@y
Dcache->outbuf.tag=(octa){write_head->addr.h,
  write_head->addr.l&(-Dcache->bb)};
@z

@x [269] l.4855 Change from MMIX home.
if (((data->z.o.l<<PROT_OFFSET)&j)!=j) {
@y
if (((data->z.o.l<<PROT_OFFSET)&j)!=(tetra)j) {
@z

@x [271] l.4901 Change from MMIX home.
  case st: data->state=st_ready;@+pass_after(1);@+goto passit;
@y
  case st: default: data->state=st_ready;@+pass_after(1);@+goto passit;
@z

@x [272] l.4958 Change from MMIX home.
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

@x [275] l.5030 Change from MMIX home.
   ((data->y.o.l+(data->xx&(Dcache->bb-1))+1)^data->y.o.l)>=Dcache->bb)
@y
   ((data->y.o.l+(data->xx&(Dcache->bb-1))+1)^data->y.o.l)>=(tetra)(Dcache->bb))
@z

@x [279] l.5089 Change from MMIX home.
      if ((data->x.o.h&sign_bit)==0 || (data->x.o.l&0x1ff8)!=page_n)
@y
      if ((data->x.o.h&sign_bit)==0 || (data->x.o.l&0x1ff8)!=(tetra)page_n)
@z

@x [279] l.5093 Change from MMIX home.
    case LDPTE>>1:@+if ((data->x.o.l&0x1ff8)!=page_n) data->x.o=zero_octa;
@y
    case LDPTE>>1:@+if ((data->x.o.l&0x1ff8)!=(tetra)page_n) data->x.o=zero_octa;
@z

@x [280] l.5105 GCC warning. Change from MMIX home.
   if (Dcache && Dcache->bb<data->b.o.l) data->b.o.l=Dcache->bb;
   goto do_syncid;
@y
   if (Dcache && (tetra)(Dcache->bb)<data->b.o.l) data->b.o.l=Dcache->bb;
   @=/* fall through */@>@;
 default: goto do_syncid;
@z

@x [282] l.5141 Change from MMIX home.
  if (!(data->op&2)) {@+octa before,after;
    before=data->b.o;@+after=shift_right(shift_left(data->b.o,i),i,0);
@y
  if (!(data->op&2)) {
    octa before=data->b.o;
    octa after=shift_right(shift_left(data->b.o,i),i,0);
@z

@x [288] l.5238 Improved typography.
  @<Other cases for the fetch coroutine@>@;
@y
  @t\4@>@<Other cases for the fetch coroutine@>@;
@z

@x [297] l.5334 RAII.
{@+octa addr;
  addr=data->z.o;
@y
{@+octa addr=data->z.o;
@z

@x [298] l.5349 Change from MMIX home.
 case IT_miss:@+if (ITcache->filler.next)
     if (data->i==prego) goto fin_ex;@+else wait(1);
@y
 case IT_miss:@+if (ITcache->filler.next) {
     if (data->i==prego) goto fin_ex;@+else wait(1); }
@z

@x [290] l.5354 Change from MMIX home.
   if (!p) /* hey, it was present after all */
     if (data->i==prego) goto fin_ex;@+else goto new_fetch;
@y
   if (!p) /* hey, it was present after all */
     { if (data->i==prego) goto fin_ex;@+else goto new_fetch; }
@z

@x [301] l.5403 RAII.
    register fetch *new_tail;
    if (tail==fetch_bot) new_tail=fetch_top;
    else new_tail=tail-1;
@y
    register fetch *new_tail=tail==fetch_bot?fetch_top:tail-1;
@z

@x [338] l.6029
cool->x.known=true, cool->x.o.h=0, cool->x.o.l=cool_L;
@y
cool->x.known=true, cool->x.o=(octa){0, cool_L};
@z

@x [342] l.6065
    data->x.o.h=g[rG].o.l<<24;
    data->x.o.l=g[rA].o.l;
@y
    data->x.o=(octa){g[rG].o.l<<24, g[rA].o.l};
@z

@x [344] l.6106
case bdif: data->x.o.h=byte_diff(data->y.o.h,data->z.o.h);
           data->x.o.l=byte_diff(data->y.o.l,data->z.o.l);@+ break;
case wdif: data->x.o.h=wyde_diff(data->y.o.h,data->z.o.h);
           data->x.o.l=wyde_diff(data->y.o.l,data->z.o.l);@+ break;
@y
case bdif: data->x.o=(octa){byte_diff(data->y.o.h,data->z.o.h),
                            byte_diff(data->y.o.l,data->z.o.l)};@+ break;
case wdif: data->x.o=(octa){wyde_diff(data->y.o.h,data->z.o.h),
                            wyde_diff(data->y.o.l,data->z.o.l)};@+ break;
@z

@x [348] l.6199 Change from MMIX home.
 case FEQLE: goto cmp_fin;
@y
 case FEQLE: default: goto cmp_fin;
@z

@x [353] l.6209
  data->z.o.h=0, data->z.o.l=data->y.o.l&0x7;
@y
  data->z.o=(octa){0, data->y.o.l&0x7};
@z

@x [364] l.6458 Change from MMIX home.
   if (data->i==syncd) goto fin_ex;@+ else goto next_sync;
@y
   { if (data->i==syncd) goto fin_ex;@+ else goto next_sync; }
@z

@x [369] l.6519 Change from MMIX home.
  data->y.o.l &= -data->b.o.l;
@y
  data->y.o.l &= -(int)data->b.o.l;
@z

@x [372] l.6566 Change from MMIX home.
case Fopen: g[rBB].o=mmix_fopen(zz,mb,ma);@+break;
@y
case Fopen: g[rBB].o=mmix_fopen(zz,mb,ma,mmgetchars);@+break;
@z

@x [372] l.6568 Decouple 'mixins'.
case Fread: g[rBB].o=mmix_fread(zz,mb,ma);@+break;
case Fgets: g[rBB].o=mmix_fgets(zz,mb,ma);@+break;
case Fgetws: g[rBB].o=mmix_fgetws(zz,mb,ma);@+break;
case Fwrite: g[rBB].o=mmix_fwrite(zz,mb,ma);@+break;
case Fputs: g[rBB].o=mmix_fputs(zz,g[rBB].o);@+break;
case Fputws: g[rBB].o=mmix_fputws(zz,g[rBB].o);@+break;
@y
case Fread: g[rBB].o=mmix_fread(zz,mb,ma,mmputchars,stdin_chr);@+break;
case Fgets: g[rBB].o=mmix_fgets(zz,mb,ma,mmputchars,stdin_chr);@+break;
case Fgetws: g[rBB].o=mmix_fgetws(zz,mb,ma,mmputchars,stdin_chr);@+break;
case Fwrite: g[rBB].o=mmix_fwrite(zz,mb,ma,mmgetchars);@+break;
case Fputs: g[rBB].o=mmix_fputs(zz,g[rBB].o,mmgetchars);@+break;
case Fputws: g[rBB].o=mmix_fputws(zz,g[rBB].o,mmgetchars);@+break;
@z

@x [373] l.6583 RAII.
  octa trap_loc;
  trap_loc=incr(g[rWW].o,-4);
@y
  octa trap_loc=incr(g[rWW].o,-4);
@z

@x [376] l.6594 Decouple 'mixins'.
Here we need only declare those subroutines, and write three primitive
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
Here we need only write three primitive interfaces on which they depend.

@ The following three functions are used in {\mc MMIX-IO} as ``mixins'' in
section |@<Magic...@>|.  Similar functions are defined in the simplified \MMIX\
computer {\mc MMIX-SIM}.

@<Internal proto...@>=
static int mmgetchars @,@,@[ARGS((char*,int,octa,int))@];
static void mmputchars @,@,@[ARGS((unsigned char*,int,octa))@];
static char stdin_chr @,@,@[ARGS((void))@];
@z

@x [377] l.6611 Decouple 'mixins' from other private stuff..
int mmgetchars @,@,@[ARGS((char*,int,octa,int))@];
void mmputchars @,@,@[ARGS((unsigned char*,int,octa))@];
char stdin_chr @,@,@[ARGS((void))@];
octa magic_read @,@,@[ARGS((octa))@];
void magic_write @,@,@[ARGS((octa,octa))@];
@y
static octa magic_read @,@,@[ARGS((octa))@];
static void magic_write @,@,@[ARGS((octa,octa))@];
@z

@x [378] l.6623 Factor out private stuff.
octa magic_read(addr)
@y
static octa magic_read(addr)
@z

@x [379] l.6656 Factor out private stuff.
void magic_write(addr,val)
@y
static void magic_write(addr,val)
@z

@x [380] l.6695 RAII.
  octa arg_loc;
  arg_loc=g[rBB].o;
@y
  octa arg_loc=g[rBB].o;
@z

@x [381] l.6714 Factor out private stuff (mixins).
int mmgetchars(buf,size,addr,stop)
@y
static int mmgetchars(buf,size,addr,stop)
@z

@x [384] l.6772 Factor out private stuff (mixins).
void mmputchars(buf,size,addr)
@y
static void mmputchars(buf,size,addr)
@z

@x [386] l.6803
  x.h=(*p<<24)+(*(p+1)<<16)+(*(p+2)<<8)+*(p+3);
  x.l=(*(p+4)<<24)+(*(p+5)<<16)+(*(p+6)<<8)+*(p+7);
@y
  x=(octa){(*p<<24)+(*(p+1)<<16)+(*(p+2)<<8)+*(p+3),@|
    (*(p+4)<<24)+(*(p+5)<<16)+(*(p+6)<<8)+*(p+7)};
@z

@x [387] l.6821 Factor out private stuff (mixins).
char stdin_chr()
@y
static char stdin_chr()
@z

@x [387] l.6827 Don't ignore return code from fgets().
    fgets(stdin_buf,256,stdin);
@y
    if (!fgets(stdin_buf,sizeof(stdin_buf),stdin)) break;
@z

@x [387] l.6829 Replace magic number.
    for (p=stdin_buf;p<stdin_buf+254;p++) if(*p=='\n') break;
@y
    for (p=stdin_buf;p<stdin_buf+sizeof(stdin_buf)-2;p++) if(*p=='\n') break;
@z
