@x
void mmo_byte @,@,@[ARGS((unsigned char))@];
void mmo_lop @,@,@[ARGS((char,unsigned char,unsigned char))@];
void mmo_lopp @,@,@[ARGS((char,unsigned short))@];
@y
void mmo_byte @,@,@[ARGS((unsigned int))@];
void mmo_lop @,@,@[ARGS((int,unsigned int,unsigned int))@];
void mmo_lopp @,@,@[ARGS((int,unsigned int))@];
@z

@x
void mmo_byte(b)
  unsigned char b;
@y
void mmo_byte(b)
  unsigned int b;
@z

@x
void mmo_lop(x,y,z) /* output a loader operation */
  char x;
  unsigned char y,z;
@y
void mmo_lop(x,y,z) /* output a loader operation */
  int x;
  unsigned int y,z;
@z

@x
void mmo_lopp(x,yz) /* output a loader operation with two-byte operand */
  char x;
  unsigned short yz;
@y
void mmo_lopp(x,yz) /* output a loader operation with two-byte operand */
  int x;
  unsigned int yz;
@z

@x
void mmo_sync()
{
  register int j; register unsigned char *p;
@y
void mmo_sync()
{
  register int j; register Char *p;
@z
  
@x
@<Sub...@>=
void assemble @,@,@[ARGS((char,tetra,unsigned char))@];@+@t}\6{@>
void assemble(k,dat,x_bits)
  char k;
  tetra dat;
  unsigned char x_bits;
@y  
@<Sub...@>=
void assemble @,@,@[ARGS((int,tetra,unsigned int))@];@+@t}\6{@>
void assemble(k,dat,x_bits)
  int k;
  tetra dat;
  unsigned int x_bits;
@z

@x
  for (j=1;j<4;j++) if (x<(1<<(8*j))) break;
@y
  for (j=1;j<4;j++) if (x<(unsigned int)(1<<(8*j))) break;
@z

@x
@ @<Perform the top operation on |op_stack|@>=
switch(op_stack[--op_ptr]) {
 case inner_lp:@+if (rt_op==inner_rp) goto scan_close;
@y
@ @<Perform the top operation on |op_stack|@>=
switch(op_stack[--op_ptr]) {
 case outer_rp: case inner_rp: goto scan_close; /* should not happen */
 case inner_lp:@+if (rt_op==inner_rp) goto scan_close;
@z

@x
  if (listing_file && (opcode==IS || opcode==LOC))
    @<Make special listing to show the label equivalent@>;
@y
  if (listing_file && (opcode==IS || opcode==LOC))
  { @<Make special listing to show the label equivalent@>; }
@z

@x
case 2:@+if (!(op_bits&two_arg_bit))
    if (op_bits&one_arg_bit)
      derr("opcode `%s' must not have two operands",op_field)@;
    else derr("opcode `%s' must have more than two operands",op_field);
@y
case 2:@+if (!(op_bits&two_arg_bit)) {
    if (op_bits&one_arg_bit)
      derr("opcode `%s' must not have two operands",op_field)@;
    else derr("opcode `%s' must have more than two operands",op_field);
  }
@z

@x
  if ((val_stack[j].equiv.h && opcode<OCTA) ||@|
           (val_stack[j].equiv.l>0xffff && opcode<TETRA) ||@|
           (val_stack[j].equiv.l>0xff && opcode<WYDE))
    if (k==1) err("*constant doesn't fit in one byte")@;
@.constant doesn't fit...@>
    else derr("*constant doesn't fit in %d bytes",k);
@y
  if ((val_stack[j].equiv.h && opcode<OCTA) ||@|
           (val_stack[j].equiv.l>0xffff && opcode<TETRA) ||@|
           (val_stack[j].equiv.l>0xff && opcode<WYDE)) {
    if (k==1) err("*constant doesn't fit in one byte")@;
@.constant doesn't fit...@>
    else derr("*constant doesn't fit in %d bytes",k);
  }
@z

@x
 case GREG:@+if (listing_file) @<Make listing for |GREG|@>;
   goto bypass;
 case LOCAL:@+if (val_stack[0].equiv.l>lreg) lreg=val_stack[0].equiv.l;
@y
 case GREG:@+if (listing_file) { @<Make listing for |GREG|@>; }
   goto bypass;
 case LOCAL:@+if (val_stack[0].equiv.l>(unsigned int)lreg) lreg=val_stack[0].equiv.l;
@z