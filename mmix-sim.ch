@x l.12
@s bool normal @q unreserve a C++ keyword @>
@y
@z

@x l.546
@* Basics. To get started, we define a type that provides semantic sugar.
@y
@* Basics. Standard types for syntactic sugar.
@z

@x l.549
typedef enum {@!false,@!true}@+@!bool;
@y
#include <stdbool.h>
#include <stdint.h>
@z

@x l.560
@<Type...@>=
typedef unsigned int tetra;
  /* for systems conforming to the LP-64 data model */
@y
@s uint32_t int
@s uint8_t int
@<Type...@>=
typedef uint32_t tetra;
@z

@x l.564
typedef unsigned char byte; /* a monobyte */
@y
typedef uint8_t byte; /* a monobyte */
@z

@x l.1204
  else freopen(file_info[cur_file].name,"r",src_file);
@y
  else if (freopen(file_info[cur_file].name,"r",src_file)) {}
@z

@x l.1367
  if (f&X_is_dest_bit) @<Install register~X as the destination,
          adjusting the register stack if necessary@>;
@y
  if (f&X_is_dest_bit) { @<Install register~X as the destination,
          adjusting the register stack if necessary@>; }
@z

@x l.1779
register int G,L,O; /* accessible copies of key registers */
@y
register int G,L,O=0; /* accessible copies of key registers */
@z

@x l.1792
(The macro \.{ABSTIME} is defined externally in the file \.{abstime.h},
which should have just been created by {\mc ABSTIME}\kern.05em;
{\mc ABSTIME} is
a trivial program that computes the value of the standard library function
|time(NULL)|. We assume that this number, which is the number of seconds in
@y
(The macro \.{ABSTIME} will be set to a numeric value at compilation-time in
\.{Makefile}. We assume that this number, which is the number of seconds in
@z

@x l.1801
@d VERSION 1 /* version of the \MMIX\ architecture that we support */
@y
@d ABSTIME /* number of seconds in “the epoch” */
@d VERSION 1 /* version of the \MMIX\ architecture that we support */
@z

@x l.2835
 case handle:@+if (o.h==0 && o.l<3) printf(stream_name[o.l]);
@y
 case handle:@+if (o.h==0 && o.l<3) printf("%s",stream_name[o.l]);
@z

@x l.2846
case 's': printf(special_name[zz]);@+break;
@y
case 's': printf("%s",special_name[zz]);@+break;
@z

@x l.2848
case 'l': printf(lhs);@+break;
@y
case 'l': printf("%s",lhs);@+break;
@z

@x l.2887
#include "abstime.h"
@y
@z

@x l.2987
    for (k=0;usage_help[k][0];k++) fprintf(stderr,usage_help[k]);
@y
    for (k=0;usage_help[k][0];k++) fprintf(stderr,"%s",usage_help[k]);
@z

@x l.2989
  }@+else@+ for (k=0;usage_help[k][1]!='b';k++) printf(usage_help[k]);
@y
  }@+else@+ for (k=0;usage_help[k][1]!='b';k++) printf("%s",usage_help[k]);
@z

@x l.3068
  interrupt=true;
@y
  interrupt=true; (void) n;
@z

@x l.3093
  case 'h':@+ for (k=0;interactive_help[k][0];k++) printf(interactive_help[k]);
@y
  case 'h':@+ for (k=0;interactive_help[k][0];k++) printf("%s",interactive_help[k]);
@z

@x l.3096
 check_syntax:@+ if (*p!='\n') {
@y
  if (*p!='\n') {
@z
