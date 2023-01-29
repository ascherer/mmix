@x l.954
@<Type...@>=
typedef unsigned int tetra;
  /* assumes that an int is exactly 32 bits wide */
@y
@s uint32_t int
@<Type...@>=
typedef uint32_t tetra;
@z

@x l. 958
typedef enum {@!false,@!true}@+@!bool;
@y
@z

@x l.1539
@s bool int
@y
@z

@x l.2499
 @t\4@>@<Cases for binary operators@>@;
@y
 @t\4@>@<Cases for binary operators@>@;
 case inner_rp: case outer_rp:@+; /* fall through */
@z

@x l.2747
  if (listing_file && (opcode==IS || opcode==LOC))
    @<Make special listing to show the label equivalent@>;
@y
  if (listing_file && (opcode==IS || opcode==LOC))
  { @<Make special listing to show the label equivalent@>; }
@z

@x l.3166
#include <time.h>
@y
#include <time.h>
#include <stdbool.h>
#include <stdint.h>
@z
