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

@x l.4901
  case st: data->state=st_ready;@+pass_after(1);@+goto passit;
@y
  case st: data->state=st_ready;@+pass_after(1);@+goto passit;
  default:@+; /* fall through */
@z

@x l.5106
   goto do_syncid;
@y
   goto do_syncid;
 default:@+; /* fall through */
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
