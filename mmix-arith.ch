Use C99 standard types instead of homebrewn typedefs.

@x
@s bool normal @q unreserve a C++ keyword @>
@y
@z

@x
#include <string.h>
@y
#include <string.h>
#include <stdbool.h>
#include <stdint.h>
@z

@x
typedef enum{@+false,true@+} bool;
@y
@z

@x
@<Tetra...@>=
typedef unsigned int tetra;
 /* for systems conforming to the LP-64 data model */
@y
@s uint32_t int
@<Tetra...@>=
typedef uint32_t tetra;
@z

again the default case helps the compiler see that no cases are missing.

@x
 case ROUND_NEAR: o=incr(o, o.l&4? 2: 1);@+break;
@y
 case ROUND_NEAR: default: o=incr(o, o.l&4? 2: 1);@+break;
@z

@x
 case zro: z=0;@+break;
@y
 default: case zro: z=0;@+break;
@z
