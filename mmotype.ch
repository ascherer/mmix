@x
@s tetra int

@y
@z

@x
#include <string.h>
@y
#include <string.h>
#include <stdint.h>
@z

@x
@<Type...@>=
typedef unsigned char byte; /* a monobyte */
typedef unsigned int tetra; /* a tetrabyte */
@y
@s uint8_t int
@s uint32_t int
@<Type...@>=
typedef uint8_t byte; /* a monobyte */
typedef uint32_t tetra; /* a tetrabyte */
@z
