Use C99 standard types instead of homebrewn typedefs.

@x l.13
@s bool normal @q unreserve a C++ keyword @>
@y
@z

@x l.35
#include <string.h>
@y
#include <string.h>
#include <stdbool.h>
#include <stdint.h>
@z

@x l.38
typedef enum{@+false,true@+} bool;
@y
@z

@x l.51
@<Tetra...@>=
typedef unsigned int tetra;
 /* for systems conforming to the LP-64 data model */
@y
@s uint32_t int
@<Tetra...@>=
typedef uint32_t tetra;
@z

again the default case helps the compiler see that no cases are missing.

@x l.540
 case ROUND_NEAR: o=incr(o, o.l&4? 2: 1);@+break;
@y
 case ROUND_NEAR: default: o=incr(o, o.l&4? 2: 1);@+break;
@z

@x l.689
 case zro: z=0;@+break;
@y
 default: case zro: z=0;@+break;
@z

@x l.1357
 no_const_found: next_char=s;@+return -1;
@y
  next_char=s;@+return -1;
@z

@x l.1483
 make_it_zero: exp=-99999;@+ goto packit;
@y
  exp=-99999;@+ goto packit;
@z
