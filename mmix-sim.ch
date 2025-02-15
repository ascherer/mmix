@x [0] l.12 Use standard C99 type.
@s bool normal @q unreserve a C++ keyword @>
@y
\def\MMIXAL{\.{MMIXAL}}

\input pdfwebtocfront

@z

@x [4] l.250 Issue #15.
on that file. It returns 0 if the file was opened successfully; otherwise
@y
on that file. It returns 0 if the file was opened successfully; otherwise it
@z

@x [4] l.293 Issue #15.
\hskip5em\hbox{(|file[handle]|?
     |(file[handle]=freopen(name,mode_string[mode],file[handle]))|:}\hfill\cr
\hfill\hbox{|(file[handle]=fopen(name,mode_string[mode]))|)? 0: $-1$},%
@y
\hskip5em\hbox{(|file[handle]| ?
     |(file[handle]=freopen(name,mode_string[mode],file[handle]))| :}\hfill\cr
\hfill\hbox{|(file[handle]=fopen(name,mode_string[mode]))|) ? 0 : $-1$}%
@z

@x [4] l.367 Issue #15
$$\hbox{|fputs(string,file[handle])>=0? strlen(string): -1|,}$$
@y
$$\hbox{|fputs(string,file[handle])>=0? strlen(string): -1|}$$
@z

@x [4] l.393 Issue #15.
              offset<0? SEEK_END: SEEK_SET)|? $-1$: 0.}$$
@y
              offset<0? SEEK_END: SEEK_SET)? -1: 0|.}$$
@z

@x [6] l.443 Change from MMIX home.
pointer to a string; the last such pointer is M$_8[\$0\ll3+\$1]$, and
M$_8[\$0\ll3+\$1+8]$ is zero. (Register~\$1 will point to an octabyte in
@y
pointer to a string; the last such pointer is M$_8[\$0\ll3+\$1-8]$, and
M$_8[\$0\ll3+\$1]$ is zero. (Register~\$1 will point to an octabyte in
@z

@x [6] l.460 Issue #15.
$$\.{PUT rW, \$255;{ } PUT rB, \$255;{ } SETML \$255,\#F700;{ } % PUTI rB,0!
@y
$$\.{PUT rW,\$255;{ } PUT rB,\$255;{ } SETML \$255,\#F700;{ } % PUTI rB,0!
@z

@x [9] l.546 Use standard C99 type.
@* Basics. To get started, we define a type that provides semantic sugar.

@<Type...@>=
typedef enum {@!false,@!true}@+@!bool;
@y
@* Basics. Standard type |@!bool| comes from \.{<stdbool.h>} via
\.{"mmix-arith.h"}.
@z

@x [10] l.555 Use standard C99 type.
represents unsigned 32-bit integers. The definition of \&{tetra}
given here should be changed, if necessary, to agree with the
definition in that module.
@y
represents unsigned 32-bit integers.
@s uint32_t int
@s byte int
@s tetra int
@s octa int

@c
#include "mmix-arith.h"
  /* |@!byte|, |@!tetra|, |@!octa|, |@!sign_bit|, |@!print_octa| */
@z

@x [10] l.560 Stuff from MMIX-ARITH.
@<Type...@>=
typedef unsigned int tetra;
  /* for systems conforming to the LP-64 data model */
typedef struct {tetra h,l;} octa; /* two tetrabytes make one octabyte */
typedef unsigned char byte; /* a monobyte */
@y
@z

@x [11] l.566 Improved module structure with interface.
@ We declare subroutines twice, once with a prototype and once
with the old-style~\CEE/ conventions. The following hack makes
this work with new compilers as well as the old standbys.

@<Preprocessor macros@>=
#ifdef __STDC__
#define ARGS(list) list
#else
#define ARGS(list) ()
#endif
@y
@ We declare subroutines with their prototypes.
@s mem_node int
@s mem_tetra int
@s mmix_opcode int

@<Proto...@>=
void print_int(octa);
mem_node* new_mem(void);
mem_tetra* mem_find(octa);
void read_tet(void);
void make_map(void);
void print_line(int);
void show_line(void);
void print_freqs(mem_node*);
void stack_store(void);
void stack_load(void);
int register_truth(octa,mmix_opcode);
void trace_print(octa);
void show_stats(bool);
void scan_option(char*,bool);
void catchint(int);
octa scan_hex(char*,octa);
void print_string(octa);
void show_breaks(mem_node*);
void dump(mem_node*);
void dump_tet(tetra);
@z

@x [12] l.577 Move 'print_hex' to MMIX-ARITH.
@ @<Sub...@>=
void print_hex @,@,@[ARGS((octa))@];@+@t}\6{@>
void print_hex(o)
  octa o;
{
  if (o.h) printf("%x%08x",o.h,o.l);
  else printf("%x",o.l);
}
@y
@ @d print_hex print_octa /* preserve the old function name */
@z

@x [13] l.592 Stuff from MMIX-ARITH.
@<Sub...@>=
extern octa zero_octa; /* |zero_octa.h=zero_octa.l=0| */
extern octa neg_one; /* |neg_one.h=neg_one.l=-1| */
extern octa aux,val; /* auxiliary data */
extern bool overflow; /* flag set by signed multiplication and division */
extern int exceptions; /* bits set by floating point operations */
extern int cur_round; /* the current rounding mode */
extern char *next_char; /* where a scanned constant ended */
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
extern octa signed_omult @,@,@[ARGS((octa y,octa z))@];
  /* signed $x=y\times z$ */
extern octa odiv @,@,@[ARGS((octa x,octa y,octa z))@];
  /* unsigned $(x,y)/z$; $|aux|=(x,y)\bmod z$ */
extern octa signed_odiv @,@,@[ARGS((octa y,octa z))@];
  /* signed $x=y/z$ */
extern int count_bits @,@,@[ARGS((tetra z))@];
  /* $x=\nu(z)$ */
extern tetra byte_diff @,@,@[ARGS((tetra y,tetra z))@];
  /* half of \.{BDIF} */
extern tetra wyde_diff @,@,@[ARGS((tetra y,tetra z))@];
  /* half of \.{WDIF} */
extern octa bool_mult @,@,@[ARGS((octa y,octa z,bool xor))@];
  /* \.{MOR} or \.{MXOR} */
extern octa load_sf @,@,@[ARGS((tetra z))@];
  /* load short float */
extern tetra store_sf @,@,@[ARGS((octa x))@];
  /* store short float */
extern octa fplus @,@,@[ARGS((octa y,octa z))@];
  /* floating point $x=y\oplus z$ */
extern octa fmult @,@,@[ARGS((octa y ,octa z))@];
  /* floating point $x=y\otimes z$ */
extern octa fdivide @,@,@[ARGS((octa y,octa z))@];
  /* floating point $x=y\oslash z$ */
extern octa froot @,@,@[ARGS((octa,int))@];
  /* floating point $x=\sqrt z$ */
extern octa fremstep @,@,@[ARGS((octa y,octa z,int delta))@];
  /* floating point $x\,{\rm rem}\,z=y\,{\rm rem}\,z$ */
extern octa fintegerize @,@,@[ARGS((octa z,int mode))@];
  /* floating point $x={\rm round}(z)$ */
extern int fcomp @,@,@[ARGS((octa y,octa z))@];
  /* $-1$, 0, 1, or 2 if $y<z$, $y=z$, $y>z$, $y\parallel z$ */
extern int fepscomp @,@,@[ARGS((octa y,octa z,octa eps,int sim))@];
  /* $x=|sim|?\ [y\sim z\ (\epsilon)]:\ [y\approx z\ (\epsilon)]$ */
extern octa floatit @,@,@[ARGS((octa z,int mode,int unsgnd,int shrt))@];
  /* fix to float */
extern octa fixit @,@,@[ARGS((octa z,int mode))@];
  /* float to fix */
extern void print_float @,@,@[ARGS((octa z))@];
  /* print octabyte as floating decimal */
extern int scan_const @,@,@[ARGS((char* buf))@];
  /* |val| = floating or integer constant; returns the type */

@y
@z

@x [15] l.669
@d sign_bit ((unsigned)0x80000000)

@y
@z

@x [15] l.672 C99 prototypes for C2x.
void print_int @,@,@[ARGS((octa))@];@+@t}\6{@>
void print_int(o)
  octa o;
@y
void print_int(
  octa o)
@z

@x [17] l.743
mem_node* new_mem @,@,@[ARGS((void))@];@+@t}\6{@>
mem_node* new_mem()
@y
mem_node* new_mem(void)
@z

@x [17] l.746 RAII.
  register mem_node *p;
  p=(mem_node*)calloc(1,sizeof(mem_node));
@y
  register mem_node *p=(mem_node*)calloc(1,sizeof(mem_node));
@z

@x [20] l.774 C99 prototypes for C2x.
mem_tetra* mem_find @,@,@[ARGS((octa))@];@+@t}\6{@>
mem_tetra* mem_find(addr)
  octa addr;
@y
mem_tetra* mem_find(
  octa addr)
@z

@x [20] l.778 RAII.
  octa key;
  register int offset;
  register mem_node *p=last_mem;
  key.h=addr.h;
  key.l=addr.l&0xfffff800;
  offset=addr.l&0x7fc;
@y
  octa key={addr.h, addr.l&0xfffff800};
  register int offset=addr.l&0x7fc;
  register mem_node *p=last_mem;
@z

@x [23] l.830
Here we need to define only the basic constants used for interpretation.

@d mm 0x98 /* the escape code of \.{mmo} format */
@d lop_quote 0x0 /* the quotation lopcode */
@d lop_loc 0x1 /* the location lopcode */
@d lop_skip 0x2 /* the skip lopcode */
@d lop_fixo 0x3 /* the octabyte-fix lopcode */
@d lop_fixr 0x4 /* the relative-fix lopcode */
@d lop_fixrx 0x5 /* extended relative-fix lopcode */
@d lop_file 0x6 /* the file name lopcode */
@d lop_line 0x7 /* the file position lopcode */
@d lop_spec 0x8 /* the special hook lopcode */
@d lop_pre 0x9 /* the preamble lopcode */
@d lop_post 0xa /* the postamble lopcode */
@d lop_stab 0xb /* the symbol table lopcode */
@d lop_end 0xc /* the end-it-all lopcode */
@y
@c
#include "mmix-lop.h" /* loader opcodes from \MMIXAL\ */
@z

@x [25] l.869
@ @<Glob...@>=
@y
@ @d ybyte buf[2] /* the next-to-least significant byte */
@d zbyte buf[3] /* the least significant byte */
@<Glob...@>=
@z

@x [26] l.890 C99 prototypes for C2x.
void read_tet @,@,@[ARGS((void))@];@+@t}\6{@>
void read_tet()
@y
void read_tet(void)
@z

@x [26] l.894
  yzbytes=(buf[2]<<8)+buf[3];
@y
  yzbytes=(ybyte<<8)+zbyte;
@z

@x [27] l.899 C99 prototypes for C2x.
@ @<Sub...@>=
byte read_byte @,@,@[ARGS((void))@];@+@t}\6{@>
byte read_byte()
{
  register byte b;
  if (!byte_count) read_tet();
  b=buf[byte_count];
  byte_count=(byte_count+1)&3;
  return b;
}
@y
@ (This section remains empty for historic reasons.)
@z

@x [29] l.926
   @t\4@>@<Cases for lopcodes in the main loop@>@;
@y
@/ @t\4@>@<Cases for lopcodes in the main loop@>@;
@z

@x [29] l.932
  @<Load |tet| as a normal item@>;
@y
  @<Load \9{t}|tet| as a normal item@>;
@z

@x [30] l.942
@<Load |tet| as a normal item@>=
@y
@<Load \9{t}|tet| as a normal item@>=
@z

@x [32] l.961 RAII.
cur_loc.h=cur_loc.l=0;
@y
cur_loc=zero_octa;
@z

@x [32] l.965 CWEB 3.0 learned this.
do @<Load the next item@>@;@+while (!postamble);
@y
do @<Load the next item@>@; while (!postamble);
@z

@x [33] l.974
@d ybyte buf[2] /* the next-to-least significant byte */
@d zbyte buf[3] /* the least significant byte */

@y
@z

@x [34] l.999 Change from MMIX home.
case lop_fixr: delta=yzbytes; goto fixr;
@y
case lop_fixr: mmo_load(incr(cur_loc,-yzbytes<<2),yzbytes); continue;
@z

@x [34] l.1001 RAII.
 read_tet(); delta=tet;
 if (delta&0xfe000000) mmo_err;
fixr: tmp=incr(cur_loc,-(delta>=0x1000000? (delta&0xffffff)-(1<<j): delta)<<2);
 mmo_load(tmp,delta);
@y
 read_tet();@+if (tet&0xfe000000) mmo_err;
 delta=(tet>=0x1000000? (tet&0xffffff)-(1<<j): tet);
 mmo_load(incr(cur_loc,-delta<<2),tet);
@z

@x [35] l.1023
     *p=buf[0];@+*(p+1)=buf[1];@+*(p+2)=buf[2];@+*(p+3)=buf[3];
@y
     @+ memcpy(p,buf,4);
@z

@x [36] l.1033
case lop_spec:@+ while(1) {
@y
case lop_spec:@+ while (true) {
@z

@x [37] l.1048 Compound literal.
aux.h=0x60000000;@+ aux.l=0x18;
@y
aux=(octa){0x60000000, 0x18};
@z

@x [37] l.1054 RAII.
G=zbyte;@+ L=0;
@y
G=zbyte;@+ L=0;@+ O=0;
@z

@x [37] l.1056 Compound literal.
inst_ptr.h=(ll-2)->tet, inst_ptr.l=(ll-1)->tet; /* \.{Main} */
@y
inst_ptr=(octa){(ll-2)->tet, (ll-1)->tet}; /* \.{Main} */
@z

@x [42] l.1102 C99 prototypes for C2x.
void make_map @,@,@[ARGS((void))@];@+@t}\6{@>
void make_map()
@y
void make_map(void)
@z

@x [43] l.1124
in hopes that other operating systems provide a similar way to do the job.
@y
in hopes that other operating systems provide a similar way to do the job.
We apply a \.{CWEB} coding trick to make the \&{stat} type name distinct
from the function of the same name.
@^system dependencies@>

@d mstat s@&t@&a@&t /* this is a \.{CWEB} coding trick: */
@f mstat int /* `\&{mstat}' will be equivalent to `\&{struct stat}' */
@f stat x /* but function `|stat|' will not be treated as a reserved word */
@z
@x [43] l.1127
@<Preprocessor macros@>=
@y
@c
@z

@x [44] l.1134
  struct stat stat_buf;
@y
  @+ struct mstat stat_buf;
@z

@x [45] l.1149 C99 prototypes for C2x.
void print_line @,@,@[ARGS((int))@];@+@t}\6{@>
void print_line(k)
  int k;
@y
void print_line(
  int k)
@z
@x [45] l.1153
  char buf[11];
@y
  @+ char buf[11];
@z
@x [45] l.1157
  sprintf(buf,"%d:    ",k);
@y
  sprintf(buf,"%d:    ",k&65535); @+
@z

@x [47] l.1176 C99 prototypes for C2x.
void show_line @,@,@[ARGS((void))@];@+@t}\6{@>
void show_line()
@y
void show_line(void)
@z

@x [47] l.1179
  register int k;
@y
@z

@x [47] l.1183 Change from MMIX home.
    if (shown_line>0)
      if (cur_line<shown_line) printf("--------\n"); /* indicate upward move */
      else printf("     ...\n"); /* indicate the gap */
@y
    if (shown_line>0) {
      if (cur_line<shown_line) printf("--------\n"); /* indicate upward move */
      else printf("     ...\n"); /* indicate the gap */ }
@z

@x [47] l.1187
  }@+else@+ for (k=shown_line+1;k<=cur_line;k++) print_line(k);
@y
  }@+else@+ for (int k=shown_line+1;k<=cur_line;k++) print_line(k);
@z

@x [49] l.1204 Don't ignore return code from freopen().
  else freopen(file_info[cur_file].name,"r",src_file);
@y
  else src_file=freopen(file_info[cur_file].name,"r",src_file);
@z

@x [50] l.1225 C99 prototypes for C2x.
void print_freqs @,@,@[ARGS((mem_node*))@];@+@t}\6{@>
void print_freqs(p)
  mem_node *p;
@y
void print_freqs(
  mem_node *p)
@z

@x [50] l.1229 Block-local variable.
  register int j;
  octa cur_loc;
@y
@z

@x [50] l.1232
  for (j=0;j<512;j++) if (p->dat[j].freq)
@y
  for (int j=0;j<512;j++) if (p->dat[j].freq)
@z

@x [51] l.1242 RAII. Block-local variable.
  cur_loc=incr(p->loc,4*j);
@y
  octa cur_loc=incr(p->loc,4*j);
@z

@x [55] l.1313
@!rB,@!rD,@!rE,@!rH,@!rJ,@!rM,@!rR,@!rBB,
 @!rC,@!rN,@!rO,@!rS,@!rI,@!rT,@!rTT,@!rK,@!rQ,@!rU,@!rV,@!rG,@!rL,
 @!rA,@!rF,@!rP,@!rW,@!rX,@!rY,@!rZ,@!rWW,@!rXX,@!rYY,@!rZZ} @!special_reg;
@y
@!rB,@!rD,@!rE,@!rH,@!rJ,@!rM,@!rR,@!rBB,@/
@!rC,@!rN,@!rO,@!rS,@!rI,@!rT,@!rTT,@!rK,@/
@!rQ,@!rU,@!rV,@!rG,@!rL,@!rA,@!rF,@!rP,@/
@!rW,@!rX,@!rY,@!rZ,@!rWW,@!rXX,@!rYY,@!rZZ} @!special_reg;
@z

@x [56] l.1318
char *special_name[32]={"rB","rD","rE","rH","rJ","rM","rR","rBB",
 "rC","rN","rO","rS","rI","rT","rTT","rK","rQ","rU","rV","rG","rL",
 "rA","rF","rP","rW","rX","rY","rZ","rWW","rXX","rYY","rZZ"};
@y
char *special_name[32]={"rB","rD","rE","rH","rJ","rM","rR","rBB",@|
 "rC","rN","rO","rS","rI","rT","rTT","rK",@|
 "rQ","rU","rV","rG","rL","rA","rF","rP",@|
 "rW","rX","rY","rZ","rWW","rXX","rYY","rZZ"};
@z

@x [57] l.1322
@ Here are the bit codes for arithmetic exceptions. These codes, except
|H_BIT|, are defined also in {\mc MMIX-ARITH}.
@y
@ Here are the bit codes for arithmetic exceptions. A~full list of these
codes is defined in {\mc MMIX-PIPE}.
@z
@x [57] l.1326
@d Z_BIT (1<<9) /* floating division by zero */
@y
@z
@x [57] l.1328
@d O_BIT (1<<11) /* floating overflow */
@y
@z

@x [62] l.1409 RAII.
register int i,j,k; /* miscellaneous indices */
@y
register int i,j=0,k; /* miscellaneous indices */
@z

@x [65] l.1461 Improved typography.
op_info info[256]={
@<Info for arithmetic commands@>,
@<Info for branch commands@>,
@<Info for load/store commands@>,
@<Info for logical and control commands@>};
@y
op_info info[256]={@t\1@>@/
@<Info for arithmetic commands@>,@/
@<Info for branch commands@>,@/
@<Info for load/store commands@>,@/
@<Info for logical and control commands@>@t\2@>@/};
@z

@x [66] l.1468
{"TRAP",0x0a,255,0,5,"%r"},@|
{"FCMP",0x2a,0,0,1,"%l = %.y cmp %.z = %x"},@|
{"FUN",0x2a,0,0,1,"%l = [%.y(||)%.z] = %x"},@|
{"FEQL",0x2a,0,0,1,"%l = [%.y(==)%.z] = %x"},@|
{"FADD",0x2a,0,0,4,"%l = %.y %(+%) %.z = %.x"},@|
{"FIX",0x26,0,0,4,"%l = %(fix%) %.z = %x"},@|
{"FSUB",0x2a,0,0,4,"%l = %.y %(-%) %.z = %.x"},@|
{"FIXU",0x26,0,0,4,"%l = %(fix%) %.z = %#x"},@|
{"FLOT",0x26,0,0,4,"%l = %(flot%) %z = %.x"},@|
{"FLOTI",0x25,0,0,4,"%l = %(flot%) %z = %.x"},@|
{"FLOTU",0x26,0,0,4,"%l = %(flot%) %#z = %.x"},@|
{"FLOTUI",0x25,0,0,4,"%l = %(flot%) %z = %.x"},@|
{"SFLOT",0x26,0,0,4,"%l = %(sflot%) %z = %.x"},@|
{"SFLOTI",0x25,0,0,4,"%l = %(sflot%) %z = %.x"},@|
{"SFLOTU",0x26,0,0,4,"%l = %(sflot%) %#z = %.x"},@|
{"SFLOTUI",0x25,0,0,4,"%l = %(sflot%) %z = %.x"},@|
{"FMUL",0x2a,0,0,4,"%l = %.y %(*%) %.z = %.x"},@|
{"FCMPE",0x2a,rE,0,4,"%l = %.y cmp %.z (%.b)) = %x"},@|
{"FUNE",0x2a,rE,0,1,"%l = [%.y(||)%.z (%.b)] = %x"},@|
{"FEQLE",0x2a,rE,0,4,"%l = [%.y(==)%.z (%.b)] = %x"},@|
{"FDIV",0x2a,0,0,40,"%l = %.y %(/%) %.z = %.x"},@|
{"FSQRT",0x26,0,0,40,"%l = %(sqrt%) %.z = %.x"},@|
{"FREM",0x2a,0,0,4,"%l = %.y %(rem%) %.z = %.x"},@|
{"FINT",0x26,0,0,4,"%l = %(int%) %.z = %.x"},@|
{"MUL",0x2a,0,0,10,"%l = %y * %z = %x"},@|
{"MULI",0x29,0,0,10,"%l = %y * %z = %x"},@|
{"MULU",0x2a,0,0,10,"%l = %#y * %#z = %#x, rH=%#a"},@|
{"MULUI",0x29,0,0,10,"%l = %#y * %z = %#x, rH=%#a"},@|
{"DIV",0x2a,0,0,60,"%l = %y / %z = %x, rR=%a"},@|
{"DIVI",0x29,0,0,60,"%l = %y / %z = %x, rR=%a"},@|
{"DIVU",0x2a,rD,0,60,"%l = %#b%0y / %#z = %#x, rR=%#a"},@|
{"DIVUI",0x29,rD,0,60,"%l = %#b%0y / %z = %#x, rR=%#a"},@|
{"ADD",0x2a,0,0,1,"%l = %y + %z = %x"},@|
{"ADDI",0x29,0,0,1,"%l = %y + %z = %x"},@|
{"ADDU",0x2a,0,0,1,"%l = %#y + %#z = %#x"},@|
{"ADDUI",0x29,0,0,1,"%l = %#y + %z = %#x"},@|
{"SUB",0x2a,0,0,1,"%l = %y - %z = %x"},@|
{"SUBI",0x29,0,0,1,"%l = %y - %z = %x"},@|
{"SUBU",0x2a,0,0,1,"%l = %#y - %#z = %#x"},@|
{"SUBUI",0x29,0,0,1,"%l = %#y - %z = %#x"},@|
{"2ADDU",0x2a,0,0,1,"%l = %#y <<1+ %#z = %#x"},@|
{"2ADDUI",0x29,0,0,1,"%l = %#y <<1+ %z = %#x"},@|
{"4ADDU",0x2a,0,0,1,"%l = %#y <<2+ %#z = %#x"},@|
{"4ADDUI",0x29,0,0,1,"%l = %#y <<2+ %z = %#x"},@|
{"8ADDU",0x2a,0,0,1,"%l = %#y <<3+ %#z = %#x"},@|
{"8ADDUI",0x29,0,0,1,"%l = %#y <<3+ %z = %#x"},@|
{"16ADDU",0x2a,0,0,1,"%l = %#y <<4+ %#z = %#x"},@|
{"16ADDUI",0x29,0,0,1,"%l = %#y <<4+ %z = %#x"},@|
{"CMP",0x2a,0,0,1,"%l = %y cmp %z = %x"},@|
{"CMPI",0x29,0,0,1,"%l = %y cmp %z = %x"},@|
{"CMPU",0x2a,0,0,1,"%l = %#y cmp %#z = %x"},@|
{"CMPUI",0x29,0,0,1,"%l = %#y cmp %z = %x"},@|
{"NEG",0x26,0,0,1,"%l = %y - %z = %x"},@|
{"NEGI",0x25,0,0,1,"%l = %y - %z = %x"},@|
{"NEGU",0x26,0,0,1,"%l = %y - %#z = %#x"},@|
{"NEGUI",0x25,0,0,1,"%l = %y - %z = %#x"},@|
{"SL",0x2a,0,0,1,"%l = %y << %#z = %x"},@|
{"SLI",0x29,0,0,1,"%l = %y << %z = %x"},@|
{"SLU",0x2a,0,0,1,"%l = %#y << %#z = %#x"},@|
{"SLUI",0x29,0,0,1,"%l = %#y << %z = %#x"},@|
{"SR",0x2a,0,0,1,"%l = %y >> %#z = %x"},@|
{"SRI",0x29,0,0,1,"%l = %y >> %z = %x"},@|
{"SRU",0x2a,0,0,1,"%l = %#y >> %#z = %#x"},@|
@y
{"TRAP",0x0a,255,0,5,"%r"},@/
{"FCMP",0x2a,0,0,1,"%l = %.y cmp %.z = %x"},@/
{"FUN",0x2a,0,0,1,"%l = [%.y(||)%.z] = %x"},@/
{"FEQL",0x2a,0,0,1,"%l = [%.y(==)%.z] = %x"},@/
{"FADD",0x2a,0,0,4,"%l = %.y %(+%) %.z = %.x"},@/
{"FIX",0x26,0,0,4,"%l = %(fix%) %.z = %x"},@/
{"FSUB",0x2a,0,0,4,"%l = %.y %(-%) %.z = %.x"},@/
{"FIXU",0x26,0,0,4,"%l = %(fix%) %.z = %#x"},@/
{"FLOT",0x26,0,0,4,"%l = %(flot%) %z = %.x"},@/
{"FLOTI",0x25,0,0,4,"%l = %(flot%) %z = %.x"},@/
{"FLOTU",0x26,0,0,4,"%l = %(flot%) %#z = %.x"},@/
{"FLOTUI",0x25,0,0,4,"%l = %(flot%) %z = %.x"},@/
{"SFLOT",0x26,0,0,4,"%l = %(sflot%) %z = %.x"},@/
{"SFLOTI",0x25,0,0,4,"%l = %(sflot%) %z = %.x"},@/
{"SFLOTU",0x26,0,0,4,"%l = %(sflot%) %#z = %.x"},@/
{"SFLOTUI",0x25,0,0,4,"%l = %(sflot%) %z = %.x"},@/
{"FMUL",0x2a,0,0,4,"%l = %.y %(*%) %.z = %.x"},@/
{"FCMPE",0x2a,rE,0,4,"%l = %.y cmp %.z (%.b)) = %x"},@/
{"FUNE",0x2a,rE,0,1,"%l = [%.y(||)%.z (%.b)] = %x"},@/
{"FEQLE",0x2a,rE,0,4,"%l = [%.y(==)%.z (%.b)] = %x"},@/
{"FDIV",0x2a,0,0,40,"%l = %.y %(/%) %.z = %.x"},@/
{"FSQRT",0x26,0,0,40,"%l = %(sqrt%) %.z = %.x"},@/
{"FREM",0x2a,0,0,4,"%l = %.y %(rem%) %.z = %.x"},@/
{"FINT",0x26,0,0,4,"%l = %(int%) %.z = %.x"},@/
{"MUL",0x2a,0,0,10,"%l = %y * %z = %x"},@/
{"MULI",0x29,0,0,10,"%l = %y * %z = %x"},@/
{"MULU",0x2a,0,0,10,"%l = %#y * %#z = %#x, rH=%#a"},@/
{"MULUI",0x29,0,0,10,"%l = %#y * %z = %#x, rH=%#a"},@/
{"DIV",0x2a,0,0,60,"%l = %y / %z = %x, rR=%a"},@/
{"DIVI",0x29,0,0,60,"%l = %y / %z = %x, rR=%a"},@/
{"DIVU",0x2a,rD,0,60,"%l = %#b%0y / %#z = %#x, rR=%#a"},@/
{"DIVUI",0x29,rD,0,60,"%l = %#b%0y / %z = %#x, rR=%#a"},@/
{"ADD",0x2a,0,0,1,"%l = %y + %z = %x"},@/
{"ADDI",0x29,0,0,1,"%l = %y + %z = %x"},@/
{"ADDU",0x2a,0,0,1,"%l = %#y + %#z = %#x"},@/
{"ADDUI",0x29,0,0,1,"%l = %#y + %z = %#x"},@/
{"SUB",0x2a,0,0,1,"%l = %y - %z = %x"},@/
{"SUBI",0x29,0,0,1,"%l = %y - %z = %x"},@/
{"SUBU",0x2a,0,0,1,"%l = %#y - %#z = %#x"},@/
{"SUBUI",0x29,0,0,1,"%l = %#y - %z = %#x"},@/
{"2ADDU",0x2a,0,0,1,"%l = %#y <<1+ %#z = %#x"},@/
{"2ADDUI",0x29,0,0,1,"%l = %#y <<1+ %z = %#x"},@/
{"4ADDU",0x2a,0,0,1,"%l = %#y <<2+ %#z = %#x"},@/
{"4ADDUI",0x29,0,0,1,"%l = %#y <<2+ %z = %#x"},@/
{"8ADDU",0x2a,0,0,1,"%l = %#y <<3+ %#z = %#x"},@/
{"8ADDUI",0x29,0,0,1,"%l = %#y <<3+ %z = %#x"},@/
{"16ADDU",0x2a,0,0,1,"%l = %#y <<4+ %#z = %#x"},@/
{"16ADDUI",0x29,0,0,1,"%l = %#y <<4+ %z = %#x"},@/
{"CMP",0x2a,0,0,1,"%l = %y cmp %z = %x"},@/
{"CMPI",0x29,0,0,1,"%l = %y cmp %z = %x"},@/
{"CMPU",0x2a,0,0,1,"%l = %#y cmp %#z = %x"},@/
{"CMPUI",0x29,0,0,1,"%l = %#y cmp %z = %x"},@/
{"NEG",0x26,0,0,1,"%l = %y - %z = %x"},@/
{"NEGI",0x25,0,0,1,"%l = %y - %z = %x"},@/
{"NEGU",0x26,0,0,1,"%l = %y - %#z = %#x"},@/
{"NEGUI",0x25,0,0,1,"%l = %y - %z = %#x"},@/
{"SL",0x2a,0,0,1,"%l = %y << %#z = %x"},@/
{"SLI",0x29,0,0,1,"%l = %y << %z = %x"},@/
{"SLU",0x2a,0,0,1,"%l = %#y << %#z = %#x"},@/
{"SLUI",0x29,0,0,1,"%l = %#y << %z = %#x"},@/
{"SR",0x2a,0,0,1,"%l = %y >> %#z = %x"},@/
{"SRI",0x29,0,0,1,"%l = %y >> %z = %x"},@/
{"SRU",0x2a,0,0,1,"%l = %#y >> %#z = %#x"},@/
@z

@x [67] l.1534
{"BN",0x50,0,0,1,"%b<0? %t%g"},@|
{"BNB",0x50,0,0,1,"%b<0? %t%g"},@|
{"BZ",0x50,0,0,1,"%b==0? %t%g"},@|
{"BZB",0x50,0,0,1,"%b==0? %t%g"},@|
{"BP",0x50,0,0,1,"%b>0? %t%g"},@|
{"BPB",0x50,0,0,1,"%b>0? %t%g"},@|
{"BOD",0x50,0,0,1,"%b odd? %t%g"},@|
{"BODB",0x50,0,0,1,"%b odd? %t%g"},@|
{"BNN",0x50,0,0,1,"%b>=0? %t%g"},@|
{"BNNB",0x50,0,0,1,"%b>=0? %t%g"},@|
{"BNZ",0x50,0,0,1,"%b!=0? %t%g"},@|
{"BNZB",0x50,0,0,1,"%b!=0? %t%g"},@|
{"BNP",0x50,0,0,1,"%b<=0? %t%g"},@|
{"BNPB",0x50,0,0,1,"%b<=0? %t%g"},@|
{"BEV",0x50,0,0,1,"%b even? %t%g"},@|
{"BEVB",0x50,0,0,1,"%b even? %t%g"},@|
{"PBN",0x50,0,0,1,"%b<0? %t%g"},@|
{"PBNB",0x50,0,0,1,"%b<0? %t%g"},@|
{"PBZ",0x50,0,0,1,"%b==0? %t%g"},@|
{"PBZB",0x50,0,0,1,"%b==0? %t%g"},@|
{"PBP",0x50,0,0,1,"%b>0? %t%g"},@|
{"PBPB",0x50,0,0,1,"%b>0? %t%g"},@|
{"PBOD",0x50,0,0,1,"%b odd? %t%g"},@|
{"PBODB",0x50,0,0,1,"%b odd? %t%g"},@|
{"PBNN",0x50,0,0,1,"%b>=0? %t%g"},@|
{"PBNNB",0x50,0,0,1,"%b>=0? %t%g"},@|
{"PBNZ",0x50,0,0,1,"%b!=0? %t%g"},@|
{"PBNZB",0x50,0,0,1,"%b!=0? %t%g"},@|
{"PBNP",0x50,0,0,1,"%b<=0? %t%g"},@|
{"PBNPB",0x50,0,0,1,"%b<=0? %t%g"},@|
{"PBEV",0x50,0,0,1,"%b even? %t%g"},@|
{"PBEVB",0x50,0,0,1,"%b even? %t%g"},@|
{"CSN",0x3a,0,0,1,"%l = %y<0? %z: %b = %x"},@|
{"CSNI",0x39,0,0,1,"%l = %y<0? %z: %b = %x"},@|
{"CSZ",0x3a,0,0,1,"%l = %y==0? %z: %b = %x"},@|
{"CSZI",0x39,0,0,1,"%l = %y==0? %z: %b = %x"},@|
{"CSP",0x3a,0,0,1,"%l = %y>0? %z: %b = %x"},@|
{"CSPI",0x39,0,0,1,"%l = %y>0? %z: %b = %x"},@|
{"CSOD",0x3a,0,0,1,"%l = %y odd? %z: %b = %x"},@|
{"CSODI",0x39,0,0,1,"%l = %y odd? %z: %b = %x"},@|
{"CSNN",0x3a,0,0,1,"%l = %y>=0? %z: %b = %x"},@|
{"CSNNI",0x39,0,0,1,"%l = %y>=0? %z: %b = %x"},@|
{"CSNZ",0x3a,0,0,1,"%l = %y!=0? %z: %b = %x"},@|
{"CSNZI",0x39,0,0,1,"%l = %y!=0? %z: %b = %x"},@|
{"CSNP",0x3a,0,0,1,"%l = %y<=0? %z: %b = %x"},@|
{"CSNPI",0x39,0,0,1,"%l = %y<=0? %z: %b = %x"},@|
{"CSEV",0x3a,0,0,1,"%l = %y even? %z: %b = %x"},@|
{"CSEVI",0x39,0,0,1,"%l = %y even? %z: %b = %x"},@|
{"ZSN",0x2a,0,0,1,"%l = %y<0? %z: 0 = %x"},@|
{"ZSNI",0x29,0,0,1,"%l = %y<0? %z: 0 = %x"},@|
{"ZSZ",0x2a,0,0,1,"%l = %y==0? %z: 0 = %x"},@|
{"ZSZI",0x29,0,0,1,"%l = %y==0? %z: 0 = %x"},@|
{"ZSP",0x2a,0,0,1,"%l = %y>0? %z: 0 = %x"},@|
{"ZSPI",0x29,0,0,1,"%l = %y>0? %z: 0 = %x"},@|
{"ZSOD",0x2a,0,0,1,"%l = %y odd? %z: 0 = %x"},@|
{"ZSODI",0x29,0,0,1,"%l = %y odd? %z: 0 = %x"},@|
{"ZSNN",0x2a,0,0,1,"%l = %y>=0? %z: 0 = %x"},@|
{"ZSNNI",0x29,0,0,1,"%l = %y>=0? %z: 0 = %x"},@|
{"ZSNZ",0x2a,0,0,1,"%l = %y!=0? %z: 0 = %x"},@|
{"ZSNZI",0x29,0,0,1,"%l = %y!=0? %z: 0 = %x"},@|
{"ZSNP",0x2a,0,0,1,"%l = %y<=0? %z: 0 = %x"},@|
{"ZSNPI",0x29,0,0,1,"%l = %y<=0? %z: 0 = %x"},@|
{"ZSEV",0x2a,0,0,1,"%l = %y even? %z: 0 = %x"},@|
@y
{"BN",0x50,0,0,1,"%b<0? %t%g"},@/
{"BNB",0x50,0,0,1,"%b<0? %t%g"},@/
{"BZ",0x50,0,0,1,"%b==0? %t%g"},@/
{"BZB",0x50,0,0,1,"%b==0? %t%g"},@/
{"BP",0x50,0,0,1,"%b>0? %t%g"},@/
{"BPB",0x50,0,0,1,"%b>0? %t%g"},@/
{"BOD",0x50,0,0,1,"%b odd? %t%g"},@/
{"BODB",0x50,0,0,1,"%b odd? %t%g"},@/
{"BNN",0x50,0,0,1,"%b>=0? %t%g"},@/
{"BNNB",0x50,0,0,1,"%b>=0? %t%g"},@/
{"BNZ",0x50,0,0,1,"%b!=0? %t%g"},@/
{"BNZB",0x50,0,0,1,"%b!=0? %t%g"},@/
{"BNP",0x50,0,0,1,"%b<=0? %t%g"},@/
{"BNPB",0x50,0,0,1,"%b<=0? %t%g"},@/
{"BEV",0x50,0,0,1,"%b even? %t%g"},@/
{"BEVB",0x50,0,0,1,"%b even? %t%g"},@/
{"PBN",0x50,0,0,1,"%b<0? %t%g"},@/
{"PBNB",0x50,0,0,1,"%b<0? %t%g"},@/
{"PBZ",0x50,0,0,1,"%b==0? %t%g"},@/
{"PBZB",0x50,0,0,1,"%b==0? %t%g"},@/
{"PBP",0x50,0,0,1,"%b>0? %t%g"},@/
{"PBPB",0x50,0,0,1,"%b>0? %t%g"},@/
{"PBOD",0x50,0,0,1,"%b odd? %t%g"},@/
{"PBODB",0x50,0,0,1,"%b odd? %t%g"},@/
{"PBNN",0x50,0,0,1,"%b>=0? %t%g"},@/
{"PBNNB",0x50,0,0,1,"%b>=0? %t%g"},@/
{"PBNZ",0x50,0,0,1,"%b!=0? %t%g"},@/
{"PBNZB",0x50,0,0,1,"%b!=0? %t%g"},@/
{"PBNP",0x50,0,0,1,"%b<=0? %t%g"},@/
{"PBNPB",0x50,0,0,1,"%b<=0? %t%g"},@/
{"PBEV",0x50,0,0,1,"%b even? %t%g"},@/
{"PBEVB",0x50,0,0,1,"%b even? %t%g"},@/
{"CSN",0x3a,0,0,1,"%l = %y<0? %z: %b = %x"},@/
{"CSNI",0x39,0,0,1,"%l = %y<0? %z: %b = %x"},@/
{"CSZ",0x3a,0,0,1,"%l = %y==0? %z: %b = %x"},@/
{"CSZI",0x39,0,0,1,"%l = %y==0? %z: %b = %x"},@/
{"CSP",0x3a,0,0,1,"%l = %y>0? %z: %b = %x"},@/
{"CSPI",0x39,0,0,1,"%l = %y>0? %z: %b = %x"},@/
{"CSOD",0x3a,0,0,1,"%l = %y odd? %z: %b = %x"},@/
{"CSODI",0x39,0,0,1,"%l = %y odd? %z: %b = %x"},@/
{"CSNN",0x3a,0,0,1,"%l = %y>=0? %z: %b = %x"},@/
{"CSNNI",0x39,0,0,1,"%l = %y>=0? %z: %b = %x"},@/
{"CSNZ",0x3a,0,0,1,"%l = %y!=0? %z: %b = %x"},@/
{"CSNZI",0x39,0,0,1,"%l = %y!=0? %z: %b = %x"},@/
{"CSNP",0x3a,0,0,1,"%l = %y<=0? %z: %b = %x"},@/
{"CSNPI",0x39,0,0,1,"%l = %y<=0? %z: %b = %x"},@/
{"CSEV",0x3a,0,0,1,"%l = %y even? %z: %b = %x"},@/
{"CSEVI",0x39,0,0,1,"%l = %y even? %z: %b = %x"},@/
{"ZSN",0x2a,0,0,1,"%l = %y<0? %z: 0 = %x"},@/
{"ZSNI",0x29,0,0,1,"%l = %y<0? %z: 0 = %x"},@/
{"ZSZ",0x2a,0,0,1,"%l = %y==0? %z: 0 = %x"},@/
{"ZSZI",0x29,0,0,1,"%l = %y==0? %z: 0 = %x"},@/
{"ZSP",0x2a,0,0,1,"%l = %y>0? %z: 0 = %x"},@/
{"ZSPI",0x29,0,0,1,"%l = %y>0? %z: 0 = %x"},@/
{"ZSOD",0x2a,0,0,1,"%l = %y odd? %z: 0 = %x"},@/
{"ZSODI",0x29,0,0,1,"%l = %y odd? %z: 0 = %x"},@/
{"ZSNN",0x2a,0,0,1,"%l = %y>=0? %z: 0 = %x"},@/
{"ZSNNI",0x29,0,0,1,"%l = %y>=0? %z: 0 = %x"},@/
{"ZSNZ",0x2a,0,0,1,"%l = %y!=0? %z: 0 = %x"},@/
{"ZSNZI",0x29,0,0,1,"%l = %y!=0? %z: 0 = %x"},@/
{"ZSNP",0x2a,0,0,1,"%l = %y<=0? %z: 0 = %x"},@/
{"ZSNPI",0x29,0,0,1,"%l = %y<=0? %z: 0 = %x"},@/
{"ZSEV",0x2a,0,0,1,"%l = %y even? %z: 0 = %x"},@/
@z

@x [68] l.1600
{"LDB",0x2a,0,1,1,"%l = M1[%#y+%#z] = %x"},@|
{"LDBI",0x29,0,1,1,"%l = M1[%#y%?+] = %x"},@|
{"LDBU",0x2a,0,1,1,"%l = M1[%#y+%#z] = %#x"},@|
{"LDBUI",0x29,0,1,1,"%l = M1[%#y%?+] = %#x"},@|
{"LDW",0x2a,0,1,1,"%l = M2[%#y+%#z] = %x"},@|
{"LDWI",0x29,0,1,1,"%l = M2[%#y%?+] = %x"},@|
{"LDWU",0x2a,0,1,1,"%l = M2[%#y+%#z] = %#x"},@|
{"LDWUI",0x29,0,1,1,"%l = M2[%#y%?+] = %#x"},@|
{"LDT",0x2a,0,1,1,"%l = M4[%#y+%#z] = %x"},@|
{"LDTI",0x29,0,1,1,"%l = M4[%#y%?+] = %x"},@|
{"LDTU",0x2a,0,1,1,"%l = M4[%#y+%#z] = %#x"},@|
{"LDTUI",0x29,0,1,1,"%l = M4[%#y%?+] = %#x"},@|
{"LDO",0x2a,0,1,1,"%l = M8[%#y+%#z] = %x"},@|
{"LDOI",0x29,0,1,1,"%l = M8[%#y%?+] = %x"},@|
{"LDOU",0x2a,0,1,1,"%l = M8[%#y+%#z] = %#x"},@|
{"LDOUI",0x29,0,1,1,"%l = M8[%#y%?+] = %#x"},@|
{"LDSF",0x2a,0,1,1,"%l = (M4[%#y+%#z]) = %.x"},@|
{"LDSFI",0x29,0,1,1,"%l = (M4[%#y%?+]) = %.x"},@|
{"LDHT",0x2a,0,1,1,"%l = M4[%#y+%#z]<<32 = %#x"},@|
{"LDHTI",0x29,0,1,1,"%l = M4[%#y%?+]<<32 = %#x"},@|
{"CSWAP",0x3a,0,2,2,"%l = [M8[%#y+%#z]==%a] = %x, %r"},@|
{"CSWAPI",0x39,0,2,2,"%l = [M8[%#y%?+]==%a] = %x, %r"},@|
{"LDUNC",0x2a,0,1,1,"%l = M8[%#y+%#z] = %#x"},@|
{"LDUNCI",0x29,0,1,1,"%l = M8[%#y%?+] = %#x"},@|
{"LDVTS",0x2a,0,0,1,""},@|
{"LDVTSI",0x29,0,0,1,""},@|
{"PRELD",0x0a,0,0,1,"[%#y+%#z .. %#x]"},@|
{"PRELDI",0x09,0,0,1,"[%#y%?+ .. %#x]"},@|
{"PREGO",0x0a,0,0,1,"[%#y+%#z .. %#x]"},@|
{"PREGOI",0x09,0,0,1,"[%#y%?+ .. %#x]"},@|
{"GO",0x2a,0,0,3,"%l = %#x, -> %#y+%#z"},@|
{"GOI",0x29,0,0,3,"%l = %#x, -> %#y%?+"},@|
{"STB",0x1a,0,1,1,"M1[%#y+%#z] = %b, M8[%#w]=%#a"},@|
{"STBI",0x19,0,1,1,"M1[%#y%?+] = %b, M8[%#w]=%#a"},@|
{"STBU",0x1a,0,1,1,"M1[%#y+%#z] = %#b, M8[%#w]=%#a"},@|
{"STBUI",0x19,0,1,1,"M1[%#y%?+] = %#b, M8[%#w]=%#a"},@|
{"STW",0x1a,0,1,1,"M2[%#y+%#z] = %b, M8[%#w]=%#a"},@|
{"STWI",0x19,0,1,1,"M2[%#y%?+] = %b, M8[%#w]=%#a"},@|
{"STWU",0x1a,0,1,1,"M2[%#y+%#z] = %#b, M8[%#w]=%#a"},@|
{"STWUI",0x19,0,1,1,"M2[%#y%?+] = %#b, M8[%#w]=%#a"},@|
{"STT",0x1a,0,1,1,"M4[%#y+%#z] = %b, M8[%#w]=%#a"},@|
{"STTI",0x19,0,1,1,"M4[%#y%?+] = %b, M8[%#w]=%#a"},@|
{"STTU",0x1a,0,1,1,"M4[%#y+%#z] = %#b, M8[%#w]=%#a"},@|
{"STTUI",0x19,0,1,1,"M4[%#y%?+] = %#b, M8[%#w]=%#a"},@|
{"STO",0x1a,0,1,1,"M8[%#y+%#z] = %b"},@|
{"STOI",0x19,0,1,1,"M8[%#y%?+] = %b"},@|
{"STOU",0x1a,0,1,1,"M8[%#y+%#z] = %#b"},@|
{"STOUI",0x19,0,1,1,"M8[%#y%?+] = %#b"},@|
{"STSF",0x1a,0,1,1,"%(M4[%#y+%#z]%) = %.b, M8[%#w]=%#a"},@|
{"STSFI",0x19,0,1,1,"%(M4[%#y%?+]%) = %.b, M8[%#w]=%#a"},@|
{"STHT",0x1a,0,1,1,"M4[%#y+%#z] = %#b>>32, M8[%#w]=%#a"},@|
{"STHTI",0x19,0,1,1,"M4[%#y%?+] = %#b>>32, M8[%#w]=%#a"},@|
{"STCO",0x0a,0,1,1,"M8[%#y+%#z] = %b"},@|
{"STCOI",0x09,0,1,1,"M8[%#y%?+] = %b"},@|
{"STUNC",0x1a,0,1,1,"M8[%#y+%#z] = %#b"},@|
{"STUNCI",0x19,0,1,1,"M8[%#y%?+] = %#b"},@|
{"SYNCD",0x0a,0,0,1,"[%#y+%#z .. %#x]"},@|
{"SYNCDI",0x09,0,0,1,"[%#y%?+ .. %#x]"},@|
{"PREST",0x0a,0,0,1,"[%#y+%#z .. %#x]"},@|
{"PRESTI",0x09,0,0,1,"[%#y%?+ .. %#x]"},@|
{"SYNCID",0x0a,0,0,1,"[%#y+%#z .. %#x]"},@|
{"SYNCIDI",0x09,0,0,1,"[%#y%?+ .. %#x]"},@|
{"PUSHGO",0xaa,0,0,3,"%lrO=%#b, rL=%a, rJ=%#x, -> %#y+%#z"},@|
@y
{"LDB",0x2a,0,1,1,"%l = M1[%#y+%#z] = %x"},@/
{"LDBI",0x29,0,1,1,"%l = M1[%#y%?+] = %x"},@/
{"LDBU",0x2a,0,1,1,"%l = M1[%#y+%#z] = %#x"},@/
{"LDBUI",0x29,0,1,1,"%l = M1[%#y%?+] = %#x"},@/
{"LDW",0x2a,0,1,1,"%l = M2[%#y+%#z] = %x"},@/
{"LDWI",0x29,0,1,1,"%l = M2[%#y%?+] = %x"},@/
{"LDWU",0x2a,0,1,1,"%l = M2[%#y+%#z] = %#x"},@/
{"LDWUI",0x29,0,1,1,"%l = M2[%#y%?+] = %#x"},@/
{"LDT",0x2a,0,1,1,"%l = M4[%#y+%#z] = %x"},@/
{"LDTI",0x29,0,1,1,"%l = M4[%#y%?+] = %x"},@/
{"LDTU",0x2a,0,1,1,"%l = M4[%#y+%#z] = %#x"},@/
{"LDTUI",0x29,0,1,1,"%l = M4[%#y%?+] = %#x"},@/
{"LDO",0x2a,0,1,1,"%l = M8[%#y+%#z] = %x"},@/
{"LDOI",0x29,0,1,1,"%l = M8[%#y%?+] = %x"},@/
{"LDOU",0x2a,0,1,1,"%l = M8[%#y+%#z] = %#x"},@/
{"LDOUI",0x29,0,1,1,"%l = M8[%#y%?+] = %#x"},@/
{"LDSF",0x2a,0,1,1,"%l = (M4[%#y+%#z]) = %.x"},@/
{"LDSFI",0x29,0,1,1,"%l = (M4[%#y%?+]) = %.x"},@/
{"LDHT",0x2a,0,1,1,"%l = M4[%#y+%#z]<<32 = %#x"},@/
{"LDHTI",0x29,0,1,1,"%l = M4[%#y%?+]<<32 = %#x"},@/
{"CSWAP",0x3a,0,2,2,"%l = [M8[%#y+%#z]==%a] = %x, %r"},@/
{"CSWAPI",0x39,0,2,2,"%l = [M8[%#y%?+]==%a] = %x, %r"},@/
{"LDUNC",0x2a,0,1,1,"%l = M8[%#y+%#z] = %#x"},@/
{"LDUNCI",0x29,0,1,1,"%l = M8[%#y%?+] = %#x"},@/
{"LDVTS",0x2a,0,0,1,""},@/
{"LDVTSI",0x29,0,0,1,""},@/
{"PRELD",0x0a,0,0,1,"[%#y+%#z .. %#x]"},@/
{"PRELDI",0x09,0,0,1,"[%#y%?+ .. %#x]"},@/
{"PREGO",0x0a,0,0,1,"[%#y+%#z .. %#x]"},@/
{"PREGOI",0x09,0,0,1,"[%#y%?+ .. %#x]"},@/
{"GO",0x2a,0,0,3,"%l = %#x, -> %#y+%#z"},@/
{"GOI",0x29,0,0,3,"%l = %#x, -> %#y%?+"},@/
{"STB",0x1a,0,1,1,"M1[%#y+%#z] = %b, M8[%#w]=%#a"},@/
{"STBI",0x19,0,1,1,"M1[%#y%?+] = %b, M8[%#w]=%#a"},@/
{"STBU",0x1a,0,1,1,"M1[%#y+%#z] = %#b, M8[%#w]=%#a"},@/
{"STBUI",0x19,0,1,1,"M1[%#y%?+] = %#b, M8[%#w]=%#a"},@/
{"STW",0x1a,0,1,1,"M2[%#y+%#z] = %b, M8[%#w]=%#a"},@/
{"STWI",0x19,0,1,1,"M2[%#y%?+] = %b, M8[%#w]=%#a"},@/
{"STWU",0x1a,0,1,1,"M2[%#y+%#z] = %#b, M8[%#w]=%#a"},@/
{"STWUI",0x19,0,1,1,"M2[%#y%?+] = %#b, M8[%#w]=%#a"},@/
{"STT",0x1a,0,1,1,"M4[%#y+%#z] = %b, M8[%#w]=%#a"},@/
{"STTI",0x19,0,1,1,"M4[%#y%?+] = %b, M8[%#w]=%#a"},@/
{"STTU",0x1a,0,1,1,"M4[%#y+%#z] = %#b, M8[%#w]=%#a"},@/
{"STTUI",0x19,0,1,1,"M4[%#y%?+] = %#b, M8[%#w]=%#a"},@/
{"STO",0x1a,0,1,1,"M8[%#y+%#z] = %b"},@/
{"STOI",0x19,0,1,1,"M8[%#y%?+] = %b"},@/
{"STOU",0x1a,0,1,1,"M8[%#y+%#z] = %#b"},@/
{"STOUI",0x19,0,1,1,"M8[%#y%?+] = %#b"},@/
{"STSF",0x1a,0,1,1,"%(M4[%#y+%#z]%) = %.b, M8[%#w]=%#a"},@/
{"STSFI",0x19,0,1,1,"%(M4[%#y%?+]%) = %.b, M8[%#w]=%#a"},@/
{"STHT",0x1a,0,1,1,"M4[%#y+%#z] = %#b>>32, M8[%#w]=%#a"},@/
{"STHTI",0x19,0,1,1,"M4[%#y%?+] = %#b>>32, M8[%#w]=%#a"},@/
{"STCO",0x0a,0,1,1,"M8[%#y+%#z] = %b"},@/
{"STCOI",0x09,0,1,1,"M8[%#y%?+] = %b"},@/
{"STUNC",0x1a,0,1,1,"M8[%#y+%#z] = %#b"},@/
{"STUNCI",0x19,0,1,1,"M8[%#y%?+] = %#b"},@/
{"SYNCD",0x0a,0,0,1,"[%#y+%#z .. %#x]"},@/
{"SYNCDI",0x09,0,0,1,"[%#y%?+ .. %#x]"},@/
{"PREST",0x0a,0,0,1,"[%#y+%#z .. %#x]"},@/
{"PRESTI",0x09,0,0,1,"[%#y%?+ .. %#x]"},@/
{"SYNCID",0x0a,0,0,1,"[%#y+%#z .. %#x]"},@/
{"SYNCIDI",0x09,0,0,1,"[%#y%?+ .. %#x]"},@/
{"PUSHGO",0xaa,0,0,3,"%lrO=%#b, rL=%a, rJ=%#x, -> %#y+%#z"},@/
@z

@x [69] l.1666
{"OR",0x2a,0,0,1,"%l = %#y | %#z = %#x"},@|
{"ORI",0x29,0,0,1,"%l = %#y | %z = %#x"},@|
{"ORN",0x2a,0,0,1,"%l = %#y |~ %#z = %#x"},@|
{"ORNI",0x29,0,0,1,"%l = %#y |~ %z = %#x"},@|
{"NOR",0x2a,0,0,1,"%l = %#y ~| %#z = %#x"},@|
{"NORI",0x29,0,0,1,"%l = %#y ~| %z = %#x"},@|
{"XOR",0x2a,0,0,1,"%l = %#y ^ %#z = %#x"},@|
{"XORI",0x29,0,0,1,"%l = %#y ^ %z = %#x"},@|
{"AND",0x2a,0,0,1,"%l = %#y & %#z = %#x"},@|
{"ANDI",0x29,0,0,1,"%l = %#y & %z = %#x"},@|
{"ANDN",0x2a,0,0,1,"%l = %#y \\ %#z = %#x"},@|
{"ANDNI",0x29,0,0,1,"%l = %#y \\ %z = %#x"},@|
{"NAND",0x2a,0,0,1,"%l = %#y ~& %#z = %#x"},@|
{"NANDI",0x29,0,0,1,"%l = %#y ~& %z = %#x"},@|
{"NXOR",0x2a,0,0,1,"%l = %#y ~^ %#z = %#x"},@|
{"NXORI",0x29,0,0,1,"%l = %#y ~^ %z = %#x"},@|
{"BDIF",0x2a,0,0,1,"%l = %#y bdif %#z = %#x"},@|
{"BDIFI",0x29,0,0,1,"%l = %#y bdif %z = %#x"},@|
{"WDIF",0x2a,0,0,1,"%l = %#y wdif %#z = %#x"},@|
{"WDIFI",0x29,0,0,1,"%l = %#y wdif %z = %#x"},@|
{"TDIF",0x2a,0,0,1,"%l = %#y tdif %#z = %#x"},@|
{"TDIFI",0x29,0,0,1,"%l = %#y tdif %z = %#x"},@|
{"ODIF",0x2a,0,0,1,"%l = %#y odif %#z = %#x"},@|
{"ODIFI",0x29,0,0,1,"%l = %#y odif %z = %#x"},@|
{"MUX",0x2a,rM,0,1,"%l = %#b? %#y: %#z = %#x"},@|
{"MUXI",0x29,rM,0,1,"%l = %#b? %#y: %z = %#x"},@|
{"SADD",0x2a,0,0,1,"%l = nu(%#y\\%#z) = %x"},@|
{"SADDI",0x29,0,0,1,"%l = nu(%#y%?\\) = %x"},@|
{"MOR",0x2a,0,0,1,"%l = %#y mor %#z = %#x"},@|
{"MORI",0x29,0,0,1,"%l = %#y mor %z = %#x"},@|
{"MXOR",0x2a,0,0,1,"%l = %#y mxor %#z = %#x"},@|
{"MXORI",0x29,0,0,1,"%l = %#y mxor %z = %#x"},@|
{"SETH",0x20,0,0,1,"%l = %#z"},@|
{"SETMH",0x20,0,0,1,"%l = %#z"},@|
{"SETML",0x20,0,0,1,"%l = %#z"},@|
{"SETL",0x20,0,0,1,"%l = %#z"},@|
{"INCH",0x30,0,0,1,"%l = %#y + %#z = %#x"},@|
{"INCMH",0x30,0,0,1,"%l = %#y + %#z = %#x"},@|
{"INCML",0x30,0,0,1,"%l = %#y + %#z = %#x"},@|
{"INCL",0x30,0,0,1,"%l = %#y + %#z = %#x"},@|
{"ORH",0x30,0,0,1,"%l = %#y | %#z = %#x"},@|
{"ORMH",0x30,0,0,1,"%l = %#y | %#z = %#x"},@|
{"ORML",0x30,0,0,1,"%l = %#y | %#z = %#x"},@|
{"ORL",0x30,0,0,1,"%l = %#y | %#z = %#x"},@|
{"ANDNH",0x30,0,0,1,"%l = %#y \\ %#z = %#x"},@|
{"ANDNMH",0x30,0,0,1,"%l = %#y \\ %#z = %#x"},@|
{"ANDNML",0x30,0,0,1,"%l = %#y \\ %#z = %#x"},@|
{"ANDNL",0x30,0,0,1,"%l = %#y \\ %#z = %#x"},@|
{"JMP",0x40,0,0,1,"-> %#z"},@|
{"JMPB",0x40,0,0,1,"-> %#z"},@|
{"PUSHJ",0xe0,0,0,1,"%lrO=%#b, rL=%a, rJ=%#x, -> %#z"},@|
{"PUSHJB",0xe0,0,0,1,"%lrO=%#b, rL=%a, rJ=%#x, -> %#z"},@|
{"GETA",0x60,0,0,1,"%l = %#z"},@|
{"GETAB",0x60,0,0,1,"%l = %#z"},@|
{"PUT",0x02,0,0,1,"%s = %r"},@|
{"PUTI",0x01,0,0,1,"%s = %r"},@|
{"POP",0x80,rJ,0,3,"%lrL=%a, rO=%#b, -> %#y%?+"},@|
{"RESUME",0x00,0,0,5,"{%#b} -> %#z"},@|
{"SAVE",0x20,0,20,1,"%l = %#x"},@|
{"UNSAVE",0x82,0,20,1,"%#z: rG=%x, ..., rL=%a"},@|
{"SYNC",0x01,0,0,1,""},@|
{"SWYM",0x00,0,0,1,""},@|
{"GET",0x20,0,0,1,"%l = %s = %#x"},@|
@y
{"OR",0x2a,0,0,1,"%l = %#y | %#z = %#x"},@/
{"ORI",0x29,0,0,1,"%l = %#y | %z = %#x"},@/
{"ORN",0x2a,0,0,1,"%l = %#y |~ %#z = %#x"},@/
{"ORNI",0x29,0,0,1,"%l = %#y |~ %z = %#x"},@/
{"NOR",0x2a,0,0,1,"%l = %#y ~| %#z = %#x"},@/
{"NORI",0x29,0,0,1,"%l = %#y ~| %z = %#x"},@/
{"XOR",0x2a,0,0,1,"%l = %#y ^ %#z = %#x"},@/
{"XORI",0x29,0,0,1,"%l = %#y ^ %z = %#x"},@/
{"AND",0x2a,0,0,1,"%l = %#y & %#z = %#x"},@/
{"ANDI",0x29,0,0,1,"%l = %#y & %z = %#x"},@/
{"ANDN",0x2a,0,0,1,"%l = %#y \\ %#z = %#x"},@/
{"ANDNI",0x29,0,0,1,"%l = %#y \\ %z = %#x"},@/
{"NAND",0x2a,0,0,1,"%l = %#y ~& %#z = %#x"},@/
{"NANDI",0x29,0,0,1,"%l = %#y ~& %z = %#x"},@/
{"NXOR",0x2a,0,0,1,"%l = %#y ~^ %#z = %#x"},@/
{"NXORI",0x29,0,0,1,"%l = %#y ~^ %z = %#x"},@/
{"BDIF",0x2a,0,0,1,"%l = %#y bdif %#z = %#x"},@/
{"BDIFI",0x29,0,0,1,"%l = %#y bdif %z = %#x"},@/
{"WDIF",0x2a,0,0,1,"%l = %#y wdif %#z = %#x"},@/
{"WDIFI",0x29,0,0,1,"%l = %#y wdif %z = %#x"},@/
{"TDIF",0x2a,0,0,1,"%l = %#y tdif %#z = %#x"},@/
{"TDIFI",0x29,0,0,1,"%l = %#y tdif %z = %#x"},@/
{"ODIF",0x2a,0,0,1,"%l = %#y odif %#z = %#x"},@/
{"ODIFI",0x29,0,0,1,"%l = %#y odif %z = %#x"},@/
{"MUX",0x2a,rM,0,1,"%l = %#b? %#y: %#z = %#x"},@/
{"MUXI",0x29,rM,0,1,"%l = %#b? %#y: %z = %#x"},@/
{"SADD",0x2a,0,0,1,"%l = nu(%#y\\%#z) = %x"},@/
{"SADDI",0x29,0,0,1,"%l = nu(%#y%?\\) = %x"},@/
{"MOR",0x2a,0,0,1,"%l = %#y mor %#z = %#x"},@/
{"MORI",0x29,0,0,1,"%l = %#y mor %z = %#x"},@/
{"MXOR",0x2a,0,0,1,"%l = %#y mxor %#z = %#x"},@/
{"MXORI",0x29,0,0,1,"%l = %#y mxor %z = %#x"},@/
{"SETH",0x20,0,0,1,"%l = %#z"},@/
{"SETMH",0x20,0,0,1,"%l = %#z"},@/
{"SETML",0x20,0,0,1,"%l = %#z"},@/
{"SETL",0x20,0,0,1,"%l = %#z"},@/
{"INCH",0x30,0,0,1,"%l = %#y + %#z = %#x"},@/
{"INCMH",0x30,0,0,1,"%l = %#y + %#z = %#x"},@/
{"INCML",0x30,0,0,1,"%l = %#y + %#z = %#x"},@/
{"INCL",0x30,0,0,1,"%l = %#y + %#z = %#x"},@/
{"ORH",0x30,0,0,1,"%l = %#y | %#z = %#x"},@/
{"ORMH",0x30,0,0,1,"%l = %#y | %#z = %#x"},@/
{"ORML",0x30,0,0,1,"%l = %#y | %#z = %#x"},@/
{"ORL",0x30,0,0,1,"%l = %#y | %#z = %#x"},@/
{"ANDNH",0x30,0,0,1,"%l = %#y \\ %#z = %#x"},@/
{"ANDNMH",0x30,0,0,1,"%l = %#y \\ %#z = %#x"},@/
{"ANDNML",0x30,0,0,1,"%l = %#y \\ %#z = %#x"},@/
{"ANDNL",0x30,0,0,1,"%l = %#y \\ %#z = %#x"},@/
{"JMP",0x40,0,0,1,"-> %#z"},@/
{"JMPB",0x40,0,0,1,"-> %#z"},@/
{"PUSHJ",0xe0,0,0,1,"%lrO=%#b, rL=%a, rJ=%#x, -> %#z"},@/
{"PUSHJB",0xe0,0,0,1,"%lrO=%#b, rL=%a, rJ=%#x, -> %#z"},@/
{"GETA",0x60,0,0,1,"%l = %#z"},@/
{"GETAB",0x60,0,0,1,"%l = %#z"},@/
{"PUT",0x02,0,0,1,"%s = %r"},@/
{"PUTI",0x01,0,0,1,"%s = %r"},@/
{"POP",0x80,rJ,0,3,"%lrL=%a, rO=%#b, -> %#y%?+"},@/
{"RESUME",0x00,0,0,5,"{%#b} -> %#z"},@/
{"SAVE",0x20,0,20,1,"%l = %#x"},@/
{"UNSAVE",0x82,0,20,1,"%#z: rG=%x, ..., rL=%a"},@/
{"SYNC",0x01,0,0,1,""},@/
{"SWYM",0x00,0,0,1,""},@/
{"GET",0x20,0,0,1,"%l = %s = %#x"},@/
@z

@x [71] l.1742
  if (f&X_is_source_bit) @<Set |b| from register X@>;
  if (info[op].third_operand) @<Set |b| from special register@>;
@y
  if (f&X_is_source_bit) @<Set \9{b}|b| from register X@>;
  if (info[op].third_operand) @<Set \9{b}|b| from special register@>;
@z

@x [74] l.1772
@ @<Set |b| from register X@>=
@y
@ @<Set \9{b}|b| from register X@>=
@z

@x [75] l.1779 RAII.
register int G,L,O; /* accessible copies of key registers */
@y
register int G,L,O=0; /* accessible copies of key registers */
@z

@x [77] l.1792 Different approach for ABSTIME.
(The macro \.{ABSTIME} is defined externally in the file \.{abstime.h},
which should have just been created by {\mc ABSTIME}\kern.05em;
{\mc ABSTIME} is
a trivial program that computes the value of the standard library function
|time(NULL)|. We assume that this number, which is the number of seconds in
@y
(The macro \.{ABSTIME} will be set to a numeric value at compilation-time in
\.{Makefile}. We assume that this number, which is the number of seconds in
@z

@x [77] l.1801 Different approach for ABSTIME.
@d VERSION 1 /* version of the \MMIX\ architecture that we support */
@y
@d ABSTIME /* number of seconds in “the epoch” */
@d VERSION 1 /* version of the \MMIX\ architecture that we support */
@z

@x [77] l.1803 Change from MMIX home.
@d SUBSUBVERSION 1 /* further qualification to version number */
@y
@d SUBSUBVERSION 3 /* further qualification to version number */
@z

@x [77] l.1807 Compound literal.
g[rN].h=(VERSION<<24)+(SUBVERSION<<16)+(SUBSUBVERSION<<8);
g[rN].l=ABSTIME; /* see comment and warning above */
@y
g[rN]=(octa){(VERSION<<24)+(SUBVERSION<<16)+(SUBSUBVERSION<<8),@|
  ABSTIME}; /* see comment and warning above */
@z

@x [79] l.1838
@ @<Set |b| from special register@>=
@y
@ @<Set \9{b}|b| from special register@>=
@z

@x [80] l.1842 Change from MMIX home.
if (xx>=G) {
@y
{ if (xx>=G) {
@z

@x [80] l.1849 Change from MMIX home.
}
@y
} }
@z

@x [82] l.1865 C99 prototypes for C2x.
void stack_store @,@,@[ARGS((void))@];@+@t}\6{@>
void stack_store()
@y
void stack_store(void)
@z

@x [83] l.1886 C99 prototypes for C2x.
void stack_load @,@,@[ARGS((void))@];@+@t}\6{@>
void stack_load()
@y
void stack_load(void)
@z

@x [86] l.1945 Add missing bit-fiddling functions to MMIX-ARITH.
case OR: case ORI: case ORH: case ORMH: case ORML: case ORL:
 x.h=y.h|z.h;@+ x.l=y.l|z.l;@+ goto store_x;
case ORN: case ORNI:
 x.h=y.h|~z.h;@+ x.l=y.l|~z.l;@+ goto store_x;
case NOR: case NORI:
 x.h=~(y.h|z.h);@+ x.l=~(y.l|z.l);@+ goto store_x;
case XOR: case XORI:
 x.h=y.h^z.h;@+ x.l=y.l^z.l;@+ goto store_x;
case AND: case ANDI:
 x.h=y.h&z.h;@+ x.l=y.l&z.l;@+ goto store_x;
case ANDN: case ANDNI: case ANDNH: case ANDNMH: case ANDNML: case ANDNL:
 x.h=y.h&~z.h;@+ x.l=y.l&~z.l;@+ goto store_x;
case NAND: case NANDI:
 x.h=~(y.h&z.h);@+ x.l=~(y.l&z.l);@+ goto store_x;
case NXOR: case NXORI:
 x.h=~(y.h^z.h);@+ x.l=~(y.l^z.l);@+ goto store_x;
@y
case OR: case ORI: case ORH: case ORMH: case ORML: case ORL:
 x=oor(y,z);@+ goto store_x;
case ORN: case ORNI:
 x=oorn(y,z);@+ goto store_x;
case NOR: case NORI:
 x=onor(y,z);@+ goto store_x;
case AND: case ANDI:
 x=oand(y,z);@+ goto store_x;
case ANDN: case ANDNI: case ANDNH: case ANDNMH: case ANDNML: case ANDNL:
 x=oandn(y,z);@+ goto store_x;
case NAND: case NANDI:
 x=onand(y,z);@+ goto store_x;
case XOR: case XORI:
 x=oxor(y,z);@+ goto store_x;
case NXOR: case NXORI:
 x=onxor(y,z);@+ goto store_x;
@z

@x [87] l.1971 Issue #16.
  a=shift_right(x,shift_amt,0);
@y
  a=shift_right(x,shift_amt,false);
@z

@x [87] l.1978 Use bit-fiddling functions from MMIX-ARITH.
 x.h=(y.h&b.h)|(z.h&~b.h);@+ x.l=(y.l&b.l)|(z.l&~b.l);
@y
 x=oor(oand(y,b), oandn(z,b)); @+
@z

@x [87] l.1987
 x.h=byte_diff(y.h,z.h);@+x.l=byte_diff(y.l,z.l);@+goto store_x;
@y
 x=(octa){byte_diff(y.h,z.h),byte_diff(y.l,z.l)};@+goto store_x;
@z

@x [87] l.1989
 x.h=wyde_diff(y.h,z.h);@+x.l=wyde_diff(y.l,z.l);@+goto store_x;
@y
 x=(octa){wyde_diff(y.h,z.h),wyde_diff(y.l,z.l)};@+goto store_x;
@z

@x [89] l.2027 Change from MMIX home.
 round_mode=(y.l? y.l: cur_round);@+goto store_fx;
@y
 round_mode=(y.l? y.l: (tetra)cur_round);@+goto store_fx;
@z

@x [90] l.2043 GCC warning.
case CMPU: case CMPUI:@+if (y.h<z.h) goto cmp_neg;
@y
  @=/* else fall through */@>@;
case CMPU: case CMPUI:@+if (y.h<z.h) goto cmp_neg;
@z

@x [90] l.2051 GCC warning.
case FCMP: k=fcomp(y,z);
@y
  @=/* else fall through */@>@;
case FCMP: k=fcomp(y,z);
@z

@x [91] l.2068 C99 prototypes for C2x.
int register_truth @,@,@[ARGS((octa,mmix_opcode))@];@+@t}\6{@>
int register_truth(o,op)
  octa o;
  mmix_opcode op;
@y
int register_truth(
  octa o,
  mmix_opcode op)
@z

@x [91] l.2072 RAII.
{@+register int b;
@y
{@+register int b=0;
@z

@x [91] l.2075 Change from MMIX home.
 case 1: b=(o.h==0 && o.l==0);@+break; /* zero? */
@y
 default: case 1: b=(o.h==0 && o.l==0);@+break; /* zero? */
@z

@x [94] l.2141 Compound literal.
 x.h=ll->tet;@+ x.l=(ll+1)->tet;
@y
 x=(octa){ll->tet, (ll+1)->tet};
@z

@x [95] l.2155 Issue #16.
   a=shift_right(shift_left(b,i),i,0);
@y
   a=shift_right(shift_left(b,i),i,false);
@z

@x [95] l.2166 Compound literal.
 a.h=ll->tet;@+ a.l=(ll+1)->tet; /* for trace output */
@y
 a=(octa){ll->tet, (ll+1)->tet}; /* for trace output */
@z

@x [95] l.2169 GCC warning.
case STO: case STOI: case STOU: case STOUI: case STUNC: case STUNCI:
@y
  @=/* fall through */@>@;
case STO: case STOI: case STOU: case STOUI: case STUNC: case STUNCI:
@z

@x [96] l.2185 Compound literal.
   x.h=0, x.l=1;
@y
   x=(octa){0, 1};
@z

@x [96] l.2190 Compound literal.
   b.h=ll->tet, b.l=(ll+1)->tet;
@y
   b=(octa){ll->tet, (ll+1)->tet};
@z

@x [97] l.2208
    else if (xx==rL) @<Set $L=z=\min(z,L)$@>@;
@y
    else if (xx==rL) @<Set \9{l}$L=z=\min(z,L)$@>@;
@z

@x [98] l.2213
@ @<Set $L=z=\min(z,L)$@>=
@y
@ @<Set \9{l}$L=z=\min(z,L)$@>=
@z

@x [98] l.2216 Change from MMIX home. Compound literal.
  if (z.l>L || z.h) z.h=0, z.l=L;
@y
  if (z.l>(tetra)L || z.h) z=(octa){0, L};
@z

@x [99] l.2222 Change from MMIX home.
  if (z.h!=0 || z.l>255 || z.l<L || z.l<32) goto illegal_inst;
@y
  if (z.h!=0 || z.l>255 || z.l<(tetra)L || z.l<32) goto illegal_inst;
@z

@x [103] l.2295
if (k==rZ+1) x.h=G<<24, x.l=g[rA].l;
@y
if (k==rZ+1) x=(octa){G<<24, g[rA].l};
@z

@x [104] l.2313
   @<Load |g[k]| from the register stack@>;
@y
   @<Load \9{g}|g[k]| from the register stack@>;
@z

@x [105] l.2328
@ @<Load |g[k]| from the register stack@>=
@y
@ @<Load \9{g}|g[k]| from the register stack@>=
@z

@x [105] l.2335 Compound literal.
}@+else g[k].h=ll->tet, g[k].l=(ll+1)->tet;
@y
}@+else g[k]=(octa){ll->tet, (ll+1)->tet};
@z

@x [107] l.2366 GCC warning.
case LDVTS: case LDVTSI: privileged_inst: strcpy(lhs,"!privileged");
@y
  @=/* else fall through */@>@;
case LDVTS: case LDVTSI: privileged_inst: strcpy(lhs,"!privileged");
@z

@x [108] l.2388 Compound literal.
 g[rXX].h=sign_bit, g[rXX].l=inst;
 g[rYY]=y, g[rZZ]=z;
 z.h=0, z.l=zz;
@y
 g[rXX]=(octa){sign_bit, inst};
 g[rYY]=y, g[rZZ]=z;
 z=(octa){0, zz};
@z

@x [108] l.2395 Decouple 'mixins'.
case Fopen: g[rBB]=mmix_fopen((unsigned char)zz,mb,ma);@+break;
@y
case Fopen: g[rBB]=mmix_fopen((unsigned char)zz,mb,ma,mmgetchars);@+break;
@z

@x [108] l.2397 Decouple 'mixins'.
case Fread: g[rBB]=mmix_fread((unsigned char)zz,mb,ma);@+break;
case Fgets: g[rBB]=mmix_fgets((unsigned char)zz,mb,ma);@+break;
case Fgetws: g[rBB]=mmix_fgetws((unsigned char)zz,mb,ma);@+break;
case Fwrite: g[rBB]=mmix_fwrite((unsigned char)zz,mb,ma);@+break;
case Fputs: g[rBB]=mmix_fputs((unsigned char)zz,b);@+break;
case Fputws: g[rBB]=mmix_fputws((unsigned char)zz,b);@+break;
@y
case Fread: g[rBB]=mmix_fread((unsigned char)zz,mb,ma,mmputchars,stdin_chr);@+break;
case Fgets: g[rBB]=mmix_fgets((unsigned char)zz,mb,ma,mmputchars,stdin_chr);@+break;
case Fgetws: g[rBB]=mmix_fgetws((unsigned char)zz,mb,ma,mmputchars,stdin_chr);@+break;
case Fwrite: g[rBB]=mmix_fwrite((unsigned char)zz,mb,ma,mmgetchars);@+break;
case Fputs: g[rBB]=mmix_fputs((unsigned char)zz,b,mmgetchars);@+break;
case Fputws: g[rBB]=mmix_fputws((unsigned char)zz,b,mmgetchars);@+break;
@z

@x [111] l.2433 Compound literal.
  mb.h=ll->tet, mb.l=(ll+1)->tet;
  ll=mem_find(a);@+test_load_bkpt(ll);@+test_load_bkpt(ll+1);
  ma.h=ll->tet, ma.l=(ll+1)->tet;
@y
  mb=(octa){ll->tet, (ll+1)->tet};
  ll=mem_find(a);@+test_load_bkpt(ll);@+test_load_bkpt(ll+1);
  ma=(octa){ll->tet, (ll+1)->tet};
@z

@x [112] l.2440 Decouple 'mixins'.
Here we need only declare those subroutines, and write three primitive
interfaces on which they depend.

@ @<Glob...@>=
extern void mmix_io_init @,@,@[ARGS((void))@];
extern octa mmix_fopen @,@,@[ARGS((unsigned char,octa,octa))@];
extern octa mmix_fclose @,@,@[ARGS((unsigned char))@];
extern octa mmix_fread @,@,@[ARGS((unsigned char,octa,octa))@];
extern octa mmix_fgets @,@,@[ARGS((unsigned char,octa,octa))@];
extern octa mmix_fgetws @,@,@[ARGS((unsigned char,octa,octa))@];
extern octa mmix_fwrite @,@,@[ARGS((unsigned char,octa,octa))@];
extern octa mmix_fputs @,@,@[ARGS((unsigned char,octa))@];
extern octa mmix_fputws @,@,@[ARGS((unsigned char,octa))@];
extern octa mmix_fseek @,@,@[ARGS((unsigned char,octa))@];
extern octa mmix_ftell @,@,@[ARGS((unsigned char))@];
extern void print_trip_warning @,@,@[ARGS((int,octa))@];
extern void mmix_fake_stdin @,@,@[ARGS((FILE*))@];
@y
Here we need only write three primitive
interfaces on which they depend.

@c
#include "mmix-io.h" /* |@!mmix_io_init| */

@ The following three functions are used in {\mc MMIX-IO} as ``mixins'' in
section \X108:Trips and traps\X.  Similar functions are defined in the
meta-simulator {\mc MMIX-PIPE}.

@<Proto...@>=
static int mmgetchars(char*,int,octa,int);
static void mmputchars(unsigned char*,int,octa);
static char stdin_chr(void);
@z

@x [114] l.2468 Decouple 'mixins'.
int mmgetchars @,@,@[ARGS((char*,int,octa,int))@];@+@t}\6{@>
int mmgetchars(buf,size,addr,stop)
  char *buf;
  int size;
  octa addr;
  int stop;
@y
static int mmgetchars(
  char *buf,
  int size,
  octa addr,
  int stop)
@z

@x [117] l.2516 Decouple 'mixins'.
void mmputchars @,@,@[ARGS((unsigned char*,int,octa))@];@+@t}\6{@>
void mmputchars(buf,size,addr)
  unsigned char *buf;
  int size;
  octa addr;
@y
static void mmputchars(
  unsigned char *buf,
  int size,
  octa addr)
@z

@x [117] l.2528
    if ((a.l&0x3) || m>size-4) @<Load and write one byte@>@;
    else @<Load and write four bytes@>;
@y
    if ((a.l&0x3) || m>size-4) @<Load \9{a}and write one byte@>@;
    else @<Load \9{a}and write four bytes@>;
@z

@x [118] l.2533
@ @<Load and write one byte@>=
@y
@ @<Load \9{a}and write one byte@>=
@z

@x [119] l.2540
@ @<Load and write four bytes@>=
@y
@ @<Load \9{a}and write four bytes@>=
@z

@x [120] l.2558 Decouple 'mixins'.
char stdin_chr @,@,@[ARGS((void))@];@+@t}\6{@>
char stdin_chr()
@y
static char stdin_chr(void)
@z

@x [120] l.2567 Replace magic number.
    if (!fgets(stdin_buf,256,stdin))
@y
    if (!fgets(stdin_buf,sizeof(stdin_buf),stdin))
@z

@x [123] l.2600 Compound literal.
  inst_ptr.h=0, inst_ptr.l=k<<4;
  g[rX].h=sign_bit, g[rX].l=inst;
@y
  inst_ptr=(octa){0, k<<4};
  g[rX]=(octa){sign_bit, inst};
@z

@x [125] l.2630 GCC warning.
 case RESUME_SET: k=(b.l>>16)&0xff;
@y
  @=/* else fall through */@>@;
 case RESUME_SET: k=(b.l>>16)&0xff;
@z

@x [125] l.2632 GCC warning.
 case RESUME_AGAIN:@+if ((b.l>>24)==RESUME) goto illegal_inst;
@y
  @=/* else fall through */@>@;
 case RESUME_AGAIN:@+if ((b.l>>24)==RESUME) goto illegal_inst;
@z

@x [137] l.2820 Untangle variables from functions.
fmt_style style;
char *stream_name[]={"StdIn","StdOut","StdErr"};
@.StdIn@>
@.StdOut@>
@.StdErr@>
@#
void trace_print @,@,@[ARGS((octa))@];@+@t}\6{@>
void trace_print(o)
  octa o;
@y
void trace_print(
  octa o)
@z

@x [137] l.2835 Change from MMIX home.
 case handle:@+if (o.h==0 && o.l<3) printf(stream_name[o.l]);
@y
 case handle:@+if (o.h==0 && o.l<3) printf("%s",stream_name[o.l]);
@z

@x [138] l.2846 Change from MMIX home.
case 's': printf(special_name[zz]);@+break;
@y
case 's': printf("%s",special_name[zz]);@+break;
@z

@x [138] l.2848 Change from MMIX home.
case 'l': printf(lhs);@+break;
@y
case 'l': printf("%s",lhs);@+break;
@z

@x [139] l.2854 Untangle variables from functions.
char left_paren[]={0,'[','^','_','('}; /* denotes the rounding mode */
@y
fmt_style style;
char *stream_name[]={"StdIn","StdOut","StdErr"};
@.StdIn@>
@.StdOut@>
@.StdErr@>
char left_paren[]={0,'[','^','_','('}; /* denotes the rounding mode */
@z

@x [140] l.2862 C99 prototypes for C2x.
void show_stats @,@,@[ARGS((bool))@];@+@t}\6{@>
void show_stats(verbose)
  bool verbose;
@y
void show_stats(
  bool verbose)
@z

@x [141] l.2882 #included in "mmix-io.h"
#include <stdio.h>
@y
@z

@x [141] l.2887 Improved module structure with interfaces.
#include "abstime.h"
@y
@#
@z

@x [141] l.2888
@<Preprocessor macros@>@;
@y
@h
@<Preprocessor macros@>@;
@z
@x [141] l.2891 C99 prototypes for C2x.
@<Subroutines@>@;
@#
int main(argc,argv)
  int argc;
  char *argv[];
@y
@<Prototypes@>@;
@<Subroutines@>@;
@#
int main(
  int argc,
  char *argv[])
@z

@x [141] l.2903
  while (1) {
@y
  while (true) {
@z

@x [143] l.2946 C99 prototypes for C2x.
void scan_option @,@,@[ARGS((char*,bool))@];@+@t}\6{@>
void scan_option(arg,usage)
  char *arg; /* command line argument (without the `\.-') */
  bool usage; /* should we exit with usage note if unrecognized? */
@y
void scan_option(
  char *arg, /* command line argument (without the `\.-') */
  bool usage) /* should we exit with usage note if unrecognized? */
@z

@x [143] l.2967 GCC warning
 case 'P': profiling=true;@+return;
@y
  @=/* else fall through */@>@;
 case 'P': profiling=true;@+return;
@z

@x [143] l.2987 Change from MMIX home.
    for (k=0;usage_help[k][0];k++) fprintf(stderr,usage_help[k]);
@y
    for (k=0;usage_help[k][0];k++) fprintf(stderr,"%s",usage_help[k]);
@z

@x [143] l.2989 Change from MMIX home.
  }@+else@+ for (k=0;usage_help[k][1]!='b';k++) printf(usage_help[k]);
@y
  }@+else@+ for (k=0;usage_help[k][1]!='b';k++) printf("%s",usage_help[k]);
@z

@x [148] l.3064 C99 prototypes for C2x.
void catchint @,@,@[ARGS((int))@];@+@t}\6{@>
void catchint(n)
  int n;
@y
void catchint(
  int n)
@z

@x [148] l.3068 Change from MMIX home.
  interrupt=true;
@y
  if (n!=SIGINT) return;
  interrupt=true;
@z

@x [149] l.3084
  @t\4@>@<Cases that change |cur_disp_mode|@>;
@y
@/@t\4@>@<Cases that change |cur_disp_mode|@>;
@z

@x [149] l.3093 Change from MMIX home.
  case 'h':@+ for (k=0;interactive_help[k][0];k++) printf(interactive_help[k]);
@y
  case 'h':@+ for (k=0;interactive_help[k][0];k++) printf("%s",interactive_help[k]);
@z

@x [149] l.3096 Change from MMIX home.
 check_syntax:@+ if (*p!='\n') {
@y
  if (*p!='\n') {
@z

@x [150] l.3114 Change from MMIX home.
    }@+else if (command_buf[0]!='\n' && command_buf[0]!='i' &&
              command_buf[0]!='%')
      if (command_buf[0]==' ') printf("%s",command_buf);
      else ready=true;
@y
    }@+else if (command_buf[0]!='\n' && command_buf[0]!='i' &&
              command_buf[0]!='%') {
      if (command_buf[0]==' ') printf("%s",command_buf);
      else ready=true; }
@z

@x [154] l.3194 C99 prototypes for C2x.
octa scan_hex @,@,@[ARGS((char*,octa))@];@+@t}\6{@>
octa scan_hex(s,offset)
  char *s;
  octa offset;
@y
octa scan_hex(
  char *s,
  octa offset)
@z

@x [154] l.3199 RAII.
  register char *p;
  octa o;
  o=zero_octa;
@y
  register char *p;
  octa o=zero_octa;
@z

@x [157] l.3248
  if (k<32) @<Set |g[k]=val| only if permissible@>;
@y
  if (k<32) @<Set \9{g}|g[k]=val| only if permissible@>;
@z

@x [158] l.3259
@<Set |g[k]=val| only if permissible@>=
@y
@<Set \9{g}|g[k]=val| only if permissible@>=
@z

@x [158] l.3266 Change from MMIX home.
    if (val.h!=0 || val.l>255 || val.l<L || val.l<32) break;
@y
    if (val.h!=0 || val.l>255 || val.l<(tetra)L || val.l<32) break;
@z

@x [158] l.3270 Change from MMIX home.
    if (val.h==0 && val.l<L) L=val.l;
@y
    if (val.h==0 && val.l<(tetra)L) L=val.l;
@z

@x [159] l.3289 Compound literal.
    aux.h=ll->tet;@+ aux.l=(ll+1)->tet;
@y
    aux=(octa){ll->tet, (ll+1)->tet};
@z

@x [160] l.3301 C99 prototypes for C2x.
void print_string @,@,@[ARGS((octa))@];@+@t}\6{@>
void print_string(o)
  octa o;
@y
void print_string(
  octa o)
@z

@x [162] l.3347 C99 prototypes for C2x.
void show_breaks @,@,@[ARGS((mem_node*))@];@+@t}\6{@>
void show_breaks(p)
  mem_node *p;
@y
void show_breaks(
  mem_node *p)
@z

@x [162] l.3351
  register int j;
  octa cur_loc;
@y
@z

@x [162] l.3354
  for (j=0;j<512;j++) if (p->dat[j].bkpt) {
@y
  for (int j=0;j<512;j++) if (p->dat[j].bkpt) {
@z

@x [162] l.3355
    cur_loc=incr(p->loc,4*j);
@y
    octa cur_loc=incr(p->loc,4*j);
@z

@x [163] l.3374 Compound literal.
x.h=0x40000000, x.l=0x8;
@y
x=(octa){0x40000000, 0x8};
@z

@x [164] l.3386 Compound literal.
x.h=0, x.l=0xf0;
@y
x=(octa){0, 0xf0};
@z

@x [165] l.3412 C99 prototypes for C2x.
void dump @,@,@[ARGS((mem_node*))@];@+@t}\6{@>
void dump_tet @,@,@[ARGS((tetra))@];@+@t}\6{@>
void dump(p)
  mem_node *p;
@y
void dump(
  mem_node *p)
@z

@x [165] l.3417
  register int j;
  octa cur_loc;
@y
@z

@x [165] l.3420
  for (j=0;j<512;j+=2) if (p->dat[j].tet || p->dat[j+1].tet) {
    cur_loc=incr(p->loc,4*j);
@y
  for (int j=0;j<512;j+=2) if (p->dat[j].tet || p->dat[j+1].tet) {
    octa cur_loc=incr(p->loc,4*j);
@z

@x [166] l.3434 C99 prototypes for C2x.
void dump_tet(t)
  tetra t;
@y
void dump_tet(
  tetra t)
@z
