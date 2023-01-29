@x l.10
@s bool normal @q unreserve a C++ keyword @>
@y
@z

@x l.128
#include "abstime.h"
@y
@z

@x l.229
  @<Local variables@>;
@y
  @<Local variables@>; (void)breakpoint_hit;
@z

@x l.256
 cease:;
@y
@z

@x l.260
typedef enum {@!false, @!true, @!wow}@+bool; /* slightly extended booleans */
@y
#include <stdbool.h> /* |bool| */
#include <stdint.h> /* |uint32_t| */
@z

@x l.331
@<Type...@>=
typedef unsigned int tetra;
  /* for systems conforming to the LP-64 data model */
@y
@s uint32_t int
@<Type...@>=
typedef uint32_t tetra;
@z

@x l.1865
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

@x l.1902
    if (a.l<32) printf(special_name[a.l]);
@y
    if (a.l<32) printf("%s",special_name[a.l]);
@z

@x l.2136
  if (mem_slots) mem_slots--;@+else goto stall;
@y
  { if (mem_slots) mem_slots--;@+else goto stall; }
@z

@x l.2306
    new_O=incr(cool_O,-x-1);
@y
    new_O=incr(cool_O,-(int)x-1);
@z

@x l.2310
    if (x<new_L)
@y
    if (x<(unsigned int)new_L)
@z

@x l.2519
  @<Cases for stage 1 execution@>;
@y
  @<Cases for stage 1 execution@>;
  default:@+; /* fall through */
@z

@x l.2968
 case 0: b=o.h>>31;@+break; /* negative? */
@y
 default: case 0: b=o.h>>31;@+break; /* negative? */
@z

@x l.3418
   return &s[l-aa];
  }
@y
   return &s[l-aa];
  }
  return NULL;
@z

@x l.4901
  case st: data->state=st_ready;@+pass_after(1);@+goto passit;
@y
  case st: data->state=st_ready;@+pass_after(1);@+goto passit;
  default:@+; /* fall through */
@z

@x l.4958
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

@x l.5106
   goto do_syncid;
@y
   goto do_syncid;
 default:@+; /* fall through */
@z

@x l.5349
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

@x l.5787
    if (m>=cool_L && m<cool_G) goto bad_resume;
@y
    if ((unsigned int)m>=cool_L && (unsigned int)m<cool_G) goto bad_resume;
@z

@x l.6200
 case FCMPE:@+ if (j) goto cmp_zero_or_invalid;
@y
 case FCMPE:@+ if (j) goto cmp_zero_or_invalid;
 default:@+; /* fall through */
@z

@x l.6458
   if (data->i==syncd) goto fin_ex;@+ else goto next_sync;
@y
   { if (data->i==syncd) goto fin_ex;@+ else goto next_sync; }
@z

@x l.6519
  data->y.o.l &= -data->b.o.l;
@y
  data->y.o.l &= -(int)data->b.o.l;
@z

@x l.6827
    fgets(stdin_buf,256,stdin);
@y
    if (fgets(stdin_buf,256,stdin)) {}
@z
