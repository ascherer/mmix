@x
@<Type...@>=
typedef unsigned int tetra;
  /* assumes that an int is exactly 32 bits wide */
@y
@s uint32_t int
@<Type...@>=
typedef uint32_t tetra;
@z

@x
typedef enum {@!false,@!true}@+@!bool;
@y
@z

@x
@s bool int
@y
@z

@x
  if (listing_file && (opcode==IS || opcode==LOC))
    @<Make special listing to show the label equivalent@>;
@y
  if (listing_file && (opcode==IS || opcode==LOC))
  { @<Make special listing to show the label equivalent@>; }
@z

@x
#include <time.h>
@y
#include <time.h>
#include <stdbool.h>
#include <stdint.h>
@z
