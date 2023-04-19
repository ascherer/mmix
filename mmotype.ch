@x [1] l.14
@s tetra int

@y
@z

@x l.20
#include <string.h>
@y
#include <string.h>
#include <stdint.h>
@z

@x [1] l.34
  do @<List the next item@>@;@+while (!postamble);
@y
  do @<List the next item@>@; while (!postamble);
@z

@x [7] l.94
@<Type...@>=
typedef unsigned char byte; /* a monobyte */
typedef unsigned int tetra; /* a tetrabyte */
typedef struct {@+tetra h,l;}@+octa; /* an octabyte */
@y
@s uint8_t int
@s uint32_t int
@<Type...@>=
typedef uint8_t byte; /* a monobyte */
typedef uint32_t tetra; /* a tetrabyte */
typedef struct {@+tetra h,l;@+} octa; /* an octabyte */
@z
