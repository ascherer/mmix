@x l.10
@s bool normal @q unreserve a C++ keyword @>
@y
@z

@x [3] l.128
#include "abstime.h"
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

@x [11] l.260
typedef enum {@!false, @!true, @!wow}@+bool; /* slightly extended booleans */
@y
#include <stdbool.h> /* |bool| */
#include <stdint.h> /* |uint32_t| */
@z

@x [17] l.331
@<Type...@>=
typedef unsigned int tetra;
  /* for systems conforming to the LP-64 data model */
@y
@s uint32_t int
@<Type...@>=
typedef uint32_t tetra;
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
  default:@+; /* fall through */
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
  default:@+; /* fall through */
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
 default:@+; /* fall through */
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
 default:@+; /* fall through */
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

@x [387] l.6827
    fgets(stdin_buf,256,stdin);
@y
    if (fgets(stdin_buf,256,stdin)) {}
@z
