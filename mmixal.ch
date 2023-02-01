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

@x l.1350
  register int j; register unsigned char *p;
@y
  register int j; register Char *p;
@z

@x l.1539
@s bool int
@y
@z

@x l.2009
{"ROUND_NEAR",0,4},@/
@y
{"ROUND_NEAR",0,4},@|
@z

@x l.2011
{"Inf",0x7ff00000,0},@/
@y
{"Inf",0x7ff00000,0},@|
@z

@x l.2015
{"Pool_Segment",0x40000000,0},
@y
{"Pool_Segment",0x40000000,0},@|
@z

@x l.2017
{"Stack_Segment",0x60000000,0},@/
@y
{"Stack_Segment",0x60000000,0},@|
@z

@x l.2033
{"X_BIT",0,0x01},@/
@y
{"X_BIT",0,0x01},@|
@z

@x l.2049
{"X_Handler",0,0x80},@/
@y
{"X_Handler",0,0x80},@|
@z

@x l.2055
{"StdErr",0,2},@/
@y
{"StdErr",0,2},@|
@z

@x l.2065
{"BinaryReadWrite",0,4},@/
@y
{"BinaryReadWrite",0,4},@|
@z

@x l.2229
  for (j=1;j<4;j++) if (x<(1<<(8*j))) break;
@y
  for (j=1;j<4;j++) if (x<(tetra)(1<<(8*j))) break;
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

@x l.2831
case 2:@+if (!(op_bits&two_arg_bit))
    if (op_bits&one_arg_bit)
      derr("opcode `%s' must not have two operands",op_field)@;
    else derr("opcode `%s' must have more than two operands",op_field);
@y
case 2:@+if (!(op_bits&two_arg_bit)) {
    if (op_bits&one_arg_bit)
      derr("opcode `%s' must not have two operands",op_field)@;
    else derr("opcode `%s' must have more than two operands",op_field); }
@z

@x l.2853
    if (k==1) err("*constant doesn't fit in one byte")@;
@.constant doesn't fit...@>
    else derr("*constant doesn't fit in %d bytes",k);
@y
  { if (k==1) err("*constant doesn't fit in one byte")@;
@.constant doesn't fit...@>
    else derr("*constant doesn't fit in %d bytes",k); }
@z

@x l.3107
 case GREG:@+if (listing_file) @<Make listing for |GREG|@>;
@y
 case GREG:@+if (listing_file) { @<Make listing for |GREG|@>; }
@z

@x l.3109
 case LOCAL:@+if (val_stack[0].equiv.l>lreg) lreg=val_stack[0].equiv.l;
@y
 case LOCAL:@+if (val_stack[0].equiv.l>(tetra)lreg) lreg=val_stack[0].equiv.l;
@z

@x l.3166
#include <time.h>
@y
#include <time.h>
#include <stdbool.h>
#include <stdint.h>
@z
