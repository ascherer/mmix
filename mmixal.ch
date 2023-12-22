@x [26] l.950 Use C99 standard types. 'tetra' comes from MMIX-ARITH.
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

@c
#include "mmix-arith.h" /* |@!tetra|, |@!octa| */
@z

@x [27] l.960 Variables from MMIX-ARITH.
@ @<Glob...@>=
extern octa zero_octa; /* |zero_octa.h=zero_octa.l=0| */
extern octa neg_one; /* |neg_one.h=neg_one.l=-1| */
extern octa aux; /* auxiliary output of a subroutine */
extern bool overflow; /* set by certain subroutines for signed arithmetic */
@y
@ (This section remains empty for historic reasons.)
@z

@x [28] l.972 Functions from MMIX-ARITH.
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

@x [31] l.1013 Stuff from MMIX-ARITH replaced with prototypes.
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
@ Each subroutine below is declared and defined with a prototype.
@s trie_node int

@<Prototypes@>=
void flush_listing_line(char*);
void update_listing_loc(int);
void listing_clear(void);
void report_error(char*);
@#
void mmo_clear(void);
void mmo_out(void);
void mmo_tetra(tetra);
void mmo_byte(unsigned char);
void mmo_lop(char,unsigned char,unsigned char);
void mmo_lopp(char,unsigned short);
void mmo_loc(void);
void mmo_sync(void);
@#
void assemble(char,tetra,unsigned char);
@#
trie_node* new_trie_node(void);
trie_node *trie_search(trie_node*,Char*);
sym_node* new_sym_node(bool);
trie_node* prune(trie_node*);
void out_stab(trie_node*);
@z

@x [39] l.1122 We use '@h', so section is renamed.
@<Preprocessor definitions@>=
@y
@<Preprocessor macros@>=
@z

@x [41] l.1145 C99 prototypes for C2x.
void flush_listing_line @,@,@[ARGS((char*))@];@+@t}\6{@>
void flush_listing_line(s)
  char *s;
@y
void flush_listing_line(
  char *s)
@z

@x [42] l.1161 C99 prototypes for C2x.
void update_listing_loc @,@,@[ARGS((int))@];@+@t}\6{@>
void update_listing_loc(k)
  int k; /* the location to display, mod 4 */
@y
void update_listing_loc(
  int k) /* the location to display, mod 4 */
@z

@x l. [42] l.1169 Compound literal.
  listing_loc.h=cur_loc.h;@+
  listing_loc.l=(cur_loc.l&-4)|k;
@y
  listing_loc=(octa){cur_loc.h, (cur_loc.l&-4)|k};
@z

@x [44] l.1195 C99 prototypes for C2x.
void listing_clear @,@,@[ARGS((void))@];@+@t}\6{@>
void listing_clear()
@y
void listing_clear(void)
@z

@x [45] l.1219
@d err(m) {@+report_error(m);@+if (m[0]!='*') goto bypass;@+}
@d derr(m,p) {@+sprintf(err_buf,m,p);
   report_error(err_buf);@+if (err_buf[0]!='*') goto bypass;@+}
@d dderr(m,p,q) {@+sprintf(err_buf,m,p,q);
   report_error(err_buf);@+if (err_buf[0]!='*') goto bypass;@+}
@y
@d err(m,...) {@+sprintf(err_buf,@[m @,@, __VA_OPT__(,) @,@, __VA_ARGS__@]);
   report_error(err_buf);@+if (err_buf[0]!='*') goto bypass;@+}
@z

@x [45] l.1224
@d panic(m) {@+sprintf(err_buf,"!%s",m);@+report_error(err_buf);@+}
@d dpanic(m,p) {@+err_buf[0]='!';@+sprintf(err_buf+1,m,p);@+
@y
@d panic(m,...) {@+err_buf[0]='!';@+sprintf(err_buf+1,
   @[m @,@, __VA_OPT__(,) @,@, __VA_ARGS__@]);
@z

@x [45] l.1229 C99 prototypes for C2x.
void report_error @,@,@[ARGS((char*))@];@+@t}\6{@>
void report_error(message)
  char *message;
@y
void report_error(
  char *message)
@z

@x [46] l.1258 Untangle functions and variables.
int err_count; /* this many errors were found */
@y
int err_count; /* this many errors were found */
unsigned char lop_quote_command[4]={mm,lop_quote,0,1};
unsigned char mmo_buf[4];
int mmo_ptr;
@z

@x [47] l.1268
     dpanic("Can't write on %s",obj_file_name)
@y
     panic("Can't write on %s",obj_file_name)
@z

@x [47] l.1272 Untangle functions and variables.
void mmo_clear @,@,@[ARGS((void))@];
void mmo_out @,@,@[ARGS((void))@];
unsigned char lop_quote_command[4]={mm,lop_quote,0,1};
void mmo_clear() /* clears |hold_buf|, when |held_bits!=0| */
@y
void mmo_clear(void) /* clears |hold_buf|, when |held_bits!=0| */
@z

@x [47] l.1286 Untangle functions and variables.
unsigned char mmo_buf[4];
int mmo_ptr;
void mmo_out() /* output the contents of |mmo_buf| */
@y
void mmo_out(void) /* output the contents of |mmo_buf| */
@z

@x [48] l.1295 C99 prototypes for C2x.
void mmo_tetra @,@,@[ARGS((tetra))@];
void mmo_byte @,@,@[ARGS((unsigned char))@];
void mmo_lop @,@,@[ARGS((char,unsigned char,unsigned char))@];
void mmo_lopp @,@,@[ARGS((char,unsigned short))@];
void mmo_tetra(t) /* output a tetrabyte */
  tetra t;
@y
void mmo_tetra( /* output a tetrabyte */
  tetra t)
@z

@x [48] l.1307 C99 prototypes for C2x.
void mmo_byte(b)
  unsigned char b;
@y
void mmo_byte(
  unsigned char b)
@z

@x [48] l.1314 C99 prototypes for C2x.
void mmo_lop(x,y,z) /* output a loader operation */
  char x;
  unsigned char y,z;
@y
void mmo_lop( /* output a loader operation */
  char x,
  unsigned char y, unsigned char z)
@z

@x [48] l.1322 C99 prototypes for C2x.
void mmo_lopp(x,yz) /* output a loader operation with two-byte operand */
  char x;
  unsigned short yz;
@y
void mmo_lopp( /* output a loader operation with two-byte operand */
  char x,
  unsigned short yz)
@z

@x [49] l.1335 C99 prototypes for C2x.
void mmo_loc @,@,@[ARGS((void))@];@+@t}\6{@>
void mmo_loc()
@y
void mmo_loc(void)
@z

@x [50] l.1357 C99 prototypes for C2x.
void mmo_sync @,@,@[ARGS((void))@];@+@t}\6{@>
void mmo_sync()
@y
void mmo_sync(void)
@z

@x [50] l.1360 Change from MMIX home.
  register int j; register unsigned char *p;
@y
  register int j; register Char *p;
@z

@x [52] l.1399 C99 prototypes for C2x.
void assemble @,@,@[ARGS((char,tetra,unsigned char))@];@+@t}\6{@>
void assemble(k,dat,x_bits)
  char k;
  tetra dat;
  unsigned char x_bits;
@y
void assemble(
  char k,
  tetra dat,
  unsigned char x_bits)
@z

@x [54] l.1455 C99 prototypes for C2x.
trie_node* new_trie_node @,@,@[ARGS((void))@];@+@t}\6{@>
trie_node* new_trie_node()
@y
trie_node* new_trie_node(void)
@z

@x [56] l.1473 Untangle functions and variables.
trie_node *cur_prefix; /* root of subtrie for unqualified symbols */
@y
trie_node *cur_prefix; /* root of subtrie for unqualified symbols */
Char *terminator; /* where the search ended */
@z

@x [57] l.1483 Untangle functions and variables.
trie_node *trie_search @,@,@[ARGS((trie_node*,Char*))@];
Char *terminator; /* where the search ended */
trie_node *trie_search(t,s)
  trie_node *t;
  Char *s;
@y
trie_node *trie_search(
  trie_node *t,
  Char *s)
@z

@x [57] l.1493
  while (1) {
@y
  while (true) {
@z

@x [58] l.1539 CWEB knows this since version 3.5 (1999).
@s bool int
@y
@z

@x [59] l.1562 C99 prototypes for C2x.
sym_node* new_sym_node @,@,@[ARGS((bool))@];@+@t}\6{@>
sym_node* new_sym_node(serialize)
  bool serialize; /* should the new node receive a unique serial number? */
@y
sym_node* new_sym_node(
  bool serialize) /* should the new node receive a unique serial number? */
@z

@x [63] l.1641 Format improvement.
op_spec op_init_table[]={@/
@y
op_spec op_init_table[]={@|
@z

@x [63] l.1648 Format improvement.
{"FEQL", 0x03, 0x240a8},@/
@y
{"FEQL", 0x03, 0x240a8},@|
@z

@x [63] l.1656 Format improvement.
{"FIXU", 0x07, 0x26288},@/
@y
{"FIXU", 0x07, 0x26288},@|
@z

@x [63] l.1664 Format improvement.
{"SFLOTU", 0x0e, 0x26282},@/
@y
{"SFLOTU", 0x0e, 0x26282},@|
@z

@x [63] l.1672 Format improvement.
{"FEQLE", 0x13, 0x240a8},@/
@y
{"FEQLE", 0x13, 0x240a8},@|
@z

@x [63] l.1680 Format improvement.
{"FINT", 0x17, 0x26288},@/
@y
{"FINT", 0x17, 0x26288},@|
@z

@x [63] l.1688 Format improvement.
{"DIVU", 0x1e, 0x240a2},@/
@y
{"DIVU", 0x1e, 0x240a2},@|
@z

@x [63] l.1696 Format improvement.
{"SUBU", 0x26, 0x240a2},@/
@y
{"SUBU", 0x26, 0x240a2},@|
@z

@x [63] l.1704 Format improvement.
{"16ADDU", 0x2e, 0x240a2},@/
@y
{"16ADDU", 0x2e, 0x240a2},@|
@z

@x [63] l.1712 Format improvement.
{"NEGU", 0x36, 0x26082},@/
@y
{"NEGU", 0x36, 0x26082},@|
@z

@x [63] l.1720 Format improvement.
{"SRU", 0x3e, 0x240a2},@/
@y
{"SRU", 0x3e, 0x240a2},@|
@z

@x [63] l.1728 Format improvement.
{"BOD", 0x46, 0x22081},@/
@y
{"BOD", 0x46, 0x22081},@|
@z

@x [63] l.1736 Format improvement.
{"BEV", 0x4e, 0x22081},@/
@y
{"BEV", 0x4e, 0x22081},@|
@z

@x [63] l.1744 Format improvement.
{"PBOD", 0x56, 0x22081},@/
@y
{"PBOD", 0x56, 0x22081},@|
@z

@x [63] l.1752 Format improvement.
{"PBEV", 0x5e, 0x22081},@/
@y
{"PBEV", 0x5e, 0x22081},@|
@z

@x [63] l.1760 Format improvement.
{"CSOD", 0x66, 0x240a2},@/
@y
{"CSOD", 0x66, 0x240a2},@|
@z

@x [63] l.1768 Format improvement.
{"CSEV", 0x6e, 0x240a2},@/
@y
{"CSEV", 0x6e, 0x240a2},@|
@z

@x [63] l.1776 Format improvement.
{"ZSOD", 0x76, 0x240a2},@/
@y
{"ZSOD", 0x76, 0x240a2},@|
@z

@x [63] l.1784 Format improvement.
{"ZSEV", 0x7e, 0x240a2},@/
@y
{"ZSEV", 0x7e, 0x240a2},@|
@z

@x [63] l.1792 Format improvement.
{"LDWU", 0x86, 0xa60a2},@/
@y
{"LDWU", 0x86, 0xa60a2},@|
@z

@x [63] l.1800 Format improvement.
{"LDOU", 0x8e, 0xa60a2},@/
@y
{"LDOU", 0x8e, 0xa60a2},@|
@z

@x [63] l.1808 Format improvement.
{"LDUNC", 0x96, 0xa60a2},@/
@y
{"LDUNC", 0x96, 0xa60a2},@|
@z

@x [63] l.1816 Format improvement.
{"GO", 0x9e, 0xa60a2},@/
@y
{"GO", 0x9e, 0xa60a2},@|
@z

@x [63] l.1824 Format improvement.
{"STWU", 0xa6, 0xa60a2},@/
@y
{"STWU", 0xa6, 0xa60a2},@|
@z

@x [63] l.1832 Format improvement.
{"STOU", 0xae, 0xa60a2},@/
@y
{"STOU", 0xae, 0xa60a2},@|
@z

@x [63] l.1840 Format improvement.
{"STUNC", 0xb6, 0xa60a2},@/
@y
{"STUNC", 0xb6, 0xa60a2},@|
@z

@x [63] l.1848 Format improvement.
{"PUSHGO", 0xbe, 0xa6062},@/
@y
{"PUSHGO", 0xbe, 0xa6062},@|
@z

@x [63] l.1856 Format improvement.
{"XOR", 0xc6, 0x240a2},@/
@y
{"XOR", 0xc6, 0x240a2},@|
@z

@x [63] l.1864 Format improvement.
{"NXOR", 0xce, 0x240a2},@/
@y
{"NXOR", 0xce, 0x240a2},@|
@z

@x [63] l.1872 Format improvement.
{"ODIF", 0xd6, 0x240a2},@/
@y
{"ODIF", 0xd6, 0x240a2},@|
@z

@x [63] l.1880 Format improvement.
{"MXOR", 0xde, 0x240a2},@/
@y
{"MXOR", 0xde, 0x240a2},@|
@z

@x [63] l.1888 Format improvement.
{"SETL", 0xe3, 0x22080},@/
@y
{"SETL", 0xe3, 0x22080},@|
@z

@x [63] l.1896 Format improvement.
{"INCL", 0xe7, 0x22080},@/
@y
{"INCL", 0xe7, 0x22080},@|
@z

@x [63] l.1904 Format improvement.
{"ORL", 0xeb, 0x22080},@/
@y
{"ORL", 0xeb, 0x22080},@|
@z

@x [63] l.1912 Format improvement.
{"ANDNL", 0xef, 0x22080},@/
@y
{"ANDNL", 0xef, 0x22080},@|
@z

@x [63] l.1920 Format improvement.
{"PUT", 0xf6, 0x22002},@/
@y
{"PUT", 0xf6, 0x22002},@|
@z

@x [63] l.1928 Format improvement.
{"UNSAVE", 0xfb, 0x23a00},@/
@y
{"UNSAVE", 0xfb, 0x23a00},@|
@z

@x [63] l.1936 Format improvement.
{"TRIP", 0xff, 0x27554},@/
@y
{"TRIP", 0xff, 0x27554},@|
@z

@x [63] l.1940 Format improvement.
{"LDA", 0x22, 0xa60a2},@/
@y
{"LDA", 0x22, 0xa60a2},@|
@z

@x [63] l.1946 Format improvement.
{"PREFIX", PREFIX, 0x141000},@/
@y
{"PREFIX", PREFIX, 0x141000},@|
@z

@x [63] l.1950 Format improvement.
{"WYDE", WYDE, 0x11f000},
@y
{"WYDE", WYDE, 0x11f000},@|
@z

@x [63] l.1954 Format improvement.
{"OCTA", OCTA, 0x13f000},@/
@y
{"OCTA", OCTA, 0x13f000},@|
@z

@x [63] l.1958 Format improvement.
{"ESPEC", ESPEC, 0x141000},@/
@y
{"ESPEC", ESPEC, 0x141000},@|
@z

@x [64] l.1972 Compound literal.
  pp->equiv.h=op_init_table[j].code, pp->equiv.l=op_init_table[j].bits;
@y
  pp->equiv=(octa){op_init_table[j].code, op_init_table[j].bits};
@z

@x [69] l.2009 Format improvement.
{"ROUND_NEAR",0,4},@/
@y
{"ROUND_NEAR",0,4},@|
@z

@x [69] l.2011 Format improvement.
{"Inf",0x7ff00000,0},@/
@y
{"Inf",0x7ff00000,0},@|
@z

@x [69] l.2015 Format improvement.
{"Pool_Segment",0x40000000,0},
@y
{"Pool_Segment",0x40000000,0},@|
@z

@x [69] l.2017 Format improvement.
{"Stack_Segment",0x60000000,0},@/
@y
{"Stack_Segment",0x60000000,0},@|
@z

@x [69] l.2033 Format improvement.
{"X_BIT",0,0x01},@/
@y
{"X_BIT",0,0x01},@|
@z

@x [69] l.2049 Format improvement.
{"X_Handler",0,0x80},@/
@y
{"X_Handler",0,0x80},@|
@z

@x [69] l.2055 Format improvement.
{"StdErr",0,2},@/
@y
{"StdErr",0,2},@|
@z

@x [69] l.2065 Format improvement.
{"BinaryReadWrite",0,4},@/
@y
{"BinaryReadWrite",0,4},@|
@z

@x [70] l.2098 Compound literal.
  pp->equiv.h=predefs[j].h, pp->equiv.l=predefs[j].l;
@y
  pp->equiv=(octa){predefs[j].h, predefs[j].l};
@z

@x [73] l.2148 C99 prototypes for C2x.
trie_node* prune @,@,@[ARGS((trie_node*))@];@+@t}\6{@>
trie_node* prune(t)
  trie_node* t;
@y
trie_node* prune(
  trie_node* t)
@z

@x [73] l.2152
  register int useful=0;
@y
  bool useful=false;
@z

@x [73] l.2154
    if (t->sym->serial) useful=1;
@y
    if (t->sym->serial) useful=true;
@z

@x [73] l.2159
    if (t->left) useful=1;
@y
    if (t->left) useful=true;
@z

@x [73] l.2163
    if (t->mid) useful=1;
@y
    if (t->mid) useful=true;
@z

@x [73] l.2167
    if (t->right) useful=1;
@y
    if (t->right) useful=true;
@z

@x [74] l.2176 C99 prototypes for C2x.
void out_stab @,@,@[ARGS((trie_node*))@];@+@t}\6{@>
void out_stab(t)
  trie_node* t;
@y
void out_stab(
  trie_node* t)
@z

@x [74] l.2181 Block-local variable.
  register sym_node *pp;
@y
@z

@x [76] l.2229 Change from MMIX home.
  for (j=1;j<4;j++) if (x<(1<<(8*j))) break;
@y
  for (j=1;j<4;j++) if (x<(tetra)(1<<(8*j))) break;
@z

@x [78] l.2248 Block-local variable.
  *sym_ptr='\0';
  fprintf(listing_file," %s = ",sym_buf+1);
  pp=t->sym;
@y
  register sym_node *pp=t->sym;
  *sym_ptr='\0';
  fprintf(listing_file," %s = ",sym_buf+1);
@z

@x [85] l.2341
while (1) {
@y
while (true) {
@z

@x [86] l.2371
 if (*(p-1)) derr("syntax error at character `%c'",*(p-1));
 derr("syntax error after character `%c'",*(p-2));
@y
 if (*(p-1)) err("syntax error at character `%c'",*(p-1));
 err("syntax error after character `%c'",*(p-2));
@z

@x [92] l.2419 Compound literal.
acc.h=0, acc.l=(unsigned char)*p;
@y
acc=(octa){0, (unsigned char)*p};
@z

@x [93] l.2424 Compound literal.
acc.h=0, acc.l=(unsigned char)*p;
@y
acc=(octa){0, (unsigned char)*p};
@z

@x [94] l.2433 Compound literal.
acc.h=0, acc.l=*p-'0';
@y
acc=(octa){0, *p-'0'};
@z

@x [95] l.2446 RAII.
acc.h=acc.l=0;
@y
acc=zero_octa;
@z

@x [97] l.2469
  derr("syntax error at `%c'",*(p-2));
@y
  err("syntax error at `%c'",*(p-2));
@z

@x [97] l.2471 GCC warning.
 case '&': rt_op=and;@+break;
@y
  @=/* fall through */@>@;
 case '&': rt_op=and;@+break;
@z

@x [97] l.2476
 default: derr("syntax error at `%c'",*(p-1));
@y
 default: err("syntax error at `%c'",*(p-1));
@z

@x [98] l.2499 Change from MMIX home.
 @t\4@>@<Cases for unary operators@>@;
@y
 case outer_rp: case inner_rp:@+goto scan_close; /* should not happen */
 @t\4@>@<Cases for unary operators@>@;
@z

@x [100] l.2523
                 derr("can %s pure values only",verb)
@y
                 err("can %s pure values only",verb)
@z

@x [100] l.2533
 top_val.equiv.h=~top_val.equiv.h, top_val.equiv.l=~top_val.equiv.l;
@y
 top_val.equiv=onot(top_val.equiv); @+
@z

@x [100] l.2541
 top_val.equiv.h=0, top_val.equiv.l=top_val.link->sym->serial;
@y
 top_val.equiv=(octa){0,top_val.link->sym->serial};
@z

@x [101] l.2544
      derr("can %s pure values only",verb)
@y
      err("can %s pure values only",verb)
@z

@x [101] l.2582
 next_val.equiv.h&=top_val.equiv.h, next_val.equiv.l&=top_val.equiv.l;
@y
 next_val.equiv = oand(next_val.equiv,top_val.equiv); @+
@z

@x [101] l.2585
 next_val.equiv.h|=top_val.equiv.h, next_val.equiv.l|=top_val.equiv.l;
@y
 next_val.equiv = oor(next_val.equiv,top_val.equiv); @+
@z

@x [101] l.2588
 next_val.equiv.h^=top_val.equiv.h, next_val.equiv.l^=top_val.equiv.l;
@y
 next_val.equiv = oxor(next_val.equiv,top_val.equiv); @+
@z

@x [102] l.2602
  derr("cannot use `%s' in special mode",op_field);
@y
  err("cannot use `%s' in special mode",op_field);
@z

@x [102] l.2605
  derr("*label field of `%s' instruction is ignored",op_field);
@y
  err("*label field of `%s' instruction is ignored",op_field);
@z

@x [103] l.2622
  if (*p && !isspace(*p)) derr("label syntax error at `%c'",*p);
@y
  if (*p && !isspace(*p)) err("label syntax error at `%c'",*p);
@z

@x [103] l.2627
  derr("improper local label `%s'",lab_field);
@y
  err("improper local label `%s'",lab_field);
@z

@x [104] l.2638
if (!isspace(*p) && *p && op_field[0]) derr("opcode syntax error at `%c'",*p);
@y
if (!isspace(*p) && *p && op_field[0]) err("opcode syntax error at `%c'",*p);
@z

@x [104] l.2642
  if (op_field[0]) derr("unknown operation code `%s'",op_field);
@.unknown operation code@>
  if (lab_field[0]) derr("*no opcode; label `%s' will be ignored",lab_field);
@y
  if (op_field[0]) err("unknown operation code `%s'",op_field);
@.unknown operation code@>
  if (lab_field[0]) err("*no opcode; label `%s' will be ignored",lab_field);
@z

@x [107] l.2688 Compound literal.
  acc.h=-1, acc.l=-(1<<j);
@y
  acc=(octa){-1, -(1<<j)};
@z

@x [109] l.2730
  }@+else if (opcode==GREG) cur_loc.h=0, cur_loc.l=cur_greg, new_link=REGISTER;
@y
  }@+else if (opcode==GREG) cur_loc=(octa){0,cur_greg}, new_link=REGISTER;
@z

@x [109] l.2732
      if (pp->serial) derr("symbol `%s' is already defined",lab_field);
@y
      if (pp->serial) err("symbol `%s' is already defined",lab_field);
@z

@x [109] l.2735
      derr("*redefinition of predefined symbol `%s'",lab_field);
@y
      err("*redefinition of predefined symbol `%s'",lab_field);
@z

@x [109] l.2742 CWEB behavior changed between versions 2.8 and 3.0.
    do @<Fix prior references to this label@>@;@+while (pp->link);
@y
    do @<Fix prior references to this label@>@; while (pp->link);
@z

@x [114] l.279ß RAII.
  octa o;
  o=ominus(cur_loc,qq->equiv);
@y
  octa o=ominus(cur_loc,qq->equiv);
@z

@x [114] l.2793
    dderr("*relative address in location #%08x%08x not divisible by 4",
@y
    err("*relative address in location #%08x%08x not divisible by 4",
@z

@x [114] l.2810
  if (k) dderr("relative address in location #%08x%08x is too far away",
               qq->equiv.h,qq->equiv.l);
@y
  if (k) err("relative address in location #%08x%08x is too far away",
               qq->equiv.h,qq->equiv.l);
@z

@x [115] l.2815 GCC warning.
if (new_link==DEFINED) {
@y
{ if (new_link==DEFINED) {
@z

@x [115] l.2821 GCC warning.
}
@y
} }
@z

@x [116] l.2828
    derr("opcode `%s' needs more than one operand",op_field);
@y
    err("opcode `%s' needs more than one operand",op_field);
@z

@x [116] l.2831 GCC warning.
case 2:@+if (!(op_bits&two_arg_bit))
    if (op_bits&one_arg_bit)
      derr("opcode `%s' must not have two operands",op_field)@;
    else derr("opcode `%s' must have more than two operands",op_field);
@y
case 2:@+if (!(op_bits&two_arg_bit)) {
    if (op_bits&one_arg_bit)
      err("opcode `%s' must not have two operands",op_field)@;
    else err("opcode `%s' must have more than two operands",op_field); }
@z

@x [116] l.2840 GCC warning.
case 3:@+if (!(op_bits&three_arg_bit))
    derr("opcode `%s' must not have three operands",op_field);
  @<Do a three-operand operation@>;
default: derr("too many operands for opcode `%s'",op_field);
@y
  @=/* fall through */@>@;
case 3:@+if (!(op_bits&three_arg_bit))
    err("opcode `%s' must not have three operands",op_field);
  @<Do a three-operand operation@>;
default: err("too many operands for opcode `%s'",op_field);
@z

@x [117] l.2853 GCC warning.
    if (k==1) err("*constant doesn't fit in one byte")@;
@.constant doesn't fit...@>
    else derr("*constant doesn't fit in %d bytes",k);
@y
  { if (k==1) err("*constant doesn't fit in one byte")@;
@.constant doesn't fit...@>
    else err("*constant doesn't fit in %d bytes",k); }
@z

@x [121] l.2899
    derr("*Z field of `%s' should not be a register number",op_field);
@y
    err("*Z field of `%s' should not be a register number",op_field);
@z

@x [121] l.2903
  derr("*Z field of `%s' should be a register number",op_field);
@y
  err("*Z field of `%s' should be a register number",op_field);
@z

@x [122] l.2914
    derr("*Y field of `%s' should not be a register number",op_field);
@y
    err("*Y field of `%s' should not be a register number",op_field);
@z

@x [122] l.2917
  derr("*Y field of `%s' should be a register number",op_field);
@y
  err("*Y field of `%s' should be a register number",op_field);
@z

@x [123] l.2929
    derr("*X field of `%s' should not be a register number",op_field);
@y
    err("*X field of `%s' should not be a register number",op_field);
@z

@x [123] l.2932
  derr("*X field of `%s' should be a register number",op_field);
@y
  err("*X field of `%s' should be a register number",op_field);
@z

@x [124] l.2947
    derr("*YZ field of `%s' should not be a register number",op_field);
@y
    err("*YZ field of `%s' should not be a register number",op_field);
@z

@x [124] l.2958
    derr("*YZ field of `%s' should be a register number",op_field);
@y
    err("*YZ field of `%s' should be a register number",op_field);
@z

@x [127] l.3004 RAII.
  octa o;
  o=val_stack[1].equiv, k=0;
@y
  octa o=val_stack[1].equiv;
  k=0;
@z

@x [129] l.3050
    derr("*operand of `%s' should not be a register number",op_field);
@y
    err("*operand of `%s' should not be a register number",op_field);
@z

@x [129] l.3054
    derr("*operand of `%s' should be a register number",op_field);
@y
    err("*operand of `%s' should be a register number",op_field);
@z

@x [132] l.3109 Change from MMIX home.
 case LOCAL:@+if (val_stack[0].equiv.l>lreg) lreg=val_stack[0].equiv.l;
@y
 case LOCAL:@+if (val_stack[0].equiv.l>(tetra)lreg) lreg=val_stack[0].equiv.l;
@z

@x [134] l.3128 GCC warning.
if (val_stack[0].equiv.l || val_stack[0].equiv.h) {
@y
{ if (val_stack[0].equiv.l || val_stack[0].equiv.h) {
@z

@x [134] l.3136 GCC warning.
}
@y
} }
@z

@x [136] l.3168 Improved module structure with interfaces.
@<Preprocessor definitions@>@;
@y
@h
@<Preprocessor macros@>@;
@z

@x [136] l.3171 C99 prototypes for C2x.
@<Subroutines@>@;
@#
int main(argc,argv)
  int argc;@+
  char *argv[];
@y
@<Prototypes@>@;
@<Subroutines@>@;
@#
int main(
  int argc,
  char *argv[])
@z

@x [136] l.3183
  while(1) {
@y
  while (true) {
@z

@x [136] l.3185
    while(1) {
@y
    while (true) {
@z

@x [138] l.3216
if (!src_file) dpanic("Can't open the source file %s",src_file_name);
@y
if (!src_file) panic("Can't open the source file %s",src_file_name);
@z

@x [138] l.3225
if (!obj_file) dpanic("Can't open the object file %s",obj_file_name);
@y
if (!obj_file) panic("Can't open the object file %s",obj_file_name);
@z

@x [138] l.3228
  if (!listing_file) dpanic("Can't open the listing file %s",listing_name);
@y
  if (!listing_file) panic("Can't open the listing file %s",listing_name);
@z

@x [142] l.3252
  dpanic("Danger: Must reduce the number of GREGs by %d",lreg-greg+1);
@y
  panic("Danger: Must reduce the number of GREGs by %d",lreg-greg+1);
@z
