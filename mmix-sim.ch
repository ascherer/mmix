@x
@s bool normal @q unreserve a C++ keyword @>
@y
@z

@x
@* Basics. To get started, we define a type that provides semantic sugar.
@y
@* Basics. Standard types for syntactic sugar.
@z

@x
typedef enum {@!false,@!true}@+@!bool;
@y
#include <stdbool.h>
#include <stdint.h>
@z

@x
@<Type...@>=
typedef unsigned int tetra;
  /* for systems conforming to the LP-64 data model */
@y
@s uint32_t int
@s uint8_t int
@<Type...@>=
typedef uint32_t tetra;
@z

@x
typedef unsigned char byte; /* a monobyte */
@y
typedef uint8_t byte; /* a monobyte */
@z

@x
case lop_fixr: delta=yzbytes; goto fixr;
@y
case lop_fixr: j=delta=yzbytes; goto fixr;
@z

@x
    if (shown_line>0)
      if (cur_line<shown_line) printf("--------\n"); /* indicate upward move */
      else printf("     ...\n"); /* indicate the gap */
@y
    if (shown_line>0) {
      if (cur_line<shown_line) printf("--------\n"); /* indicate upward move */
      else printf("     ...\n"); /* indicate the gap */
    }
@z

@x
  else freopen(file_info[cur_file].name,"r",src_file);
@y
  else if (freopen(file_info[cur_file].name,"r",src_file)) {}
@z

@x
  if (f&X_is_dest_bit) @<Install register~X as the destination,
          adjusting the register stack if necessary@>;
@y
  if (f&X_is_dest_bit) { @<Install register~X as the destination,
          adjusting the register stack if necessary@>; }
@z

@x
int tracing_exceptions; /* exception bits that cause tracing */
@y
unsigned int tracing_exceptions; /* exception bits that cause tracing */
@z

@x
register int G,L,O; /* accessible copies of key registers */
@y
register int G,L,O=0; /* accessible copies of key registers */
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
 round_mode=(y.l? y.l: cur_round);@+goto store_fx;
@y
 round_mode=(y.l? (int)y.l: cur_round);@+goto store_fx;
@z

@x
 case 0: b=o.h>>31;@+break; /* negative? */
@y
 default: case 0: b=o.h>>31;@+break; /* negative? */
@z

@x
  if (z.l>L || z.h) z.h=0, z.l=L;
@y
  if ((int)z.l>L || z.h) z.h=0, z.l=L;
@z

@x
  if (z.h!=0 || z.l>255 || z.l<L || z.l<32) goto illegal_inst;
@y
  if (z.h!=0 || z.l>255 || (int)z.l<L || z.l<32) goto illegal_inst;
@z

@x
 case handle:@+if (o.h==0 && o.l<3) printf(stream_name[o.l]);
@y
 case handle:@+if (o.h==0 && o.l<3) printf("%s",stream_name[o.l]);
@z

@x
case 's': printf(special_name[zz]);@+break;
case '?': p++;@+if (z.l) printf("%c%d",*p,z.l);@+break;
case 'l': printf(lhs);@+break;
@y
case 's': printf("%s",special_name[zz]);@+break;
case '?': p++;@+if (z.l) printf("%c%d",*p,z.l);@+break;
case 'l': printf("%s",lhs);@+break;
@z

@x
#include "abstime.h"
@y
@z

@x
  else if (sscanf(arg+1,"%d",&trace_threshold)!=1) trace_threshold=0;
@y
  else if (sscanf(arg+1,"%d",(int *)&trace_threshold)!=1) trace_threshold=0;
@z

@x
    for (k=0;usage_help[k][0];k++) fprintf(stderr,usage_help[k]);
    exit(-1);
  }@+else@+ for (k=0;usage_help[k][1]!='b';k++) printf(usage_help[k]);
@y
    for (k=0;usage_help[k][0];k++) fprintf(stderr,"%s",usage_help[k]);
    exit(-1);
  }@+else@+ for (k=0;usage_help[k][1]!='b';k++) printf("%s",usage_help[k]);
@z

@x
  interrupt=true;
@y
  interrupt=true; (void) n;
@z

@x
  case 'h':@+ for (k=0;interactive_help[k][0];k++) printf(interactive_help[k]);
@y
  case 'h':@+ for (k=0;interactive_help[k][0];k++) printf("%s",interactive_help[k]);
@z

@x
 check_syntax:@+ if (*p!='\n') {
@y
 if (*p!='\n') {
@z

@x
    }@+else if (command_buf[0]!='\n' && command_buf[0]!='i' &&
              command_buf[0]!='%')
      if (command_buf[0]==' ') printf("%s",command_buf);
      else ready=true;
@y
    }@+else if (command_buf[0]!='\n' && command_buf[0]!='i' &&
              command_buf[0]!='%') {
      if (command_buf[0]==' ') printf("%s",command_buf);
      else ready=true;
    }
@z

@x
    if (val.h!=0 || val.l>255 || val.l<L || val.l<32) break;
    for (j=val.l; j<G; j++) g[j]=zero_octa;
    G=val.l;
  }@+else if (k==rL) {
    if (val.h==0 && val.l<L) L=val.l;
    else break;
  }
@y
    if (val.h!=0 || val.l>255 || (int)val.l<L || val.l<32) break;
    for (j=val.l; j<G; j++) g[j]=zero_octa;
    G=val.l;
  }@+else if (k==rL) {
    if (val.h==0 && (int)val.l<L) L=val.l;
    else break;
  }
@z
