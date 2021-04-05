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
#include "abstime.h"
@y
@z

@x
  interrupt=true;
@y
  interrupt=true; (void) n;
@z
