@x
@s bool normal @q unreserve a C++ keyword @>
@y
@z

@x
#include "abstime.h"
@y
@z

@x
  @<Local variables@>;
@y
  @<Local variables@>; (void)breakpoint_hit;
@z

@x
typedef enum {@!false, @!true, @!wow}@+bool; /* slightly extended booleans */
@y
#include <stdbool.h> /* |bool| */
#include <stdint.h> /* |uint32_t| */
@z

@x
@<Type...@>=
typedef unsigned int tetra;
  /* for systems conforming to the LP-64 data model */
@y
@s uint32_t int
@<Type...@>=
typedef uint32_t tetra;
@z

@x
(The macro \.{ABSTIME} is defined externally in the file \.{abstime.h},
which should have just been created by {\mc ABSTIME}\kern.05em;
{\mc ABSTIME} is
a trivial program that computes the value of the standard library function
|time(NULL)|. We assume that this number, which is the number of seconds in
@y
(The macro \.{ABSTIME} will be set to a numeric value at compilation-time in
\.{Makefile}. We assume that this number, which is the number of seconds in
@z

@x
@d VERSION 1 /* version of the \MMIX\ architecture that we support */
@y
@d ABSTIME /* number of seconds in “the epoch” */
@d VERSION 1 /* version of the \MMIX\ architecture that we support */
@z

@x
    new_O=incr(cool_O,-x-1);
@y
    new_O=incr(cool_O,-(int)x-1);
@z

@x
    if (x<new_L)
@y
    if (x<(unsigned int)new_L)
@z

@x
 case 0: b=o.h>>31;@+break; /* negative? */
@y
 default: case 0: b=o.h>>31;@+break; /* negative? */
@z

@x
    if (m>=cool_L && m<cool_G) goto bad_resume;
@y
    if ((unsigned int)m>=cool_L && (unsigned int)m<cool_G) goto bad_resume;
@z

@x
  data->y.o.l &= -data->b.o.l;
@y
  data->y.o.l &= -(int)data->b.o.l;
@z

@x
    fgets(stdin_buf,256,stdin);
@y
    if (fgets(stdin_buf,256,stdin)) {}
@z
