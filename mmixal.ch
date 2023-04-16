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
{"TRAP", 0x00, 0x27554},
@.TRAP@>
{"FCMP", 0x01, 0x240a8},
@.FCMP@>
{"FUN", 0x02, 0x240a8},
@.FUN@>
{"FEQL", 0x03, 0x240a8},@/
@.FEQL@>
{"FADD", 0x04, 0x240a8},
@.FADD@>
{"FIX", 0x05, 0x26288},
@.FIX@>
{"FSUB", 0x06, 0x240a8},
@.FSUB@>
{"FIXU", 0x07, 0x26288},@/
@.FIXU@>
{"FLOT", 0x08, 0x26282},
@.FLOT@>
{"FLOTU", 0x0a, 0x26282},
@.FLOTU@>
{"SFLOT", 0x0c, 0x26282},
@.SFLOT@>
{"SFLOTU", 0x0e, 0x26282},@/
@.SFLOTU@>
{"FMUL", 0x10, 0x240a8},
@.FMUL@>
{"FCMPE", 0x11, 0x240a8},
@.FCMPE@>
{"FUNE", 0x12, 0x240a8},
@.FUNE@>
{"FEQLE", 0x13, 0x240a8},@/
@.FEQLE@>
{"FDIV", 0x14, 0x240a8},
@.FDIV@>
{"FSQRT", 0x15, 0x26288},
@.FSQRT@>
{"FREM", 0x16, 0x240a8},
@.FREM@>
{"FINT", 0x17, 0x26288},@/
@.FINT@>
{"MUL", 0x18, 0x240a2},
@.MUL@>
{"MULU", 0x1a, 0x240a2},
@.MULU@>
{"DIV", 0x1c, 0x240a2},
@.DIV@>
{"DIVU", 0x1e, 0x240a2},@/
@.DIVU@>
{"ADD", 0x20, 0x240a2},
@.ADD@>
{"ADDU", 0x22, 0x240a2},
@.ADDU@>
{"SUB", 0x24, 0x240a2},
@.SUB@>
{"SUBU", 0x26, 0x240a2},@/
@.SUBU@>
{"2ADDU", 0x28, 0x240a2},
@.2ADDU@>
{"4ADDU", 0x2a, 0x240a2},
@.4ADDU@>
{"8ADDU", 0x2c, 0x240a2},
@.8ADDU@>
{"16ADDU", 0x2e, 0x240a2},@/
@.16ADDU@>
{"CMP", 0x30, 0x240a2},
@.CMP@>
{"CMPU", 0x32, 0x240a2},
@.CMPU@>
{"NEG", 0x34, 0x26082},
@.NEG@>
{"NEGU", 0x36, 0x26082},@/
@.NEGU@>
{"SL", 0x38, 0x240a2},
@.SL@>
{"SLU", 0x3a, 0x240a2},
@.SLU@>
{"SR", 0x3c, 0x240a2},
@.SR@>
{"SRU", 0x3e, 0x240a2},@/
@.SRU@>
{"BN", 0x40, 0x22081},
@.BN@>
{"BZ", 0x42, 0x22081},
@.BZ@>
{"BP", 0x44, 0x22081},
@.BP@>
{"BOD", 0x46, 0x22081},@/
@.BOD@>
{"BNN", 0x48, 0x22081},
@.BNN@>
{"BNZ", 0x4a, 0x22081},
@.BNZ@>
{"BNP", 0x4c, 0x22081},
@.BNP@>
{"BEV", 0x4e, 0x22081},@/
@.BEV@>
{"PBN", 0x50, 0x22081},
@.PBN@>
{"PBZ", 0x52, 0x22081},
@.PBZ@>
{"PBP", 0x54, 0x22081},
@.PBP@>
{"PBOD", 0x56, 0x22081},@/
@.PBOD@>
{"PBNN", 0x58, 0x22081},
@.PBNN@>
{"PBNZ", 0x5a, 0x22081},
@.PBNZ@>
{"PBNP", 0x5c, 0x22081},
@.PBNP@>
{"PBEV", 0x5e, 0x22081},@/
@.PBEV@>
{"CSN", 0x60, 0x240a2},
@.CSN@>
{"CSZ", 0x62, 0x240a2},
@.CSZ@>
{"CSP", 0x64, 0x240a2},
@.CSP@>
{"CSOD", 0x66, 0x240a2},@/
@.CSOD@>
{"CSNN", 0x68, 0x240a2},
@.CSNN@>
{"CSNZ", 0x6a, 0x240a2},
@.CSNZ@>
{"CSNP", 0x6c, 0x240a2},
@.CSNP@>
{"CSEV", 0x6e, 0x240a2},@/
@.CSEV@>
{"ZSN", 0x70, 0x240a2},
@.ZSN@>
{"ZSZ", 0x72, 0x240a2},
@.ZSZ@>
{"ZSP", 0x74, 0x240a2},
@.ZSP@>
{"ZSOD", 0x76, 0x240a2},@/
@.ZSOD@>
{"ZSNN", 0x78, 0x240a2},
@.ZSNN@>
{"ZSNZ", 0x7a, 0x240a2},
@.ZSNZ@>
{"ZSNP", 0x7c, 0x240a2},
@.ZSNP@>
{"ZSEV", 0x7e, 0x240a2},@/
@.ZSEV@>
{"LDB", 0x80, 0xa60a2},
@.LDB@>
{"LDBU", 0x82, 0xa60a2},
@.LDBU@>
{"LDW", 0x84, 0xa60a2},
@.LDW@>
{"LDWU", 0x86, 0xa60a2},@/
@.LDWU@>
{"LDT", 0x88, 0xa60a2},
@.LDT@>
{"LDTU", 0x8a, 0xa60a2},
@.LDTU@>
{"LDO", 0x8c, 0xa60a2},
@.LDO@>
{"LDOU", 0x8e, 0xa60a2},@/
@.LDOU@>
{"LDSF", 0x90, 0xa60a2},
@.LDSF@>
{"LDHT", 0x92, 0xa60a2},
@.LDHT@>
{"CSWAP", 0x94, 0xa60a2},
@.CSWAP@>
{"LDUNC", 0x96, 0xa60a2},@/
@.LDUNC@>
{"LDVTS", 0x98, 0xa60a2},
@.LDVTS@>
{"PRELD", 0x9a, 0xa6022},
@.PRELD@>
{"PREGO", 0x9c, 0xa6022},
@.PREGO@>
{"GO", 0x9e, 0xa60a2},@/
@.GO@>
{"STB", 0xa0, 0xa60a2},
@.STB@>
{"STBU", 0xa2, 0xa60a2},
@.STBU@>
{"STW", 0xa4, 0xa60a2},
@.STW@>
{"STWU", 0xa6, 0xa60a2},@/
@.STWU@>
{"STT", 0xa8, 0xa60a2},
@.STT@>
{"STTU", 0xaa, 0xa60a2},
@.STTU@>
{"STO", 0xac, 0xa60a2},
@.STO@>
{"STOU", 0xae, 0xa60a2},@/
@.STOU@>
{"STSF", 0xb0, 0xa60a2},
@.STSF@>
{"STHT", 0xb2, 0xa60a2},
@.STHT@>
{"STCO", 0xb4, 0xa6022},
@.STCO@>
{"STUNC", 0xb6, 0xa60a2},@/
@.STUNC@>
{"SYNCD", 0xb8, 0xa6022},
@.SYNCD@>
{"PREST", 0xba, 0xa6022},
@.PREST@>
{"SYNCID", 0xbc, 0xa6022},
@.SYNCID@>
{"PUSHGO", 0xbe, 0xa6062},@/
@.PUSHGO@>
{"OR", 0xc0, 0x240a2},
@.OR@>
{"ORN", 0xc2, 0x240a2},
@.ORN@>
{"NOR", 0xc4, 0x240a2},
@.NOR@>
{"XOR", 0xc6, 0x240a2},@/
@.XOR@>
{"AND", 0xc8, 0x240a2},
@.AND@>
{"ANDN", 0xca, 0x240a2},
@.ANDN@>
{"NAND", 0xcc, 0x240a2},
@.NAND@>
{"NXOR", 0xce, 0x240a2},@/
@.NXOR@>
{"BDIF", 0xd0, 0x240a2},
@.BDIF@>
{"WDIF", 0xd2, 0x240a2},
@.WDIF@>
{"TDIF", 0xd4, 0x240a2},
@.TDIF@>
{"ODIF", 0xd6, 0x240a2},@/
@.ODIF@>
{"MUX", 0xd8, 0x240a2},
@.MUX@>
{"SADD", 0xda, 0x240a2},
@.SADD@>
{"MOR", 0xdc, 0x240a2},
@.MOR@>
{"MXOR", 0xde, 0x240a2},@/
@.MXOR@>
{"SETH", 0xe0, 0x22080},
@.SETH@>
{"SETMH", 0xe1, 0x22080},
@.SETMH@>
{"SETML", 0xe2, 0x22080},
@.SETML@>
{"SETL", 0xe3, 0x22080},@/
@.SETL@>
{"INCH", 0xe4, 0x22080},
@.INCH@>
{"INCMH", 0xe5, 0x22080},
@.INCMH@>
{"INCML", 0xe6, 0x22080},
@.INCML@>
{"INCL", 0xe7, 0x22080},@/
@.INCL@>
{"ORH", 0xe8, 0x22080},
@.ORH@>
{"ORMH", 0xe9, 0x22080},
@.ORMH@>
{"ORML", 0xea, 0x22080},
@.ORML@>
{"ORL", 0xeb, 0x22080},@/
@.ORL@>
{"ANDNH", 0xec, 0x22080},
@.ANDNH@>
{"ANDNMH", 0xed, 0x22080},
@.ANDNMH@>
{"ANDNML", 0xee, 0x22080},
@.ANDNML@>
{"ANDNL", 0xef, 0x22080},@/
@.ANDNL@>
{"JMP", 0xf0, 0x21001},
@.JMP@>
{"PUSHJ", 0xf2, 0x22041},
@.PUSHJ@>
{"GETA", 0xf4, 0x22081},
@.GETA@>
{"PUT", 0xf6, 0x22002},@/
@.PUT@>
{"POP", 0xf8, 0x23000},
@.POP@>
{"RESUME", 0xf9, 0x21000},
@.RESUME@>
{"SAVE", 0xfa, 0x22080},
@.SAVE@>
{"UNSAVE", 0xfb, 0x23a00},@/
@.UNSAVE@>
{"SYNC", 0xfc, 0x21000},
@.SYNC@>
{"SWYM", 0xfd, 0x27554},
@.SWYM@>
{"GET", 0xfe, 0x22080},
@.GET@>
{"TRIP", 0xff, 0x27554},@/
@.TRIP@>
{"SET",SET, 0x22180},
@.SET@>
{"LDA", 0x22, 0xa60a2},@/
@.LDA@>
{"IS", IS, 0x101400},
@.IS@>
{"LOC", LOC, 0x1400},
@.LOC@>
{"PREFIX", PREFIX, 0x141000},@/
@.PREFIX@>
{"BYTE", BYTE, 0x10f000},
@.BYTE@>
{"WYDE", WYDE, 0x11f000},
@.WYDE@>
{"TETRA", TETRA, 0x12f000},
@.TETRA@>
{"OCTA", OCTA, 0x13f000},@/
@.OCTA@>
{"BSPEC", BSPEC, 0x41400},
@.BSPEC@>
{"ESPEC", ESPEC, 0x141000},@/
@.ESPEC@>
{"GREG", GREG, 0x101000},
@.GREG@>
{"LOCAL", LOCAL, 0x141800}};
@y
op_spec op_init_table[]={@|
{"TRAP", 0x00, 0x27554},
@.TRAP@>
{"FCMP", 0x01, 0x240a8},
@.FCMP@>
{"FUN", 0x02, 0x240a8},
@.FUN@>
{"FEQL", 0x03, 0x240a8},@|
@.FEQL@>
{"FADD", 0x04, 0x240a8},
@.FADD@>
{"FIX", 0x05, 0x26288},
@.FIX@>
{"FSUB", 0x06, 0x240a8},
@.FSUB@>
{"FIXU", 0x07, 0x26288},@|
@.FIXU@>
{"FLOT", 0x08, 0x26282},
@.FLOT@>
{"FLOTU", 0x0a, 0x26282},
@.FLOTU@>
{"SFLOT", 0x0c, 0x26282},
@.SFLOT@>
{"SFLOTU", 0x0e, 0x26282},@|
@.SFLOTU@>
{"FMUL", 0x10, 0x240a8},
@.FMUL@>
{"FCMPE", 0x11, 0x240a8},
@.FCMPE@>
{"FUNE", 0x12, 0x240a8},
@.FUNE@>
{"FEQLE", 0x13, 0x240a8},@|
@.FEQLE@>
{"FDIV", 0x14, 0x240a8},
@.FDIV@>
{"FSQRT", 0x15, 0x26288},
@.FSQRT@>
{"FREM", 0x16, 0x240a8},
@.FREM@>
{"FINT", 0x17, 0x26288},@|
@.FINT@>
{"MUL", 0x18, 0x240a2},
@.MUL@>
{"MULU", 0x1a, 0x240a2},
@.MULU@>
{"DIV", 0x1c, 0x240a2},
@.DIV@>
{"DIVU", 0x1e, 0x240a2},@|
@.DIVU@>
{"ADD", 0x20, 0x240a2},
@.ADD@>
{"ADDU", 0x22, 0x240a2},
@.ADDU@>
{"SUB", 0x24, 0x240a2},
@.SUB@>
{"SUBU", 0x26, 0x240a2},@|
@.SUBU@>
{"2ADDU", 0x28, 0x240a2},
@.2ADDU@>
{"4ADDU", 0x2a, 0x240a2},
@.4ADDU@>
{"8ADDU", 0x2c, 0x240a2},
@.8ADDU@>
{"16ADDU", 0x2e, 0x240a2},@|
@.16ADDU@>
{"CMP", 0x30, 0x240a2},
@.CMP@>
{"CMPU", 0x32, 0x240a2},
@.CMPU@>
{"NEG", 0x34, 0x26082},
@.NEG@>
{"NEGU", 0x36, 0x26082},@|
@.NEGU@>
{"SL", 0x38, 0x240a2},
@.SL@>
{"SLU", 0x3a, 0x240a2},
@.SLU@>
{"SR", 0x3c, 0x240a2},
@.SR@>
{"SRU", 0x3e, 0x240a2},@|
@.SRU@>
{"BN", 0x40, 0x22081},
@.BN@>
{"BZ", 0x42, 0x22081},
@.BZ@>
{"BP", 0x44, 0x22081},
@.BP@>
{"BOD", 0x46, 0x22081},@|
@.BOD@>
{"BNN", 0x48, 0x22081},
@.BNN@>
{"BNZ", 0x4a, 0x22081},
@.BNZ@>
{"BNP", 0x4c, 0x22081},
@.BNP@>
{"BEV", 0x4e, 0x22081},@|
@.BEV@>
{"PBN", 0x50, 0x22081},
@.PBN@>
{"PBZ", 0x52, 0x22081},
@.PBZ@>
{"PBP", 0x54, 0x22081},
@.PBP@>
{"PBOD", 0x56, 0x22081},@|
@.PBOD@>
{"PBNN", 0x58, 0x22081},
@.PBNN@>
{"PBNZ", 0x5a, 0x22081},
@.PBNZ@>
{"PBNP", 0x5c, 0x22081},
@.PBNP@>
{"PBEV", 0x5e, 0x22081},@|
@.PBEV@>
{"CSN", 0x60, 0x240a2},
@.CSN@>
{"CSZ", 0x62, 0x240a2},
@.CSZ@>
{"CSP", 0x64, 0x240a2},
@.CSP@>
{"CSOD", 0x66, 0x240a2},@|
@.CSOD@>
{"CSNN", 0x68, 0x240a2},
@.CSNN@>
{"CSNZ", 0x6a, 0x240a2},
@.CSNZ@>
{"CSNP", 0x6c, 0x240a2},
@.CSNP@>
{"CSEV", 0x6e, 0x240a2},@|
@.CSEV@>
{"ZSN", 0x70, 0x240a2},
@.ZSN@>
{"ZSZ", 0x72, 0x240a2},
@.ZSZ@>
{"ZSP", 0x74, 0x240a2},
@.ZSP@>
{"ZSOD", 0x76, 0x240a2},@|
@.ZSOD@>
{"ZSNN", 0x78, 0x240a2},
@.ZSNN@>
{"ZSNZ", 0x7a, 0x240a2},
@.ZSNZ@>
{"ZSNP", 0x7c, 0x240a2},
@.ZSNP@>
{"ZSEV", 0x7e, 0x240a2},@|
@.ZSEV@>
{"LDB", 0x80, 0xa60a2},
@.LDB@>
{"LDBU", 0x82, 0xa60a2},
@.LDBU@>
{"LDW", 0x84, 0xa60a2},
@.LDW@>
{"LDWU", 0x86, 0xa60a2},@|
@.LDWU@>
{"LDT", 0x88, 0xa60a2},
@.LDT@>
{"LDTU", 0x8a, 0xa60a2},
@.LDTU@>
{"LDO", 0x8c, 0xa60a2},
@.LDO@>
{"LDOU", 0x8e, 0xa60a2},@|
@.LDOU@>
{"LDSF", 0x90, 0xa60a2},
@.LDSF@>
{"LDHT", 0x92, 0xa60a2},
@.LDHT@>
{"CSWAP", 0x94, 0xa60a2},
@.CSWAP@>
{"LDUNC", 0x96, 0xa60a2},@|
@.LDUNC@>
{"LDVTS", 0x98, 0xa60a2},
@.LDVTS@>
{"PRELD", 0x9a, 0xa6022},
@.PRELD@>
{"PREGO", 0x9c, 0xa6022},
@.PREGO@>
{"GO", 0x9e, 0xa60a2},@|
@.GO@>
{"STB", 0xa0, 0xa60a2},
@.STB@>
{"STBU", 0xa2, 0xa60a2},
@.STBU@>
{"STW", 0xa4, 0xa60a2},
@.STW@>
{"STWU", 0xa6, 0xa60a2},@|
@.STWU@>
{"STT", 0xa8, 0xa60a2},
@.STT@>
{"STTU", 0xaa, 0xa60a2},
@.STTU@>
{"STO", 0xac, 0xa60a2},
@.STO@>
{"STOU", 0xae, 0xa60a2},@|
@.STOU@>
{"STSF", 0xb0, 0xa60a2},
@.STSF@>
{"STHT", 0xb2, 0xa60a2},
@.STHT@>
{"STCO", 0xb4, 0xa6022},
@.STCO@>
{"STUNC", 0xb6, 0xa60a2},@|
@.STUNC@>
{"SYNCD", 0xb8, 0xa6022},
@.SYNCD@>
{"PREST", 0xba, 0xa6022},
@.PREST@>
{"SYNCID", 0xbc, 0xa6022},
@.SYNCID@>
{"PUSHGO", 0xbe, 0xa6062},@|
@.PUSHGO@>
{"OR", 0xc0, 0x240a2},
@.OR@>
{"ORN", 0xc2, 0x240a2},
@.ORN@>
{"NOR", 0xc4, 0x240a2},
@.NOR@>
{"XOR", 0xc6, 0x240a2},@|
@.XOR@>
{"AND", 0xc8, 0x240a2},
@.AND@>
{"ANDN", 0xca, 0x240a2},
@.ANDN@>
{"NAND", 0xcc, 0x240a2},
@.NAND@>
{"NXOR", 0xce, 0x240a2},@|
@.NXOR@>
{"BDIF", 0xd0, 0x240a2},
@.BDIF@>
{"WDIF", 0xd2, 0x240a2},
@.WDIF@>
{"TDIF", 0xd4, 0x240a2},
@.TDIF@>
{"ODIF", 0xd6, 0x240a2},@|
@.ODIF@>
{"MUX", 0xd8, 0x240a2},
@.MUX@>
{"SADD", 0xda, 0x240a2},
@.SADD@>
{"MOR", 0xdc, 0x240a2},
@.MOR@>
{"MXOR", 0xde, 0x240a2},@|
@.MXOR@>
{"SETH", 0xe0, 0x22080},
@.SETH@>
{"SETMH", 0xe1, 0x22080},
@.SETMH@>
{"SETML", 0xe2, 0x22080},
@.SETML@>
{"SETL", 0xe3, 0x22080},@|
@.SETL@>
{"INCH", 0xe4, 0x22080},
@.INCH@>
{"INCMH", 0xe5, 0x22080},
@.INCMH@>
{"INCML", 0xe6, 0x22080},
@.INCML@>
{"INCL", 0xe7, 0x22080},@|
@.INCL@>
{"ORH", 0xe8, 0x22080},
@.ORH@>
{"ORMH", 0xe9, 0x22080},
@.ORMH@>
{"ORML", 0xea, 0x22080},
@.ORML@>
{"ORL", 0xeb, 0x22080},@|
@.ORL@>
{"ANDNH", 0xec, 0x22080},
@.ANDNH@>
{"ANDNMH", 0xed, 0x22080},
@.ANDNMH@>
{"ANDNML", 0xee, 0x22080},
@.ANDNML@>
{"ANDNL", 0xef, 0x22080},@|
@.ANDNL@>
{"JMP", 0xf0, 0x21001},
@.JMP@>
{"PUSHJ", 0xf2, 0x22041},
@.PUSHJ@>
{"GETA", 0xf4, 0x22081},
@.GETA@>
{"PUT", 0xf6, 0x22002},@|
@.PUT@>
{"POP", 0xf8, 0x23000},
@.POP@>
{"RESUME", 0xf9, 0x21000},
@.RESUME@>
{"SAVE", 0xfa, 0x22080},
@.SAVE@>
{"UNSAVE", 0xfb, 0x23a00},@|
@.UNSAVE@>
{"SYNC", 0xfc, 0x21000},
@.SYNC@>
{"SWYM", 0xfd, 0x27554},
@.SWYM@>
{"GET", 0xfe, 0x22080},
@.GET@>
{"TRIP", 0xff, 0x27554},@|
@.TRIP@>
{"SET",SET, 0x22180},
@.SET@>
{"LDA", 0x22, 0xa60a2},@|
@.LDA@>
{"IS", IS, 0x101400},
@.IS@>
{"LOC", LOC, 0x1400},
@.LOC@>
{"PREFIX", PREFIX, 0x141000},@|
@.PREFIX@>
{"BYTE", BYTE, 0x10f000},
@.BYTE@>
{"WYDE", WYDE, 0x11f000},@|
@.WYDE@>
{"TETRA", TETRA, 0x12f000},
@.TETRA@>
{"OCTA", OCTA, 0x13f000},@|
@.OCTA@>
{"BSPEC", BSPEC, 0x41400},
@.BSPEC@>
{"ESPEC", ESPEC, 0x141000},@|
@.ESPEC@>
{"GREG", GREG, 0x101000},
@.GREG@>
{"LOCAL", LOCAL, 0x141800}};
@z

@x [69] l.2009
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

@x [73] l.2148
trie_node* prune @,@,@[ARGS((trie_node*))@];@+@t}\6{@>
@y
@z

@x [74] l.2176
void out_stab @,@,@[ARGS((trie_node*))@];@+@t}\6{@>
@y
@z

@x [76] l.2229
  for (j=1;j<4;j++) if (x<(1<<(8*j))) break;
@y
  for (j=1;j<4;j++) if (x<(tetra)(1<<(8*j))) break;
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
 case inner_rp: case outer_rp:@+goto scan_close;
 @t\4@>@<Cases for unary operators@>@;
@z

@x [109] l.2747
  if (listing_file && (opcode==IS || opcode==LOC))
    @<Make special listing to show the label equivalent@>;
@y
  if (listing_file && (opcode==IS || opcode==LOC))
  { @<Make special listing to show the label equivalent@>; }
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

@x l.2840
case 3:@+if (!(op_bits&three_arg_bit))
@y
  @=/* fall through */@>@;
case 3:@+if (!(op_bits&three_arg_bit))
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

@x [132] l.3107
 case GREG:@+if (listing_file) @<Make listing for |GREG|@>;
@y
 case GREG:@+if (listing_file) { @<Make listing for |GREG|@>; }
@z

@x l.3109
 case LOCAL:@+if (val_stack[0].equiv.l>lreg) lreg=val_stack[0].equiv.l;
@y
 case LOCAL:@+if (val_stack[0].equiv.l>(tetra)lreg) lreg=val_stack[0].equiv.l;
@z

@x [136] l.3166
#include <time.h>
@y
#include <time.h>
@#
#include "mmix-arith.h"
@z

@x [136] l.3171
@<Subroutines@>@;
@y
@<Prototypes@>@;
@<Subroutines@>@;
@z
