@x [26] l.950
for the simulators. The definition of type \&{tetra} should be changed, if
necessary, to conform with the definitions found in {\mc MMIX-ARITH}.
@^system dependencies@>

@<Type...@>=
typedef unsigned int tetra;
  /* assumes that an int is exactly 32 bits wide */
typedef struct { tetra h,l;} octa; /* two tetrabytes make one octabyte */
typedef enum {@!false,@!true}@+@!bool;
@y
for the simulators.
@s uint32_t int
@s tetra int
@s octa int
@z

@x [27] l.960
@ @<Glob...@>=
extern octa zero_octa; /* |zero_octa.h=zero_octa.l=0| */
extern octa neg_one; /* |neg_one.h=neg_one.l=-1| */
extern octa aux; /* auxiliary output of a subroutine */
extern bool overflow; /* set by certain subroutines for signed arithmetic */
@y
@ (This section remains empty for historic reasons.)
@z

@x [28] l.972
@<Sub...@>=
extern octa oplus @,@,@[ARGS((octa y,octa z))@];
  /* unsigned $y+z$ */
extern octa ominus @,@,@[ARGS((octa y,octa z))@];
  /* unsigned $y-z$ */
extern octa incr @,@,@[ARGS((octa y,int delta))@];
  /* unsigned $y+\delta$ ($\delta$ is signed) */
extern octa oand @,@,@[ARGS((octa y,octa z))@];
  /* $y\land z$ */
extern octa shift_left @,@,@[ARGS((octa y,int s))@];
  /* $y\LL s$, $0\le s\le64$ */
extern octa shift_right @,@,@[ARGS((octa y,int s,int u))@];
  /* $y\GG s$, signed if |!u| */
extern octa omult @,@,@[ARGS((octa y,octa z))@];
  /* unsigned $(|aux|,x)=y\times z$ */
extern octa odiv @,@,@[ARGS((octa x,octa y,octa z))@];
  /* unsigned $(x,y)/z$; $|aux|=(x,y)\bmod z$ */

@y
@z

@x [31] l.1013
@ While we're talking about classic systems versus future systems, we
might as well define the |ARGS| macro, which makes function prototypes
available on {\mc ANSI \CEE/} systems without making them
uncompilable on older systems. Each subroutine below is declared first
with a prototype, then with an old-style definition.

@<Preprocessor definitions@>=
#ifdef __STDC__
#define ARGS(list) list
#else
#define ARGS(list) ()
#endif
@y
@ Each subroutine below is declared first with a prototype, then with an
old-style definition.
@s trie_node int

@<Prototypes@>=
void flush_listing_line @,@,@[ARGS((char*))@];
void update_listing_loc @,@,@[ARGS((int))@];
void listing_clear @,@,@[ARGS((void))@];
void report_error @,@,@[ARGS((char*))@];
@#
void mmo_clear @,@,@[ARGS((void))@];
void mmo_out @,@,@[ARGS((void))@];
void mmo_tetra @,@,@[ARGS((tetra))@];
void mmo_byte @,@,@[ARGS((unsigned char))@];
void mmo_lop @,@,@[ARGS((char,unsigned char,unsigned char))@];
void mmo_lopp @,@,@[ARGS((char,unsigned short))@];
void mmo_loc @,@,@[ARGS((void))@];
void mmo_sync @,@,@[ARGS((void))@];
@#
void assemble @,@,@[ARGS((char,tetra,unsigned char))@];
@#
trie_node* new_trie_node @,@,@[ARGS((void))@];
trie_node *trie_search @,@,@[ARGS((trie_node*,Char*))@];
sym_node* new_sym_node @,@,@[ARGS((bool))@];
trie_node* prune @,@,@[ARGS((trie_node*))@];
void out_stab @,@,@[ARGS((trie_node*))@];
@z

@x [39] l.1122
@<Preprocessor definitions@>=
@y
@<Preprocessor macros@>=
@z

@x [41] l.1145
void flush_listing_line @,@,@[ARGS((char*))@];@+@t}\6{@>
@y
@z

@x [42] l.1161
void update_listing_loc @,@,@[ARGS((int))@];@+@t}\6{@>
@y
@z

@x [44] l.1195
void listing_clear @,@,@[ARGS((void))@];@+@t}\6{@>
@y
@z

@x [45] l.1229
void report_error @,@,@[ARGS((char*))@];@+@t}\6{@>
@y
@z

@x [46] l.1258
int err_count; /* this many errors were found */
@y
int err_count; /* this many errors were found */
unsigned char lop_quote_command[4]={mm,lop_quote,0,1};
unsigned char mmo_buf[4];
int mmo_ptr;
@z

@x [47] l.1272
void mmo_clear @,@,@[ARGS((void))@];
void mmo_out @,@,@[ARGS((void))@];
unsigned char lop_quote_command[4]={mm,lop_quote,0,1};
@y
@z

@x [47] l.1286
unsigned char mmo_buf[4];
int mmo_ptr;
@y
@z

@x [48] l.1295
void mmo_tetra @,@,@[ARGS((tetra))@];
void mmo_byte @,@,@[ARGS((unsigned char))@];
void mmo_lop @,@,@[ARGS((char,unsigned char,unsigned char))@];
void mmo_lopp @,@,@[ARGS((char,unsigned short))@];
@y
@z

@x [49] l.1335
void mmo_loc @,@,@[ARGS((void))@];@+@t}\6{@>
@y
@z

@x [50] l.1357
void mmo_sync @,@,@[ARGS((void))@];@+@t}\6{@>
@y
@z

@x [50] l.1360
  register int j; register unsigned char *p;
@y
  register int j; register Char *p;
@z

@x [52] l.1399
void assemble @,@,@[ARGS((char,tetra,unsigned char))@];@+@t}\6{@>
@y
@z

@x [52] l.1416
    listing_bits|=1<<jj;
  }
  listing_bits|=x_bits;
  if (((l+k)&3)==0) {
    if (listing_file) listing_clear();
    mmo_clear();
@y
    listing_bits|=x_bits;
    if (((l+j+1)&3)==0) {
      if (listing_file) listing_clear();
      mmo_clear();
    }
@z

@x [54] l.1455
trie_node* new_trie_node @,@,@[ARGS((void))@];@+@t}\6{@>
@y
@z

@x [56] l.1473
trie_node *cur_prefix; /* root of subtrie for unqualified symbols */
@y
trie_node *cur_prefix; /* root of subtrie for unqualified symbols */
Char *terminator; /* where the search ended */
@z

@x [57] l.1483
trie_node *trie_search @,@,@[ARGS((trie_node*,Char*))@];
Char *terminator; /* where the search ended */
@y
@z

@x [58] l.1539
@s bool int
@y
@z

@x [59] l.1562
sym_node* new_sym_node @,@,@[ARGS((bool))@];@+@t}\6{@>
@y
@z

@x [63] l.1641
op_spec op_init_table[]={@/
@y
op_spec op_init_table[]={@|
@z

@x [63] l.1648
{"FEQL", 0x03, 0x240a8},@/
@y
{"FEQL", 0x03, 0x240a8},@|
@z

@x [63] l.1656
{"FIXU", 0x07, 0x26288},@/
@y
{"FIXU", 0x07, 0x26288},@|
@z

@x [63] l.1664
{"SFLOTU", 0x0e, 0x26282},@/
@y
{"SFLOTU", 0x0e, 0x26282},@|
@z

@x [63] l.1672
{"FEQLE", 0x13, 0x240a8},@/
@y
{"FEQLE", 0x13, 0x240a8},@|
@z

@x [63] l.1680
{"FINT", 0x17, 0x26288},@/
@y
{"FINT", 0x17, 0x26288},@|
@z

@x [63] l.1688
{"DIVU", 0x1e, 0x240a2},@/
@y
{"DIVU", 0x1e, 0x240a2},@|
@z

@x [63] l.1696
{"SUBU", 0x26, 0x240a2},@/
@y
{"SUBU", 0x26, 0x240a2},@|
@z

@x [63] l.1704
{"16ADDU", 0x2e, 0x240a2},@/
@y
{"16ADDU", 0x2e, 0x240a2},@|
@z

@x [63] l.1712
{"NEGU", 0x36, 0x26082},@/
@y
{"NEGU", 0x36, 0x26082},@|
@z

@x [63] l.1720
{"SRU", 0x3e, 0x240a2},@/
@y
{"SRU", 0x3e, 0x240a2},@|
@z

@x [63] l.1728
{"BOD", 0x46, 0x22081},@/
@y
{"BOD", 0x46, 0x22081},@|
@z

@x [63] l.1736
{"BEV", 0x4e, 0x22081},@/
@y
{"BEV", 0x4e, 0x22081},@|
@z

@x [63] l.1744
{"PBOD", 0x56, 0x22081},@/
@y
{"PBOD", 0x56, 0x22081},@|
@z

@x [63] l.1752
{"PBEV", 0x5e, 0x22081},@/
@y
{"PBEV", 0x5e, 0x22081},@|
@z

@x [63] l.1760
{"CSOD", 0x66, 0x240a2},@/
@y
{"CSOD", 0x66, 0x240a2},@|
@z

@x [63] l.1768
{"CSEV", 0x6e, 0x240a2},@/
@y
{"CSEV", 0x6e, 0x240a2},@|
@z

@x [63] l.1776
{"ZSOD", 0x76, 0x240a2},@/
@y
{"ZSOD", 0x76, 0x240a2},@|
@z

@x [63] l.1784
{"ZSEV", 0x7e, 0x240a2},@/
@y
{"ZSEV", 0x7e, 0x240a2},@|
@z

@x [63] l.1792
{"LDWU", 0x86, 0xa60a2},@/
@y
{"LDWU", 0x86, 0xa60a2},@|
@z

@x [63] l.1800
{"LDOU", 0x8e, 0xa60a2},@/
@y
{"LDOU", 0x8e, 0xa60a2},@|
@z

@x [63] l.1808
{"LDUNC", 0x96, 0xa60a2},@/
@y
{"LDUNC", 0x96, 0xa60a2},@|
@z

@x [63] l.1816
{"GO", 0x9e, 0xa60a2},@/
@y
{"GO", 0x9e, 0xa60a2},@|
@z

@x [63] l.1824
{"STWU", 0xa6, 0xa60a2},@/
@y
{"STWU", 0xa6, 0xa60a2},@|
@z

@x [63] l.1832
{"STOU", 0xae, 0xa60a2},@/
@y
{"STOU", 0xae, 0xa60a2},@|
@z

@x [63] l.1840
{"STUNC", 0xb6, 0xa60a2},@/
@y
{"STUNC", 0xb6, 0xa60a2},@|
@z

@x [63] l.1848
{"PUSHGO", 0xbe, 0xa6062},@/
@y
{"PUSHGO", 0xbe, 0xa6062},@|
@z

@x [63] l.1856
{"XOR", 0xc6, 0x240a2},@/
@y
{"XOR", 0xc6, 0x240a2},@|
@z

@x [63] l.1864
{"NXOR", 0xce, 0x240a2},@/
@y
{"NXOR", 0xce, 0x240a2},@|
@z

@x [63] l.1872
{"ODIF", 0xd6, 0x240a2},@/
@y
{"ODIF", 0xd6, 0x240a2},@|
@z

@x [63] l.1880
{"MXOR", 0xde, 0x240a2},@/
@y
{"MXOR", 0xde, 0x240a2},@|
@z

@x [63] l.1888
{"SETL", 0xe3, 0x22080},@/
@y
{"SETL", 0xe3, 0x22080},@|
@z

@x [63] l.1896
{"INCL", 0xe7, 0x22080},@/
@y
{"INCL", 0xe7, 0x22080},@|
@z

@x [63] l.1904
{"ORL", 0xeb, 0x22080},@/
@y
{"ORL", 0xeb, 0x22080},@|
@z

@x [63] l.1912
{"ANDNL", 0xef, 0x22080},@/
@y
{"ANDNL", 0xef, 0x22080},@|
@z

@x [63] l.1920
{"PUT", 0xf6, 0x22002},@/
@y
{"PUT", 0xf6, 0x22002},@|
@z

@x [63] l.1928
{"UNSAVE", 0xfb, 0x23a00},@/
@y
{"UNSAVE", 0xfb, 0x23a00},@|
@z

@x [63] l.1936
{"TRIP", 0xff, 0x27554},@/
@y
{"TRIP", 0xff, 0x27554},@|
@z

@x [63] l.1940
{"LDA", 0x22, 0xa60a2},@/
@y
{"LDA", 0x22, 0xa60a2},@|
@z

@x [63] l.1946
{"PREFIX", PREFIX, 0x141000},@/
@y
{"PREFIX", PREFIX, 0x141000},@|
@z

@x [63] l.1950
{"WYDE", WYDE, 0x11f000},
@y
{"WYDE", WYDE, 0x11f000},@|
@z

@x [63] l.1954
{"OCTA", OCTA, 0x13f000},@/
@y
{"OCTA", OCTA, 0x13f000},@|
@z

@x [63] l.1958
{"ESPEC", ESPEC, 0x141000},@/
@y
{"ESPEC", ESPEC, 0x141000},@|
@z

@x [69] l.2009
{"ROUND_NEAR",0,4},@/
@y
{"ROUND_NEAR",0,4},@|
@z

@x [69] l.2011
{"Inf",0x7ff00000,0},@/
@y
{"Inf",0x7ff00000,0},@|
@z

@x [69] l.2015
{"Pool_Segment",0x40000000,0},
@y
{"Pool_Segment",0x40000000,0},@|
@z

@x [69] l.2017
{"Stack_Segment",0x60000000,0},@/
@y
{"Stack_Segment",0x60000000,0},@|
@z

@x [69] l.2033
{"X_BIT",0,0x01},@/
@y
{"X_BIT",0,0x01},@|
@z

@x [69] l.2049
{"X_Handler",0,0x80},@/
@y
{"X_Handler",0,0x80},@|
@z

@x [69] l.2055
{"StdErr",0,2},@/
@y
{"StdErr",0,2},@|
@z

@x [69] l.2065
{"BinaryReadWrite",0,4},@/
@y
{"BinaryReadWrite",0,4},@|
@z

@x [73] l.2148
trie_node* prune @,@,@[ARGS((trie_node*))@];@+@t}\6{@>
@y
@z

@x [74] l.2176
void out_stab @,@,@[ARGS((trie_node*))@];@+@t}\6{@>
@y
@z

@x [74] l.2181
  register sym_node *pp;
@y
@z

@x [76] l.2229
  for (j=1;j<4;j++) if (x<(1<<(8*j))) break;
@y
  for (j=1;j<4;j++) if (x<(tetra)(1<<(8*j))) break;
@z

@x [78] l.2248
  *sym_ptr='\0';
  fprintf(listing_file," %s = ",sym_buf+1);
  pp=t->sym;
@y
  register sym_node *pp=t->sym;
  *sym_ptr='\0';
  fprintf(listing_file," %s = ",sym_buf+1);
@z

@x [95] l.2446
acc.h=acc.l=0;
@y
acc=zero_octa;
@z

@x [97] l.2471
 case '&': rt_op=and;@+break;
@y
  @=/* fall through */@>@;
 case '&': rt_op=and;@+break;
@z

@x [98] l.2499
 @t\4@>@<Cases for unary operators@>@;
@y
 case outer_rp: case inner_rp:@+goto scan_close; /* should not happen */
 @t\4@>@<Cases for unary operators@>@;
@z

@x [109] l.2742
    do @<Fix prior references to this label@>@;@+while (pp->link);
@y
    do @<Fix prior references to this label@>@; while (pp->link);
@z

@x [114] l.279ß
  octa o;
  o=ominus(cur_loc,qq->equiv);
@y
  octa o=ominus(cur_loc,qq->equiv);
@z

@x [115] l.2815
if (new_link==DEFINED) {
@y
{ if (new_link==DEFINED) {
@z

@x [115] l.2821
}
@y
} }
@z

@x [116] l.2831
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

@x [116] l.2840
case 3:@+if (!(op_bits&three_arg_bit))
@y
  @=/* fall through */@>@;
case 3:@+if (!(op_bits&three_arg_bit))
@z

@x [116] l.2853
    if (k==1) err("*constant doesn't fit in one byte")@;
@.constant doesn't fit...@>
    else derr("*constant doesn't fit in %d bytes",k);
@y
  { if (k==1) err("*constant doesn't fit in one byte")@;
@.constant doesn't fit...@>
    else derr("*constant doesn't fit in %d bytes",k); }
@z

@x [127] l.3004
  octa o;
  o=val_stack[1].equiv, k=0;
@y
  octa o=val_stack[1].equiv;
  k=0;
@z

@x [127] l.3109
 case LOCAL:@+if (val_stack[0].equiv.l>lreg) lreg=val_stack[0].equiv.l;
@y
 case LOCAL:@+if (val_stack[0].equiv.l>(tetra)lreg) lreg=val_stack[0].equiv.l;
@z

@x [132] l.3121
 case ESPEC: spec_mode=false;@+goto bypass;
@y
 case ESPEC: spec_mode=false;@+if (held_bits) mmo_clear();@+goto bypass;
@z

@x [134] l.3128
if (val_stack[0].equiv.l || val_stack[0].equiv.h) {
@y
{ if (val_stack[0].equiv.l || val_stack[0].equiv.h) {
@z

@x [134] l.3136
}
@y
} }
@z

@x [136] l.3166
#include <time.h>
@#
@<Preprocessor definitions@>@;
@y
#include <time.h>
@#
#include "mmix-arith.h" /* |@!tetra|, |@!octa| */
@#
@h
@<Preprocessor macros@>@;
@z

@x [136] l.3171
@<Subroutines@>@;
@y
@<Prototypes@>@;
@<Subroutines@>@;
@z
