@x [0] l.10 Use standard C99 type.
@s bool normal @q unreserve a C++ keyword @>
@y
@z

@x [0] l.11
@s xor normal @q unreserve a C++ keyword @>
@y
@s xor normal @q unreserve a C++ keyword @>

\input pdfwebtocfront

@z

@x [1] l.17 Improved usability.
file called \.{mmix-pipe.h}. The header file is used by the main routine and
@y
file called |@(mmix-pipe.h@>|. The header file is used by the main routine and
@z

@x [1] l.20 Fix typo.
Readers of this program should be familiar with the explanation of \MMIX\
@y
Readers of this program should be familiar with the explanation of \MMIX's
@z

@x [3] l.125 Improved module structure with interfaces.
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "abstime.h"
@y
#include "mmix-pipe.h" /* we use our own interface first;
  see |@(mmix-pipe.h@>| */
#include "mmix-io.h" /* |@!mmix_fopen|, |@!mmix_fclose|, etc. */
@#
#include <stdarg.h> /* |@!vfprintf|, |@!va_start|, |@!va_end| */
@#
@z

@x [3] l.130 Improved module structure with interfaces.
@<Header definitions@>@;
@<Type definitions@>@;
@<Global variables@>@;
@<External variables@>@;
@<Internal prototypes@>@;
@<External prototypes@>@;
@<Subroutines@>@;
@<External routines@>@;
@y
@<Global variables@>@;
@<Internal prototypes@>@;
@<Subroutines@>@;
@<External variables@>@;
@<External routines@>@;
@z

@x [5] l.152 Improved module structure with interfaces.
@(mmix-pipe.h@>=
@y
@(mmix-pipe.h@>=
#ifndef MMIX_PIPE_H
#define MMIX_PIPE_H
@#
#include <math.h> /* we'll override |fsqrt| below */
#include <stdlib.h> /* we'll override |div| and |random| below */
@#
#include "mmix-arith.h"
  /* |@!byte|, |@!tetra|, |@!octa|, |@!sign_bit|, |@!print_octa|, etc. */
@#
@z

@x [5] l.157 Improved module structure with interfaces.
@<External prototypes@>@;
@y
@<External prototypes@>@;
#undef Extern
@#
#endif /* |MMIX_PIPE_H| */
@z

@x [6] l.159 Stuff from MMIX-ARITH.
@ Subroutines of this program are declared first with a prototype,
as in {\mc ANSI C}, then with an old-style \CEE/ function definition.
The following preprocessor commands make this work correctly with both
new-style and old-style compilers.
@^prototypes for functions@>

@<Header def...@>=
#ifdef __STDC__
#define ARGS(list) list
#else
#define ARGS(list) ()
#endif
@y
@ Subroutines of this program are declared and defined with a prototype,
as in {\mc ANSI C}.
@z

@x [8] l.182 Don't expose unnecessary items.
@ The amount of verbosity depends on the following bit codes.

@<Header def...@>=
#define issue_bit (1<<0)
@y
@ The amount of verbosity depends on the following bit codes.

@d issue_bit (1<<0)
@z
@x [8] l.187
#define pipe_bit (1<<1)
@y
@d pipe_bit (1<<1)
@z
@x [8] l.189
#define coroutine_bit (1<<2)
@y
@d coroutine_bit (1<<2)
@z
@x [8] l.191
#define schedule_bit (1<<3)
@y
@d schedule_bit (1<<3)
@z
@x [8] l.193
#define uninit_mem_bit (1<<4)
@y
@d uninit_mem_bit (1<<4)
@z
@x [8] l.195
#define interactive_read_bit (1<<5)
@y
@d interactive_read_bit (1<<5)
@z
@x [8] l.197
#define show_spec_bit (1<<6)
@y
@d show_spec_bit (1<<6)
@z
@x [8] l.199
#define show_pred_bit (1<<7)
@y
@d show_pred_bit (1<<7)
@z
@x [8] l.201
#define show_wholecache_bit (1<<8)
@y
@d show_wholecache_bit (1<<8)
@z

@x [9] l.204 Reshuffle MMIX_silent.
@ The |MMIX_init()| routine should be called exactly once, after
|MMIX_config()| has done its work but before the simulator starts to execute
any programs. Then |MMIX_run()| can be called as often as the user likes.

The |MMIX_silent()| routine is a noninteractive variant of |MMIX_run()|:
It will return the value of register |g[255].l| when executing a
\.{TRAP} \.{0,Halt,0} instruction.

@s octa int

@<External proto...@>=
Extern void MMIX_init @,@,@[ARGS((void))@];
Extern void MMIX_run @,@,@[ARGS((int cycs, octa breakpoint))@];
Extern int MMIX_silent @,@,@[ARGS((void))@];

@ @<External routines@>=
@y
@ @<External proto...@>=
Extern void MMIX_init(void);
Extern void MMIX_run(int, octa);
Extern int MMIX_silent(void);

@ The |MMIX_init()| routine should be called exactly once, after
|MMIX_config()| has done its work but before the simulator starts to execute
any programs. Then |MMIX_run()| can be called as often as the user likes.

@<External routines@>=
@z

@x [10] l.220 C99 prototypes for C2x.
void MMIX_init()
@y
void MMIX_init(void)
@z
@x [10] l.222
  register int i,j;
@y
@z

@x [10] l.226 Reshuffle MMIX_silent.
int MMIX_silent()
{
  octa breakpoint;
  @<Local variables@>;
  while (true) {
    @<Perform one machine cycle@>;
    if (halted) return specval(&g[255]).o.l;
  }
}
@#
@y
@z

@x [10] l.236 C99 prototypes for C2x.
void MMIX_run(cycs,breakpoint)
  int cycs;
  octa breakpoint;
@y
void MMIX_run(
  int cycs,
  octa breakpoint)
@z

@x [10] l.256 Change from MMIX home.
 cease:;
@y
@z

@x [11] l.259 Use standard C99 type. ('wow' was never used anywhere.)
@ @<Type...@>=
typedef enum {@!false, @!true, @!wow}@+bool; /* slightly extended booleans */
@y
@ The |MMIX_silent()| routine is a noninteractive variant of |MMIX_run()|:
It will return the value of register |g[255].l| when executing a
\.{TRAP} \.{0,Halt,0} instruction.

@<External routines@>=
int MMIX_silent(void)
{
  octa breakpoint;@+@t}\6{@>
  @<Local variables@>;@#
  while (true) {
    @<Perform one machine cycle@>;
    if (halted) return specval(&g[255]).o.l;
  }
}
@z

@x [12] l.263
register int i,j,m;
@y
register int i,j;
@z

@x [13] l.271
@d errprint0(f) fprintf(stderr,f)
@d errprint1(f,a) fprintf(stderr,f,a)
@d errprint2(f,a,b) fprintf(stderr,f,a,b)
@d panic(x)@+ {@+errprint0("Panic: ");@+x;@+errprint0("!\n");@+expire();@+}
@d confusion(m) errprint1("This can't happen: %s",m)
@y
@d panic(x)@+ {@+errprint("Panic: ");@+x;@+errprint("!\n");@+expire();@+}
@d confusion(m) errprint("This can't happen: %s",m)
@z

@x [13] l.279 C99 prototypes for C2x.
static void expire @,@,@[ARGS((void))@];

@ @<Sub...@>=
static void expire() /* the last gasp before dying */
@y
static void errprint(const char*, ...);
static void expire(void);

@ @<Sub...@>=
static void errprint(const char *fmt, ...)
{
  va_list ap;
  va_start(ap, fmt);
  (void) vfprintf(stderr, fmt, ap);
  va_end(ap);
}
@#
static void expire(void) /* the last gasp before dying */
@z

@x [14] l.284
  if (ticks.h) errprint2("(Clock time is %dH+%d.)\n",ticks.h,ticks.l);
  else errprint1("(Clock time is %d.)\n",ticks.l);
@y
  if (ticks.h) errprint("(Clock time is %dH+%d.)\n",ticks.h,ticks.l);
  else errprint("(Clock time is %d.)\n",ticks.l);
@z

@x [17] l.326 Stuff from MMIX-ARITH.
for the assembler and for the non-pipelined simulator. The
definition of type \&{tetra} should be changed, if necessary, to conform with
the definitions found there.
@^system dependencies@>

@<Type...@>=
typedef unsigned int tetra;
  /* for systems conforming to the LP-64 data model */
typedef struct { tetra h,l;} octa; /* two tetrabytes make one octabyte */
@y
for the assembler and for the non-pipelined simulator.
@s uint32_t int
@s byte int
@s tetra int
@s octa int
@z

@x [18] l.336 Move 'print_octa' to MMIX-ARITH.
@ @<Internal proto...@>=
static void print_octa @,@,@[ARGS((octa))@];

@ @<Sub...@>=
static void print_octa(o)
  octa o;
{
  if (o.h) printf("%x%08x",o.h,o.l);@+
  else printf("%x",o.l);
}
@y
@ @<External proto...@>=
Extern octa read_hex(char *);
  /* see {\mc MMMIX} */

@ Here's a simple program to read an octabyte in hexadecimal notation
from a buffer. It changes the buffer by storing a null character
after the input.
@^radix conversion@>

@d BUF_SIZE 100

@<External routines@>=
octa read_hex(
  char *p)
{
  unsigned char d[BUF_SIZE];
  register int j,k;
  octa val=zero_octa;
  for (j=0;;j++) {
    if (p[j]>='0' && p[j]<='9') d[j]=p[j]-'0';
    else if (p[j]>='a' && p[j]<='f') d[j]=p[j]-'a'+10;
    else if (p[j]>='A' && p[j]<='F') d[j]=p[j]-'A'+10;
    else break;
  }
  p[j]='\0';
  for (j--,k=0;k<=j;k++) {
    if (k>=8) val.h+=d[j-k]<<(4*k-32);
    else val.l+=d[j-k]<<(4*k);
  }
  return val;
}
@z

@x [20] l.347 Stuff from MMIX-ARITH.
@ @<Glob...@>=
extern octa zero_octa; /* |zero_octa.h=zero_octa.l=0| */
extern octa neg_one; /* |neg_one.h=neg_one.l=-1| */
extern octa aux; /* auxiliary output of a subroutine */
extern bool overflow; /* set by certain subroutines for signed arithmetic */
extern int exceptions; /* bits set by floating point operations */
extern int cur_round; /* the current rounding mode */
@y
@ @<Initialize...@>=
  register int j; /* scratch variable */
@z

@x [21] l.361 Stuff from MMIX-ARITH.
@<Sub...@>=
extern octa oplus @,@,@[ARGS((octa y,octa z))@];
  /* unsigned $y+z$ */
extern octa ominus @,@,@[ARGS((octa y,octa z))@];
  /* unsigned $y-z$ */
extern octa incr @,@,@[ARGS((octa y,int delta))@];
  /* unsigned $y+\delta$ ($\delta$ is signed) */
extern octa oand @,@,@[ARGS((octa y,octa z))@];
  /* $y\land z$ */
extern octa oandn @,@,@[ARGS((octa y,octa z))@];
  /* $y\land \bar z$ */
extern octa shift_left @,@,@[ARGS((octa y,int s))@];
  /* $y\LL s$, $0\le s\le64$ */
extern octa shift_right @,@,@[ARGS((octa y,int s,int u))@];
  /* $y\GG s$, signed if |!u| */
extern octa omult @,@,@[ARGS((octa y,octa z))@];
  /* unsigned $(|aux|,x)=y\times z$ */
extern octa signed_omult @,@,@[ARGS((octa y,octa z))@];
  /* signed $x=y\times z$, setting |overflow| */
extern octa odiv @,@,@[ARGS((octa x,octa y,octa z))@];
  /* unsigned $(x,y)/z$; $|aux|=(x,y)\bmod z$ */
extern octa signed_odiv @,@,@[ARGS((octa y,octa z))@];
  /* signed $y/z$, when $z\ne0$; $|aux|=y\bmod z$ */
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
@y
@z

@x [22] l.421
  panic(errprint0("Incorrect implementation of type tetra"));
@y
  panic(errprint("Incorrect implementation of type tetra"));
@z

@x [24] l.459 C99 prototypes for C2x.
static void print_coroutine_id @,@,@[ARGS((coroutine*))@];
static void errprint_coroutine_id @,@,@[ARGS((coroutine*))@];

@ @<Sub...@>=
static void print_coroutine_id(c)
  coroutine *c;
@y
static void print_coroutine_id(coroutine*);
static void errprint_coroutine_id(coroutine*);

@ @<Sub...@>=
static void print_coroutine_id(
  coroutine *c)
@z

@x [25] l.470 C99 prototypes for C2x.
static void errprint_coroutine_id(c)
  coroutine *c;
@y
static void errprint_coroutine_id(
  coroutine *c)
@z

@x [25] l.473
  if (c) errprint2("%s:%d",c->name,c->stage);
  else errprint0("??");
@y
  if (c) errprint("%s:%d",c->name,c->stage);
  else errprint("??");
@z

@x [26] l.496
@<Initialize e...@>=
{@+register coroutine *p;
  for (p=ring;p<ring+ring_size;p++) p->next=p;
}
@y
@<Initialize e...@>=@+
  for (coroutine* p=ring;p<ring+ring_size;p++) p->next=p;
@z

@x [27] l.507 C99 prototypes for C2x.
static void schedule @,@,@[ARGS((coroutine*,int,int))@];

@ @<Sub...@>=
static void schedule(c,d,s)
  coroutine *c;
  int d,s;
@y
static void schedule(coroutine*,int,int);

@ @<Sub...@>=
static void schedule(
  coroutine *c,
  int d, int s)
@z

@x [28] l.517
   panic(confusion("Scheduling ");errprint_coroutine_id(c);
         errprint1(" with delay %d",d));
@y
   panic(confusion("Scheduling ");errprint_coroutine_id(c);
         errprint(" with delay %d",d));
@z

@x [30] l.540 C99 prototypes for C2x.
static void startup @,@,@[ARGS((coroutine*,int))@];

@ @<Sub...@>=
static void startup(c,d)
  coroutine *c;
  int d;
@y
static void startup(coroutine*,int);

@ @<Sub...@>=
static void startup(
  coroutine *c,
  int d)
@z

@x [32] l.560 C99 prototypes for C2x.
static void unschedule @,@,@[ARGS((coroutine*))@];

@ @<Sub...@>=
static void unschedule(c)
  coroutine *c;
@y
static void unschedule(coroutine*);

@ @<Sub...@>=
static void unschedule(
  coroutine *c)
@z

@x [34] l.583 C99 prototypes for C2x.
static coroutine *queuelist @,@,@[ARGS((int))@];

@ @<Sub...@>=
static coroutine* queuelist(t)
  int t;
@y
static coroutine *queuelist(int);

@ @<Sub...@>=
static coroutine* queuelist(
  int t)
@z

@x [36] l.600
coroutine sentinel; /* dummy coroutine at origin of circular list */
@y
static coroutine sentinel; /* dummy coroutine at origin of circular list */
@z

@x [38] l.623 C99 prototypes for C2x.
Extern void print_locks @,@,@[ARGS((void))@];

@ @<External r...@>=
void print_locks()
@y
Extern void print_locks(void);

@ @<External r...@>=
void print_locks(void)
@z

@x [41] l.676
spec zero_spec; /* |zero_spec.o.h=zero_spec.o.l=0| and |zero_spec.p=NULL| */
@y
static spec zero_spec; /* |zero_spec.o.h=zero_spec.o.l=0| and |zero_spec.p=NULL| */
@z

@x [42] l.679 C99 prototypes for C2x.
static void print_spec @,@,@[ARGS((spec))@];

@ @<Sub...@>=
static void print_spec(s)
  spec s;
@y
static void print_spec(spec);
static void print_specnode(specnode);

@ @<Sub...@>=
static void print_spec(
  spec s)
@z

@x [43] l.691 C99 prototypes for C2x.
static void print_specnode(s)
  specnode s;
@y
static void print_specnode(
  specnode s)
@z

@x [45] l.772 C99 prototypes for C2x.
static void print_control_block @,@,@[ARGS((control*))@];

@ @<Sub...@>=
static void print_control_block(c)
  control *c;
@y
static void print_control_block(control*);

@ @<Sub...@>=
static void print_control_block(
  control *c)
@z

@x [48] l.851
char *opcode_name[]={@|
@y
static char *opcode_name[]={@|
@z

@x [50] l.992
char *internal_op_name[]={
@y
static char *internal_op_name[]={
@z

@x [51] l.1088
internal_opcode internal_op[256]={@|
@y
static internal_opcode internal_op[256]={@|
@z

@x [52] l.1129 Change from MMIX home.
\.{UNSAVE} commands store and restore special registers 0--6 and 23--27,
followed by rG~(19) and rA~(21) packed into eight bytes.
@y
\.{UNSAVE} commands store and restore special registers 0--6 and 23--27,
followed by~19 and~21.
@z

@x [53] l.1167
char *special_name[32]={"rB","rD","rE","rH","rJ","rM","rR","rBB",
@y
static char *special_name[32]={"rB","rD","rE","rH","rJ","rM","rR","rBB",
@z

@x [54] l.1196
char bit_code_map[]="EFHDVWIOUZXrwxnkbsp";
@y
static char bit_code_map[]="EFHDVWIOUZXrwxnkbsp";
@z

@x [55] l.1199 C99 prototypes for C2x.
static void print_bits @,@,@[ARGS((int))@];

@ @<Subr...@>=
static void print_bits(x)
  int x;
@y
static void print_bits(int);

@ @<Subr...@>=
static void print_bits(
  int x)
@z

@x [56] l.1205
  register int b,j;
  for (j=0,b=E_BIT;(x&(b+b-1))&&b;j++,b>>=1)
@y
  for (int j=0,b=E_BIT;(x&(b+b-1))&&b;j++,b>>=1)
@z

@x [57] l.1211 Don't expose unnecessary items.
Most of them are implementation-dependent, but a few are defined in general.

@<Header def...@>=
#define POWER_FAILURE (1<<0) /* try to shut down calmly and quickly */
#define PARITY_ERROR (1<<1) /* try to save the file systems */
#define NONEXISTENT_MEMORY (1<<2) /* a memory address can't be used */
#define REBOOT_SIGNAL (1<<4) /* it's time to start over */
#define INTERVAL_TIMEOUT (1<<6) /* the timer register, rI, has reached zero */
#define STACK_OVERFLOW (1<<7) /* data has been stored on the rC page */
@y
Most of them are implementation-dependent, but a few are defined in general.

@d POWER_FAILURE (1<<0) /* try to shut down calmly and quickly */
@d PARITY_ERROR (1<<1) /* try to save the file systems */
@d NONEXISTENT_MEMORY (1<<2) /* a memory address can't be used */
@d REBOOT_SIGNAL (1<<4) /* it's time to start over */
@d INTERVAL_TIMEOUT (1<<6) /* the timer register, rI, has reached zero */
@d STACK_OVERFLOW (1<<7) /* data has been stored on the rC page */
@z

@x [62] l.1423 C99 prototypes for C2x.
static void print_reorder_buffer @,@,@[ARGS((void))@];

@ @<Sub...@>=
static void print_reorder_buffer()
@y
static void print_reorder_buffer(void);

@ @<Sub...@>=
static void print_reorder_buffer(void)
@z

@x [63] l.1430
  else {@+register control *p;
@y
  else {
@z

@x [63] l.1434
    for (p=hot;p!=cool; p=(p==reorder_bot? reorder_top: p-1)) {
@y
    for (control* p=hot;p!=cool; p=(p==reorder_bot? reorder_top: p-1)) {
@z

@x [64] l.1451
  @<Check for external interrupt@>;
@y
  @<Check for \9{e}external interrupt@>;
@z

@x [65] l.1465
int dispatch_count; /* how many dispatched on this cycle */
bool suppress_dispatch; /* should dispatching be bypassed? */
int doing_interrupt; /* how many cycles of interrupt preparations remain */
lockvar dispatch_lock; /* lock to prevent instruction issues */
@y
static int dispatch_count; /* how many dispatched on this cycle */
static bool suppress_dispatch; /* should dispatching be bypassed? */
static int doing_interrupt; /* how many cycles of interrupt preparations remain */
static lockvar dispatch_lock; /* lock to prevent instruction issues */
@z

@x [67] l.1477
  for (m=commit_max;m>0 && deissues>0; m--)
@y
  register int m;
  for (m=commit_max;m>0 && deissues>0; m--)
@z

@x [70] l.1539
fetch *old_tail; /* rear of the fetch buffer available on the current cycle */
@y
static fetch *old_tail; /* rear of the fetch buffer available on the current cycle */
@z

@x [72] l.1548 C99 prototypes for C2x.
static void print_fetch_buffer @,@,@[ARGS((void))@];

@ @<Sub...@>=
static void print_fetch_buffer()
@y
static void print_fetch_buffer(void);

@ @<Sub...@>=
static void print_fetch_buffer(void)
@z

@x [73] l.1555
  else {@+register fetch *p;
@y
  else {
@z

@x [73] l.1558
    for (p=head;p!=tail; p=(p==fetch_bot? fetch_top: p-1)) {
@y
    for (fetch* p=head;p!=tail; p=(p==fetch_bot? fetch_top: p-1)) {
@z

@x [75] l.1620 Improved typography.
  if (head==fetch_bot) new_head=fetch_top;@+else new_head=head-1;
@y
  new_head=head==fetch_bot?fetch_top:head-1;
@z

@x [75] l.1630 Improved typography.
  if (cool==reorder_bot) new_cool=reorder_top;@+else new_cool=cool-1;
@y
  new_cool=cool==reorder_bot?reorder_top:cool-1;
@z

@x [78] l.1667
control *new_cool; /* the reorder position following |cool| */
int resuming; /* set nonzero if resuming an interrupted instruction */
tetra support[8]; /* big-endian bitmap for all opcodes supported */
@y
static control *new_cool; /* the reorder position following |cool| */
static int resuming; /* set nonzero if resuming an interrupted instruction */
static tetra support[8]; /* big-endian bitmap for all opcodes supported */
@z

@x [79] l.1672
{@+register func *u;
  for (u=funit;u<=funit+funit_count;u++)
    for (i=0;i<8;i++) support[i] |= u->ops[i];
}
@y
for (func* u=funit;u<=funit+funit_count;u++)
  for (int i=0;i<8;i++) support[i] |= u->ops[i];
@z

@x [80] l.1677
@ @d sign_bit ((unsigned)0x80000000)

@<Determine the flags, |f|, and the internal opcode, |i|@>=
@y
@ @<Determine the flags, |f|, and the internal opcode, |i|@>=
@z

@x [83] l.1745
unsigned char flags[256]={@|@t\1\1@>
@y
static unsigned char flags[256]={@|@t\1\1@>
@z

@x [88] l.1857
int lring_mask; /* for calculations modulo |lring_size| */
@y
static int lring_mask; /* for calculations modulo |lring_size| */
@z

@x [89] l.1865 Different approach for ABSTIME.
(The macro \.{ABSTIME} is defined externally in the file \.{abstime.h},
which should have just been created by {\mc ABSTIME}\kern.05em;
{\mc ABSTIME} is
a trivial program that computes the value of the standard library function
|time(NULL)|. We assume that this number, which is the number of seconds in
@y
(The macro \.{ABSTIME} will be set to a numeric value at compilation-time in
\.{Makefile}. We assume that this number, which is the number of seconds in
@z

@x [89] l.1874 Different approach for ABSTIME.
@d VERSION 1 /* version of the \MMIX\ architecture that we support */
@y
@d ABSTIME /* number of seconds in ``the epoch'' */
@d VERSION 1 /* version of the \MMIX\ architecture that we support */
@z

@x [89] l.1876 Change from MMIX home.
@d SUBSUBVERSION 0 /* further qualification to version number */
@y
@d SUBSUBVERSION 2 /* further qualification to version number */
@z

@x [89] l.1883 Compound literal.
  g[j].addr.h=sign_bit, g[j].addr.l=j, g[j].known=true;
@y
  g[j].addr=(octa){sign_bit, j}, g[j].known=true;
@z

@x [89] l.1887 Compound literal.
g[rN].o.h=(VERSION<<24)+(SUBVERSION<<16)+(SUBSUBVERSION<<8);
g[rN].o.l=ABSTIME; /* see comment and warning above */
@y
g[rN].o=(octa){(VERSION<<24)+(SUBVERSION<<16)+(SUBSUBVERSION<<8),@|
  ABSTIME}; /* see comment and warning above */
@z

@x [89] l.1890 Compound literal.
  l[j].addr.h=sign_bit, l[j].addr.l=256+j, l[j].known=true;
@y
  l[j].addr=(octa){sign_bit, 256+j}, l[j].known=true;
@z

@x [90] l.1895 C99 prototypes for C2x.
static void print_specnode_id @,@,@[ARGS((octa))@];

@ @<Sub...@>=
static void print_specnode_id(a)
  octa a;
@y
static void print_specnode_id(octa);

@ @<Sub...@>=
static void print_specnode_id(
  octa a)
@z

@x [91] l.1902 Change from MMIX home.
    if (a.l<32) printf(special_name[a.l]);
@y
    if (a.l<32) printf("%s",special_name[a.l]);
@z

@x [92] l.1914 C99 prototypes for C2x.
static spec specval @,@,@[ARGS((specnode*))@];

@ @<Sub...@>=
static spec specval(r)
  specnode *r;
@y
static spec specval(specnode*);

@ @<Sub...@>=
static spec specval(
  specnode *r)
@z

@x [94] l.1929 C99 prototypes for C2x.
static void spec_install @,@,@[ARGS((specnode*,specnode*))@];

@ @<Sub...@>=
static void spec_install(r,t) /* insert |t| into list |r| */
  specnode *r,*t;
@y
static void spec_install(specnode*,specnode*);

@ @<Sub...@>=
static void spec_install( /* insert |t| into list |r| */
  specnode *r, specnode *t)
@z

@x [96] l.1945 C99 prototypes for C2x.
static void spec_rem @,@,@[ARGS((specnode*))@];

@ @<Sub...@>=
static void spec_rem(t) /* remove |t| from its list */
  specnode *t;
@y
static void spec_rem(specnode*);

@ @<Sub...@>=
static void spec_rem( /* remove |t| from its list */
  specnode *t)
@z

@x [99] l.1975
int cool_L,cool_G; /* values of rL and rG before the |cool| instruction */
unsigned int cool_hist,peek_hist; /* history bits for branch prediction */
octa new_O,new_S; /* values of rO, rS after |cool| */
@y
static int cool_L,cool_G; /* values of rL and rG before the |cool| instruction */
static unsigned int cool_hist,peek_hist; /* history bits for branch prediction */
static octa new_O,new_S; /* values of rO, rS after |cool| */
@z

@x [101] l.2009 Improved typography.
@<Special cases of instruction dispatch@>@;
@y
@/@t\4@>@<Special cases of instruction dispatch@>@;
@z

@x [103] l.2028
  if (f&0x10) @<Set |cool->b| from register X@>@;
@y
  if (f&0x10) @<Set \9{c}|cool->b| from register X@>@;
@z
@x [103] l.2030
    @<Set |cool->b| and/or |cool->ra| from special register@>;
@y
    @<Set \9{c}|cool->b| and/or |cool->ra| from special register@>;
@z
@x [103] l.2032
  else if (f&0x2) @<Set |cool->z| from register Z@>@;
  else if ((op&0xf0)==0xe0) @<Set |cool->z| as an immediate wyde@>;
@y
  else if (f&0x2) @<Set \9{c}|cool->z| from register Z@>@;
  else if ((op&0xf0)==0xe0) @<Set \9{c}|cool->z| as an immediate wyde@>;
@z
@x [103] l.2035
  else if (f&0x8) @<Set |cool->y| from register Y@>@;
@y
  else if (f&0x8) @<Set \9{c}|cool->y| from register Y@>@;
@z

@x [104] l.2038
@ @<Set |cool->z| from register Z@>=
@y
@ @<Set \9{c}|cool->z| from register Z@>=
@z

@x [105] l.2044
@ @<Set |cool->y| from register Y@>=
@y
@ @<Set \9{c}|cool->y| from register Y@>=
@z

@x [106] l.2050
@ @<Set |cool->b| from register X@>=
@y
@ @<Set \9{c}|cool->b| from register X@>=
@z

@x [107] l.2062
unsigned char third_operand[256]={@|@t\1\1@>
@y
static unsigned char third_operand[256]={@|@t\1\1@>
@z

@x [108] l.2099
@<Set |cool->b| and/or |cool->ra| from special register@>=
@y
@<Set \9{c}|cool->b| and/or |cool->ra| from special register@>=
@z

@x [109] l.2107
@ @<Set |cool->z| as an immediate wyde@>=
@y
@ @<Set \9{c}|cool->z| as an immediate wyde@>=
@z

@x [110] l.2129
      @<Insert an instruction to advance gamma@>@;
    else @<Insert an instruction to advance beta and L@>;
@y
      @<Insert \9{a}an instruction to advance gamma@>@;
    else @<Insert \9{a}an instruction to advance beta and L@>;
@z

@x [111] l.2135 Change from MMIX home.
if (rename_regs<cool->ren_x+cool->ren_a) goto stall;
if (cool->mem_x)
  if (mem_slots) mem_slots--;@+else goto stall;
rename_regs-=cool->ren_x+cool->ren_a;
@y
if (rename_regs<(cool->ren_x?1:0)+(cool->ren_a?1:0)) goto stall;
if (cool->mem_x)
  { if (mem_slots) mem_slots--;@+else goto stall; }
rename_regs-=(cool->ren_x?1:0)+(cool->ren_a?1:0);
@z

@x [112] l.2144
@<Insert an instruction to advance beta and L@>=
@y
@<Insert \9{a}an instruction to advance beta and L@>=
@z

@x [113] l.2162
@<Insert an instruction to advance gamma@>=
@y
@<Insert \9{a}an instruction to advance gamma@>=
@z

@x [114] l.2181
@<Insert an instruction to decrease gamma@>=
@y
@<Insert \9{a}an instruction to decrease gamma@>=
@z

@x [116] l.2222 Compound literal.
mem.addr.h=mem.addr.l=-1;
@y
mem.addr=neg_one;
@z

@x [119] l.2274
      @<Insert an instruction to advance gamma@>@;
@y
      @<Insert \9{a}an instruction to advance gamma@>@;
@z

@x [119] l.2278 Compound literal.
  cool->x.known=true, cool->x.o.h=0, cool->x.o.l=x;
@y
  cool->x.known=true, cool->x.o=(octa){0, x};
@z

@x [120] l.2300
    @<Insert an instruction to decrease gamma@>;
@y
    @<Insert \9{a}an instruction to decrease gamma@>;
@z

@x [120] l.2305
      @<Insert an instruction to decrease gamma@>;
@y
      @<Insert \9{a}an instruction to decrease gamma@>;
@z

@x [120] l.2306 Change from MMIX home.
    new_O=incr(cool_O,-x-1);
@y
    new_O=incr(cool_O,-(int)x-1);
@z

@x [120] l.2310 Change from MMIX home.
    if (x<new_L)
@y
    if (x<(unsigned int)new_L)
@z

@x [125] l.2404
@d awaken(c,t)  schedule(c,t,c->ctl->state)
@y
@d awaken(c,t)  schedule(c,t,c->ctl->state)
@s cacheblock int
@z
@x [125] l.2415
  switch(self->stage) {
@y
  switch(self->stage) {
@+ register cacheblock *p,*q;
@+ @t}\6\4{@>
@z

@x [127] l.2432
coroutine mem_locker; /* trivial coroutine that vanishes */
coroutine Dlocker; /* another */
control vanish_ctl; /* such coroutines share a common control block */
@y
static coroutine mem_locker; /* trivial coroutine that vanishes */
static coroutine Dlocker; /* another */
static control vanish_ctl; /* such coroutines share a common control block */
@z

@x [130] l.2469
 case 0: @<Wait for input data if necessary; set |state=1| if it's there@>;
@y
 case 0: @<Wait\9{1} for input data if necessary; set |state=1| if it's there@>;
@z
@x [130] l.2473 Improved typography.
  @<Special cases for states in the first stage@>;
@y
  @/@t\4@>@<Special cases for states in the first stage@>;
@z

@x [131] l.2480
@<Wait for input data if necessary; set |state=1| if it's there@>=
@y
@<Wait\9{1} for input data if necessary; set |state=1| if it's there@>=
@z

@x [132] l.2517 Improved typography.
  @<Cases to compute the results of register-to-register operation@>;
  @<Cases to compute the virtual address of a memory operation@>;
  @<Cases for stage 1 execution@>;
@y
  @/@t\4@>@<Cases to compute the results of register-to-register operation@>;
  @/@t\4@>@<Cases to compute the virtual address of a memory operation@>;
  @/@t\4@>@<Cases for stage 1 execution@>;
  default:@+;
@z

@x [135] l.2572 Improved typography.
  @<Special cases for states in later stages@>;
@y
  @/@t\4@>@<Special cases for states in later stages@>;
@z

@x [138] l.2597 'oxor' was never used before.
case or: data->x.o.h=data->y.o.h | data->z.o.h;
   data->x.o.l=data->y.o.l | data->z.o.l; break;
case orn: data->x.o.h=data->y.o.h |~data->z.o.h;
   data->x.o.l=data->y.o.l |~data->z.o.l; break;
case nor: data->x.o.h=~(data->y.o.h | data->z.o.h);
   data->x.o.l=~(data->y.o.l | data->z.o.l); break;
case and: data->x.o.h=data->y.o.h & data->z.o.h;
   data->x.o.l=data->y.o.l & data->z.o.l; break;
case andn: data->x.o.h=data->y.o.h &~data->z.o.h;
   data->x.o.l=data->y.o.l &~data->z.o.l; break;
case nand: data->x.o.h=~(data->y.o.h & data->z.o.h);
   data->x.o.l=~(data->y.o.l & data->z.o.l); break;
case xor: data->x.o.h=data->y.o.h ^ data->z.o.h;
   data->x.o.l=data->y.o.l ^ data->z.o.l; break;
case nxor: data->x.o.h=data->y.o.h ^~data->z.o.h;
   data->x.o.l=data->y.o.l ^~data->z.o.l; break;
@y
case or: data->x.o=oor(data->y.o, data->z.o); @+ break;
case orn: data->x.o=oorn(data->y.o, data->z.o); @+ break;
case nor: data->x.o=onor(data->y.o, data->z.o); @+ break;
case and: data->x.o=oand(data->y.o, data->z.o); @+ break;
case andn: data->x.o=oandn(data->y.o, data->z.o); @+ break;
case nand: data->x.o=onand(data->y.o, data->z.o); @+ break;
case xor: data->x.o=oxor(data->y.o, data->z.o); @+ break;
case nxor: data->x.o=onxor(data->y.o, data->z.o); @+ break;
@z

@x [141] l.2654 Issue #16.
 {@+octa tmpo;
    tmpo=shift_right(data->x.o,shift_amt,0);
@y
 {@+octa tmpo=shift_right(data->x.o,shift_amt,false);
@z

@x [141] l.2658 Issue #16.
case shru: data->x.o=shift_right(data->y.o,shift_amt,1);@+data->i=sh;@+ break;
case shr:  data->x.o=shift_right(data->y.o,shift_amt,0);@+data->i=sh;@+ break;
@y
case shru: data->x.o=shift_right(data->y.o,shift_amt,true);@+data->i=sh;@+ break;
case shr:  data->x.o=shift_right(data->y.o,shift_amt,false);@+data->i=sh;@+ break;
@z

@x [142] l.2666 Compound literal.
case mux: data->x.o.h=(data->y.o.h&data->b.o.h)+(data->z.o.h&~data->b.o.h);
          data->x.o.l=(data->y.o.l&data->b.o.l)+(data->z.o.l&~data->b.o.l);
@y
case mux: data->x.o=oor(oand(data->y.o, data->b.o),
                        oandn(data->z.o, data->b.o));
@z

@x [146] l.2746
      hot->x.o.h |= new_Q.h, hot->x.o.l |= new_Q.l;
@y
      hot->x.o = oor(hot->x.o,new_Q);
@z

@x [148] l.2797
octa new_Q; /* when rQ increases in any bit position, so should this */
bool stack_overflow; /* stack overflow not yet reported */
@y
static octa new_Q; /* when rQ increases in any bit position, so should this */
static bool stack_overflow; /* stack overflow not yet reported */
@z

@x [151] l.2886
  if (bp_table) {@+register int h;
@y
  if (bp_table) {@+register int m;
@z
@x [151] l.2889
    h=bp_table[m];
    if (h&bp_npower) predicted^=0x10;
@y
    if (bp_table[m]&bp_npower) predicted^=0x10;
@z

@x [152] l.2901
if (bp_table) {@+register int reversed,h,h_up,h_down;
@y
if (bp_table) {@+register int reversed,h,h_up,h_down,m;
@z

@x [154] l.2936
int bp_amask,bp_cmask,bp_bcmask,bp_nmask,bp_npower;
int bp_rev_stat,bp_ok_stat; /* how often we overrode and agreed */
int bp_bad_stat,bp_good_stat; /* how often we failed and succeeded */
@y
static int bp_amask,bp_cmask,bp_bcmask,bp_nmask,bp_npower;
static int bp_rev_stat,bp_ok_stat; /* how often we overrode and agreed */
static int bp_bad_stat,bp_good_stat; /* how often we failed and succeeded */
@z

@x [156] l.2960 C99 prototypes for C2x.
static int register_truth @,@,@[ARGS((octa,mmix_opcode))@];

@ @<Sub...@>=
static int register_truth(o,op)
  octa o;
  mmix_opcode op;
@y
static int register_truth(octa,mmix_opcode);

@ @<Sub...@>=
static int register_truth(
  octa o,
  mmix_opcode op)
@z

@x [157] l.2968 Change from MMIX home.
 case 0: b=o.h>>31;@+break; /* negative? */
@y
 default: case 0: b=o.h>>31;@+break; /* negative? */
@z

@x [158] l.2982 C99 prototypes for C2x.
static int issued_between @,@,@[ARGS((control*,control*))@];

@ @<Sub...@>=
static int issued_between(c,cc)
  control *c,*cc;
@y
static int issued_between(control*,control*);

@ @<Sub...@>=
static int issued_between(
  control *c, control *cc)
@z

@x [161] l.3027 C99 prototypes for C2x.
Extern void print_stats @,@,@[ARGS((void))@];

@ @<External r...@>=
void print_stats()
@y
Extern void print_stats(void);

@ @<External r...@>=
void print_stats(void)
@z

@x [162] l.3032
  register int j;
@y
@z

@x [162] l.3038
  for (j=0;j<=dispatch_max;j++)
@y
  for (int j=0;j<=dispatch_max;j++)
@z

@x [169] l.3223 C99 prototypes for C2x.
static bool is_dirty @,@,@[ARGS((cache*,cacheblock*))@];

@ @<Sub...@>=
static bool is_dirty(c,p)
  cache *c; /* the cache containing it */
  cacheblock *p; /* a cache block */
@y
static bool is_dirty(cache*,cacheblock*);

@ @<Sub...@>=
static bool is_dirty(
  cache *c, /* the cache containing it */
  cacheblock *p) /* a cache block */
@z

@x [170] l.3230
  register int j;
@y
@z

@x [170] l.3232
  for (j=0;j<c->bb;d++,j+=c->gg) if (*d) return true;
@y
  for (int j=0;j<c->bb;d++,j+=c->gg) if (*d) return true;
@z

@x [171] l.3239 C99 prototypes for C2x.
static void print_cache_block @,@,@[ARGS((cacheblock,cache*))@];

@ @<Sub...@>=
static void print_cache_block(p,c)
  cacheblock p;
  cache *c;
@y
static void print_cache_block(cacheblock,cache*);

@ @<Sub...@>=
static void print_cache_block(
  cacheblock p,
  cache *c)
@z

@x [172] l.3245
{@+register int i,j,b=c->bb>>3,g=c->gg>>3;
@y
{@+register int b=c->bb>>3,g=c->gg>>3;
@z

@x [172] l.3247
  for (i=j=0; j<b;j++,i+=((j&(g-1))?0:1))
@y
  for (int i=0, j=0; j<b;j++,i+=((j&(g-1))?0:1))
@z

@x [173] l.3253 C99 prototypes for C2x.
static void print_cache_locks @,@,@[ARGS((cache*))@];

@ @<Sub...@>=
static void print_cache_locks(c)
  cache *c;
@y
static void print_cache_locks(cache*);

@ @<Sub...@>=
static void print_cache_locks(
  cache *c)
@z

@x [175] l.3273 C99 prototypes for C2x.
Extern void print_cache @,@,@[ARGS((cache*,bool))@];

@ @<External r...@>=
void print_cache(c,dirty_only)
  cache *c;
  bool dirty_only;
@y
Extern void print_cache(cache*,bool);

@ @<External r...@>=
void print_cache(
  cache *c,
  bool dirty_only)
@z

@x [178] l.3317 C99 prototypes for C2x.
Extern void clean_block @,@,@[ARGS((cache*,cacheblock*))@];

@ @<External r...@>=
void clean_block(c,p)
  cache *c;
  cacheblock *p;
@y
Extern void clean_block(cache*,cacheblock*);

@ @<External r...@>=
void clean_block(
  cache *c,
  cacheblock *p)
@z

@x [179] l.3325 Compound literal.
  p->tag.h=sign_bit, p->tag.l=0;
@y
  p->tag=(octa){sign_bit, 0};
@z

@x [180] l.3334 C99 prototypes for C2x.
Extern void zap_cache @,@,@[ARGS((cache*))@];
@y
Extern void zap_cache(cache*);
@z

@x [181] l.3340 C99 prototypes for C2x.
void zap_cache(c)
  cache *c;
@y
void zap_cache(
  cache *c)
@z

@x [182] l.3357 C99 prototypes for C2x.
static int get_reader @,@,@[ARGS((cache*))@];

@ @<Sub...@>=
static int get_reader(c)
  cache *c;
@y
static int get_reader(cache*);

@ @<Sub...@>=
static int get_reader(
  cache *c)
@z

@x [183] l.3362
{@+ register int j;
  for (j=0;j<c->ports;j++)
@y
{
  for (int j=0;j<c->ports;j++)
@z

@x [184] l.3375 C99 prototypes for C2x.
static void copy_block @,@,@[ARGS((cache*,cacheblock*,cache*,cacheblock*))@];

@ @<Sub...@>=
static void copy_block(c,p,cc,pp)
  cache *c,*cc;
  cacheblock *p,*pp;
@y
static void copy_block(cache*,cacheblock*,cache*,cacheblock*);

@ @<Sub...@>=
static void copy_block(
  cache *c, cacheblock *p,
  cache *cc, cacheblock *pp)
@z

@x [185] l.3382
  register int j,jj,i,ii,lim; register int off=p->tag.l&(cc->bb-1);
@y
  register int off=p->tag.l&(cc->bb-1);
@z

@x [185] l.3385
  for (j=0,jj=off>>c->g;j<c->bb>>c->g;j++,jj++) if (p->dirty[j]) {
@y
  for (int j=0,jj=off>>c->g;j<c->bb>>c->g;j++,jj++) if (p->dirty[j]) {
@z

@x [185] l.3387
    for (i=j<<(c->g-3),ii=jj<<(c->g-3),lim=(j+1)<<(c->g-3);
@y
    for (int i=j<<(c->g-3),ii=jj<<(c->g-3),lim=(j+1)<<(c->g-3);
@z

@x [186] l.3401 C99 prototypes for C2x.
static cacheblock* choose_victim @,@,@[ARGS((cacheset,int,replace_policy))@];

@ @<Sub...@>=
static cacheblock* choose_victim(s,aa,policy)
  cacheset s;
  int aa; /* setsize */
  replace_policy policy;
@y
static cacheblock* choose_victim(cacheset,int,replace_policy);

@ @<Sub...@>=
static cacheblock* choose_victim(
  cacheset s,
  int aa, /* setsize */
  replace_policy policy)
@z

@x [187] l.3409
  register cacheblock *p;
@y
@z

@x [187] l.3414
 case lru: for (p=s;p<s+aa;p++)
@y
 case lru: for (cacheblock* p=s;p<s+aa;p++)
@z

@x [187] l.3416 Change from MMIX home.
  panic(confusion("lru victim")); /* what happened? nobody has rank zero */
@y
 default:  panic(confusion("lru victim")); /* what happened? nobody has rank zero */
@z

@x [188] l.3426 C99 prototypes for C2x.
static void note_usage @,@,@[ARGS((cacheblock*,cacheset,int,replace_policy))@];

@ @<Sub...@>=
static void note_usage(l,s,aa,policy)
  cacheblock *l; /* a cache block that's probably worth preserving */
  cacheset s; /* the set that contains $l$ */
  int aa; /* setsize */
  replace_policy policy;
@y
static void note_usage(cacheblock*,cacheset,int,replace_policy);

@ @<Sub...@>=
static void note_usage(
  cacheblock *l, /* a cache block that's probably worth preserving */
  cacheset s, /* the set that contains $l$ */
  int aa, /* setsize */
  replace_policy policy)
@z

@x [189] l.3435
  register cacheblock *p;
  register int j,m,r;
@y
  register int r;
@z

@x [189] l.3440
    for (p=s;p<s+aa;p++) if (p->rank>r) p->rank--;
@y
    for (cacheblock* p=s;p<s+aa;p++) if (p->rank>r) p->rank--;
@z

@x [189] l.3444
    for (j=1,m=aa>>1;m;m>>=1)
@y
    for (int j=1,m=aa>>1;m;m>>=1)
@z

@x [190] l.3455 C99 prototypes for C2x.
static void demote_usage @,@,@[ARGS((cacheblock*,cacheset,int,replace_policy))@];

@ @<Sub...@>=
static void demote_usage(l,s,aa,policy)
  cacheblock *l; /* a cache block we probably don't need */
  cacheset s; /* the set that contains $l$ */
  int aa; /* setsize */
  replace_policy policy;
@y
static void demote_usage(cacheblock*,cacheset,int,replace_policy);

@ @<Sub...@>=
static void demote_usage(
  cacheblock *l, /* a cache block we probably don't need */
  cacheset s, /* the set that contains $l$ */
  int aa, /* setsize */
  replace_policy policy)
@z

@x [191] l.3464
  register cacheblock *p;
  register int j,m,r;
@y
  register int r;
@z

@x [191] l.3469
    for (p=s;p<s+aa;p++) if (p->rank<r) p->rank++;
@y
    for (cacheblock* p=s;p<s+aa;p++) if (p->rank<r) p->rank++;
@z

@x [191] l.3473
    for (j=1,m=aa>>1;m;m>>=1)
@y
    for (int j=1,m=aa>>1;m;m>>=1)
@z

@x [192] l.3489 C99 prototypes for C2x.
static cacheblock* cache_search @,@,@[ARGS((cache*,octa))@];

@ @<Sub...@>=
static cacheblock* cache_search(c,alf)
  cache *c; /* the cache to be searched */
  octa alf; /* the key */
@y
static cacheblock* cache_search(cache*,octa);

@ @<Sub...@>=
static cacheblock* cache_search(
  cache *c, /* the cache to be searched */
  octa alf) /* the key */
@z

@x [193] l.3496 RAII.
  register cacheset s;
  register cacheblock* p;
  s=cache_addr(c,alf); /* the set corresponding to |alf| */
@y
  register cacheblock* p;
  register cacheset s=cache_addr(c,alf); /* the set corresponding to |alf| */
@z

@x [194] l.3510
cacheset hit_set;
@y
static cacheset hit_set;
@z

@x [195] l.3519 C99 prototypes for C2x.
static cacheblock* use_and_fix @,@,@[ARGS((cache*,cacheblock*))@];

@ @<Sub...@>=
static cacheblock *use_and_fix(c,p)
  cache *c;
  cacheblock *p;
@y
static cacheblock* use_and_fix(cache*,cacheblock*);

@ @<Sub...@>=
static cacheblock *use_and_fix(
  cache *c,
  cacheblock *p)
@z

@x [198] l.3557 C99 prototypes for C2x.
static cacheblock* demote_and_fix @,@,@[ARGS((cache*,cacheblock*))@];

@ @<Sub...@>=
static cacheblock *demote_and_fix(c,p)
  cache *c;
  cacheblock *p;
@y
static cacheblock* demote_and_fix(cache*,cacheblock*);

@ @<Sub...@>=
static cacheblock *demote_and_fix(
  cache *c,
  cacheblock *p)
@z

@x [200] l.3574 C99 prototypes for C2x.
static void load_cache @,@,@[ARGS((cache*,cacheblock*))@];

@ @<Sub...@>=
static void load_cache(c,p)
  cache *c;
  cacheblock *p;
@y
static void load_cache(cache*,cacheblock*);

@ @<Sub...@>=
static void load_cache(
  cache *c,
  cacheblock *p)
@z

@x [201] l.3581
  register int i;
@y
@z

@x [201] l.3583
  for (i=0;i<c->bb>>c->g;i++) p->dirty[i]=false;
@y
  for (int i=0;i<c->bb>>c->g;i++) p->dirty[i]=false;
@z

@x [202] l.3598 C99 prototypes for C2x.
static void flush_cache @,@,@[ARGS((cache*,cacheblock*,bool))@];

@ @<Sub...@>=
static void flush_cache(c,p,keep)
  cache *c;
  cacheblock *p; /* a block inside cache |c| */
  bool keep; /* should we preserve the data in |p|? */
@y
static void flush_cache(cache*,cacheblock*,bool);

@ @<Sub...@>=
static void flush_cache(
  cache *c,
  cacheblock *p, /* a block inside cache |c| */
  bool keep) /* should we preserve the data in |p|? */
@z

@x [204] l.3644 C99 prototypes for C2x.
static cacheblock* alloc_slot @,@,@[ARGS((cache*,octa))@];

@ @<Sub...@>=
static cacheblock* alloc_slot(c,alf)
  cache *c;
  octa alf; /* key that probably isn't in the cache */
@y
static cacheblock* alloc_slot(cache*,octa);

@ @<Sub...@>=
static cacheblock* alloc_slot(
  cache *c,
  octa alf) /* key that probably isn't in the cache */
@z

@x [208] l.3724 Stuff from MMIX-MEM.
@<Sub...@>=
extern octa spec_read @,@,@[ARGS((octa addr,int size))@];
 /* for memory mapped I/O */
extern void spec_write @,@,@[ARGS((octa addr,octa val,int size))@];
 /* likewise */
@y
@z

@x [209] l.3742 C99 prototypes for C2x.
Extern octa mem_read @,@,@[ARGS((octa addr))@];

@ @<External r...@>=
octa mem_read(addr)
  octa addr;
@y
Extern octa mem_read(octa addr);

@ @<External r...@>=
octa mem_read(
  octa addr)
@z

@x [210] l.3755
        errprint2("uninitialized memory read at %08x%08x",addr.h,addr.l);
@y
        errprint("uninitialized memory read at %08x%08x",addr.h,addr.l);
@z

@x [212] l.3769 C99 prototypes for C2x.
Extern void mem_write @,@,@[ARGS((octa addr,octa val))@];

@ @<External r...@>=
void mem_write(addr,val)
  octa addr,val;
@y
Extern void mem_write(octa addr,octa val);

@ @<External r...@>=
void mem_write(
  octa addr, octa val)
@z

@x [213] l.3782
        panic(errprint1("More than %d memory chunks are needed",
@.More...chunks are needed@>
                 mem_chunks_max));
@y
        panic(errprint("More than %d memory chunks are needed",
@.More...chunks are needed@>
                 mem_chunks_max));
@z

@x [213] l.3787
        panic(errprint1("I can't allocate memory chunk number %d",
@.I can't allocate...@>
                 mem_chunks));
@y
        panic(errprint("I can't allocate memory chunk number %d",
@.I can't allocate...@>
                 mem_chunks));
@z

@x [216] l.3838 RAII.
  register int del=c->gg>>3; /* octabytes per granule */
  octa addr;
  addr=c->outbuf.tag;@+ off=(addr.l&0xffff)>>3;
@y
  register int del=c->gg>>3; /* octabytes per granule */
  octa addr=c->outbuf.tag;@+ off=(addr.l&0xffff)>>3;
@z

@x [217] l.3890
    if (block_diff) @<Copy |Scache->inbuf| to slot |p|@>@;
@y
    if (block_diff) @<Copy \9{s}|Scache->inbuf| to slot |p|@>@;
@z

@x [219] l.3921 Compound literal.
  addr.h=c->outbuf.tag.h;@+ addr.l=c->outbuf.tag.l&-Scache->bb;
@y
  addr=(octa){c->outbuf.tag.h, c->outbuf.tag.l&-Scache->bb};
@z

@x [220] l.3932
@ @<Copy |Scache->inbuf| to slot |p|@>=
@y
@ @<Copy \9{s}|Scache->inbuf| to slot |p|@>=
@z

@x [221] l.3942 Compound literal.
Scache->outbuf.tag.h=c->outbuf.tag.h;
Scache->outbuf.tag.l=c->outbuf.tag.l&(-Scache->bb);
@y
Scache->outbuf.tag=(octa){c->outbuf.tag.h, c->outbuf.tag.l&(-Scache->bb)};
@z

@x [224] l.4031
  case 3: @<Copy data from |p| into |c->inbuf|@>;
@y
  case 3: @<Copy \9{d}data from |p| into |c->inbuf|@>;
@z

@x [226] l.4063
@<Copy data from |p| into |c->inbuf|@>=
@y
@<Copy \9{d}data from |p| into |c->inbuf|@>=
@z

@x [230] l.4124
coroutine clean_co;
control clean_ctl;
lockvar clean_lock;
@y
static coroutine clean_co;
static control clean_ctl;
static lockvar clean_lock;
@z

@x [232] l.4137 Improved typography.
@<Cases 0 through 4, for the D-cache@>;
@<Cases 5 through 9, for the S-cache@>;
@y
@/@t\4@>@<Cases 0 through 4, for the D-cache@>;
@/@t\4@>@<Cases 5 through 9, for the S-cache@>;
@z

@x [233] l.4152 Compound literal.
  data->y.o.h=i, data->y.o.l=j;
@y
  data->y.o=(octa){i, j};
@z

@x [234] l.4199 Compound literal.
  data->y.o.h=i, data->y.o.l=j;
@y
  data->y.o=(octa){i, j};
@z

@x [235] l.4271
control IPTctl[5], DPTctl[5]; /* control blocks for I and D page translation */
coroutine IPTco[10], DPTco[10]; /* each coroutine is a two-stage pipeline */
char *IPTname[5]={"IPT0","IPT1","IPT2","IPT3","IPT4"};
char *DPTname[5]={"DPT0","DPT1","DPT2","DPT3","DPT4"};
@y
static control IPTctl[5], DPTctl[5]; /* control blocks for I and D page translation */
static coroutine IPTco[10], DPTco[10]; /* each coroutine is a two-stage pipeline */
static char *IPTname[5]={"IPT0","IPT1","IPT2","IPT3","IPT4"};
static char *DPTname[5]={"DPT0","DPT1","DPT2","DPT3","DPT4"};
@z

@x [236] l.4292 Move variable here.
DTcache->filler_ctl.ptr_c=(void*)&DPTco[0];
@y
DTcache->filler_ctl.ptr_c=(void*)&DPTco[0];
@#
page_bad=true; /* variable delared below */
@z

@x [238] l.4329 Exported variables.
convenience. Whenever rV changes, we recompute all these variables.

@<Glob...@>=
int page_n; /* the 10-bit |n| field of rV, times 8 */
int page_r; /* the 27-bit |r| field of rV */
int page_s; /* the 8-bit |s| field of rV */
int page_f; /* the 3-bit |f| field of rV */
int page_b[5]; /* the 4-bit |b| fields of rV; |page_b[0]=0| */
octa page_mask; /* the least significant |s| bits */
bool page_bad=true; /* does rV violate the rules? */
@y
convenience. Whenever rV changes, we recompute all these variables.

@<External var...@>=
Extern int page_n; /* the 10-bit |n| field of rV, times 8 */
Extern int page_r; /* the 27-bit |r| field of rV */
Extern int page_s; /* the 8-bit |s| field of rV */
Extern int page_f; /* the 3-bit |f| field of rV */
Extern int page_b[5]; /* the 4-bit |b| fields of rV; |page_b[0]=0| */
Extern octa page_mask; /* the least significant |s| bits */
Extern bool page_bad; /* does rV violate the rules? */
@z

@x [239] l.4341 RAII.
{@+octa rv;
  rv=data->z.o;
@y
{@+octa rv=data->z.o;
@z

@x [239] l.4345 Issue #16.
  rv=shift_right(rv,13,1);
  page_r=rv.l&0x7ffffff;
  rv=shift_right(rv,27,1);
@y
  rv=shift_right(rv,13,true);
  page_r=rv.l&0x7ffffff;
  rv=shift_right(rv,27,true);
@z

@x [239] l.4350 Compound literals.
  else if (page_s<32) page_mask.h=0,page_mask.l=(1<<page_s)-1;
  else page_mask.h=(1<<(page_s-32))-1,page_mask.l=0xffffffff;
@y
  else if (page_s<32) page_mask=(octa){0, (1<<page_s)-1};
  else page_mask=(octa){(1<<(page_s-32))-1, 0xffffffff};
@z

@x [240] l.4365 C99 prototypes for C2x.
static octa phys_addr @,@,@[ARGS((octa,octa))@];

@ @<Sub...@>=
static octa phys_addr(virt,trans)
  octa virt,trans;
@y
static octa phys_addr(octa,octa);

@ @<Sub...@>=
static octa phys_addr(
  octa virt, octa trans)
@z

@x [241] l.4370 RAII.
{@+octa t;
  t=oandn(trans,page_mask); /* zero out the \\{ynp} fields of a PTE */
  return oplus(t,oand(virt,page_mask));
@y
{
  return oplus(oand(virt,page_mask), oandn(trans,page_mask));
    /* zero out the \\{ynp} fields of a PTE */
@z

@x [243] l.4393 Issue #16.
aaaaa=shift_right(aaaaa,page_s,1); /* the page address */
@y
aaaaa=shift_right(aaaaa,page_s,true); /* the page address */
@z

@x [243] l.4395 Compound literal. Issue #16.
  co[2*j].ctl->z.o.h=0, co[2*j].ctl->z.o.l=(aaaaa.l&0x3ff)<<3;
  aaaaa=shift_right(aaaaa,10,1);
@y
  co[2*j].ctl->z.o=(octa){0, (aaaaa.l&0x3ff)<<3};
  aaaaa=shift_right(aaaaa,10,true);
@z

@x [248] l.4474
coroutine write_co; /* coroutine that empties the write buffer */
control write_ctl; /* its control block */
@y
static coroutine write_co; /* coroutine that empties the write buffer */
static control write_ctl; /* its control block */
@z

@x [250] l.4487 C99 prototypes for C2x.
static void print_write_buffer @,@,@[ARGS((void))@];

@ @<Sub...@>=
static void print_write_buffer()
@y
static void print_write_buffer(void);

@ @<Sub...@>=
static void print_write_buffer(void)
@z

@x [251] l.4494
  else {@+register write_node *p;
@y
  else {
@z

@x [251] l.4496
    for (p=write_head;p!=write_tail; p=(p==wbuf_bot? wbuf_top: p-1)) {
@y
    for (write_node* p=write_head;p!=write_tail; p=(p==wbuf_bot? wbuf_top: p-1)) {
@z

@x [252] l.4511 C99 prototypes for C2x.
Extern void print_pipe @,@,@[ARGS((void))@];

@ @<External r...@>=
void print_pipe()
@y
Extern void print_pipe(void);

@ @<External r...@>=
void print_pipe(void)
@z

@x [254] l.4540 C99 prototypes for C2x.
static octa* write_search @,@,@[ARGS((control*,octa))@];

@ @<Sub...@>=
static octa *write_search(ctl,addr)
  control *ctl;
  octa addr;
@y
static octa* write_search(control*,octa);

@ @<Sub...@>=
static octa *write_search(
  control *ctl,
  octa addr)
@z

@x [255] l.4557
qloop:@+ for (;;) {
@y
qloop:@+ while (true) {
@z

@x [256] l.4585
  if (hot->i!=sync) for (;;) {
@y
  if (hot->i!=sync) while (true) {
@z

@x [257] l.4621 Change from MMIX home.
    if (ticks.l-write_head->stamp<holding_time && !speed_lock)
@y
    if (ticks.l-write_head->stamp<(tetra)holding_time && !speed_lock)
@z

@x [258] l.4638
@ @<Local var...@>=
register cacheblock *p,*q;
@y
@ (This section remains empty for historic reasons.)
@z

@x [259] l.4649 Compound literal.
Dcache->outbuf.tag.h=write_head->addr.h;
Dcache->outbuf.tag.l=write_head->addr.l&(-Dcache->bb);
@y
Dcache->outbuf.tag=(octa){write_head->addr.h,
  write_head->addr.l&(-Dcache->bb)};
@z

@x [266] l.4765
    @<Do load/store stage~1 with known physical address@>;
@y
    @<Do load/store stage 1 with known physical address@>;
@z

@x [269] l.4855 Change from MMIX home.
if (((data->z.o.l<<PROT_OFFSET)&j)!=j) {
@y
if (((data->z.o.l<<PROT_OFFSET)&j)!=(tetra)j) {
@z

@x [271] l.4879
@ @<Do load/store stage~1 with known physical address@>=
@y
@ @<Do load/store stage 1 with known physical address@>=
@z
@x [271] l.4901 Change from MMIX home.
  case st: data->state=st_ready;@+pass_after(1);@+goto passit;
@y
  case st: default: data->state=st_ready;@+pass_after(1);@+goto passit;
@z

@x [272] l.4958 Change from MMIX home.
 case DT_miss:@+if (DTcache->filler.next)
     if (data->i==preld || data->i==prest) goto fin_ex;@+ else goto square_one;
   if (no_hardware_PT || page_f)
     if (data->i==preld || data->i==prest) goto fin_ex;@+else goto emulate_virt;
@y
 case DT_miss:@+if (DTcache->filler.next)
   { if (data->i==preld || data->i==prest) goto fin_ex;@+ else goto square_one; }
   if (no_hardware_PT || page_f)
   { if (data->i==preld || data->i==prest) goto fin_ex;@+else goto emulate_virt;}
@z

@x [273] l.4988
  @<Check for a hit in pending writes@>;
@y
  @<Check for \9{a}a hit in pending writes@>;
@z

@x [274] l.5005
@<Check for |prest| with a fully spanned cache block@>;
@y
@<Check for \9{p}|prest| with a fully spanned cache block@>;
@z

@x [275] l.5027
@<Check for |prest| with a fully spanned cache block@>=
@y
@<Check for \9{p}|prest| with a fully spanned cache block@>=
@z

@x [275] l.5030 Change from MMIX home.
   ((data->y.o.l+(data->xx&(Dcache->bb-1))+1)^data->y.o.l)>=Dcache->bb)
@y
   ((data->y.o.l+(data->xx&(Dcache->bb-1))+1)^data->y.o.l)>=(tetra)(Dcache->bb))
@z

@x [278] l.5055
@ @<Check for a hit in pending writes@>=
@y
@ @<Check for \9{a}a hit in pending writes@>=
@z

@x [279] l.5089 Change from MMIX home.
      if ((data->x.o.h&sign_bit)==0 || (data->x.o.l&0x1ff8)!=page_n)
@y
      if ((data->x.o.h&sign_bit)==0 || (data->x.o.l&0x1ff8)!=(tetra)page_n)
@z

@x [279] l.5093 Change from MMIX home.
    case LDPTE>>1:@+if ((data->x.o.l&0x1ff8)!=page_n) data->x.o=zero_octa;
@y
    case LDPTE>>1:@+if ((data->x.o.l&0x1ff8)!=(tetra)page_n) data->x.o=zero_octa;
@z

@x [280] l.5105 GCC warning. Change from MMIX home.
   if (Dcache && Dcache->bb<data->b.o.l) data->b.o.l=Dcache->bb;
   goto do_syncid;
@y
   if (Dcache && (tetra)(Dcache->bb)<data->b.o.l) data->b.o.l=Dcache->bb;
   @=/* fall through */@>@;
 default: goto do_syncid;
@z

@x [281] l.5131
  fin_st: @<Insert |data->b.o| into the proper field of |data->x.o|,
@y
  fin_st: @<Insert \9{d}|data->b.o| into the proper field of |data->x.o|,
@z

@x [282] l.5138
@ @<Insert |data->b.o| into the proper field...@>=
@y
@ @<Insert \9{d}|data->b.o| into the proper field...@>=
@z

@x [282] l.5141 Change from MMIX home.
  if (!(data->op&2)) {@+octa before,after;
    before=data->b.o;@+after=shift_right(shift_left(data->b.o,i),i,0);
@y
  if (!(data->op&2)) {
    octa before=data->b.o;
    octa after=shift_right(shift_left(data->b.o,i),i,false);
@z

@x [282] l.5145 Issue #16.
  mask=shift_right(shift_left(neg_one,i),j,1);
  data->b.o=shift_right(shift_left(data->b.o,i),j,1);
@y
  mask=shift_right(shift_left(neg_one,i),j,true);
  data->b.o=shift_right(shift_left(data->b.o,i),j,true);
@z

@x [282] l.5147
  data->x.o.h^=mask.h&(data->x.o.h^data->b.o.h);
  data->x.o.l^=mask.l&(data->x.o.l^data->b.o.l);
@y
  data->x.o = oxor(data->x.o, oand(mask, oxor(data->x.o, data->b.o)));
@z

@x [285] l.5204
int fetch_lo, fetch_hi; /* the active region of that buffer */
coroutine fetch_co;
control fetch_ctl;
@y
static int fetch_lo, fetch_hi; /* the active region of that buffer */
static coroutine fetch_co;
static control fetch_ctl;
@z

@x [288] l.5228
 case 0: @<Wait, if necessary, until the instruction pointer is known@>;
@y
 case 0: @<Wait\9{2}, if necessary, until the instruction pointer is known@>;
@z

@x [288] l.5238 Improved typography.
  @<Other cases for the fetch coroutine@>@;
@y
  @/@t\4@>@<Other cases for the fetch coroutine@>@;
@z

@x [290] l.5244
@ @<Wait, if necessary, until the instruction pointer is known@>=
@y
@ @<Wait\9{2}, if necessary, until the instruction pointer is known@>=
@z

@x [297] l.5334 RAII.
{@+octa addr;
  addr=data->z.o;
@y
{@+octa addr=data->z.o;
@z

@x [298] l.5349 Change from MMIX home.
 case IT_miss:@+if (ITcache->filler.next)
     if (data->i==prego) goto fin_ex;@+else wait(1);
@y
 case IT_miss:@+if (ITcache->filler.next) {
     if (data->i==prego) goto fin_ex;@+else wait(1); }
@z

@x [298] l.5354 Change from MMIX home.
   if (!p) /* hey, it was present after all */
     if (data->i==prego) goto fin_ex;@+else goto new_fetch;
@y
   if (!p) /* hey, it was present after all */
     { if (data->i==prego) goto fin_ex;@+else goto new_fetch; }
@z

@x [301] l.5403 RAII.
    register fetch *new_tail;
    if (tail==fetch_bot) new_tail=fetch_top;
    else new_tail=tail-1;
@y
    register fetch *new_tail=tail==fetch_bot?fetch_top:tail-1;
@z

@x [303] l.5426
bool sleepy; /* have we just emitted the page table emulation call? */
@y
static bool sleepy; /* have we just emitted the page table emulation call? */
@z

@x [304] l.5443 Use 'breakpoint_hit' at least once (in MMIX_silent).
if (inst_ptr.o.l==breakpoint.l && inst_ptr.o.h==breakpoint.h)
@y
if (inst_ptr.o.l==breakpoint.l && inst_ptr.o.h==breakpoint.h
  && breakpoint_hit==false )
@z

@x [305] l.5450
int bad_inst_mask[4]={0xfffffe,0xffff,0xffff00,0xfffff8};
@y
static int bad_inst_mask[4]={0xfffffe,0xffff,0xffff00,0xfffff8};
@z

@x [308] l.5505
@<Prepare for exceptional trip handler@>=
{
@y
@<Prepare for exceptional trip handler@>=
{@+register int m;
@z
@x [308] l.5516
  data->go.o.h=0, data->go.o.l=m;
@y
  data->go.o=(octa){0,m};
@z

@x [314] l.5586
@<Check for external interrupt@>=
@y
@<Check for \9{e}external interrupt@>=
@z

@x [315] l.5607
bool trying_to_interrupt; /* encouraging interruptible operations to pause */
bool nullifying; /* stopping dispatch to nullify a load/store command */
@y
static bool trying_to_interrupt; /* encouraging interruptible operations to pause */
static bool nullifying; /* stopping dispatch to nullify a load/store command */
@z

@x [320] l.5682
@d pack_bytes(a,b,c,d) ((((((unsigned)(a)<<8)+(b))<<8)+(c))<<8)+(d)
@y
@d pack_bytes(a,b,c,d) ((((((byte)(a)<<8)+(b))<<8)+(c))<<8)+(d)
@z

@x [320] l.5688
  g[rX].o.h=sign_bit, g[rX].o.l=j;
@y
  g[rX].o=(octa){sign_bit,j};
@z

@x [323] l.5774
@<Resume an interrupted operation@>=
{
@y
@<Resume an interrupted operation@>=
{@+register int m;
@z

@x [329] l.5888
  case rQ: new_Q.h |= data->z.o.h &~ g[rQ].o.h;@+
           new_Q.l |= data->z.o.l &~ g[rQ].o.l;
           data->z.o.l |= new_Q.l;@+
           data->z.o.h |= new_Q.h;@+break;
  case rL:@+ if (data->z.o.h!=0) data->z.o.h=0, data->z.o.l=g[rL].o.l;
@y
  case rQ: new_Q = oor(new_Q,oandn(data->z.o,g[rQ].o));
           data->z.o = oor(data->z.o,new_Q);
  case rL:@+ if (data->z.o.h!=0) data->z.o=(octa){0,g[rL].o.l};
@z

@x [334] l.5974 Issue #16.
new_O=new_S=shift_right(cool->z.o,3,1);
@y
new_O=new_S=shift_right(cool->z.o,3,true);
@z

@x [337] l.6007
      @<Insert an instruction to advance gamma@>@;
@y
      @<Insert \9{a}an instruction to advance gamma@>@;
@z

@x [337] l.6013
 case 1:@+if (cool_O.l!=cool_S.l) @<Insert an instruction to advance gamma@>@;
@y
 case 1:@+if (cool_O.l!=cool_S.l) @<Insert \9{a}an instruction to advance gamma@>@;
@z

@x [338] l.6029 Compound literal.
cool->x.known=true, cool->x.o.h=0, cool->x.o.l=cool_L;
@y
cool->x.known=true, cool->x.o=(octa){0, cool_L};
@z

@x [342] l.6065 Compound literal.
    data->x.o.h=g[rG].o.l<<24;
    data->x.o.l=g[rA].o.l;
@y
    data->x.o=(octa){g[rG].o.l<<24, g[rA].o.l};
@z

@x [343] l.6087 Issue #16.
  for (j=mul0;aux.l||aux.h;j++) aux=shift_right(aux,8,1);
@y
  for (j=mul0;aux.l||aux.h;j++) aux=shift_right(aux,8,true);
@z

@x [344] l.6106 Compound literal.
case bdif: data->x.o.h=byte_diff(data->y.o.h,data->z.o.h);
           data->x.o.l=byte_diff(data->y.o.l,data->z.o.l);@+ break;
case wdif: data->x.o.h=wyde_diff(data->y.o.h,data->z.o.h);
           data->x.o.l=wyde_diff(data->y.o.l,data->z.o.l);@+ break;
@y
case bdif: data->x.o=(octa){byte_diff(data->y.o.h,data->z.o.h),
                            byte_diff(data->y.o.l,data->z.o.l)};@+ break;
case wdif: data->x.o=(octa){wyde_diff(data->y.o.h,data->z.o.h),
                            wyde_diff(data->y.o.l,data->z.o.l)};@+ break;
@z

@x [348] l.6199 Change from MMIX home.
 case FEQLE: goto cmp_fin;
@y
 case FEQLE: default: goto cmp_fin;
@z

@x [353] l.6269 Compound literal.
  data->z.o.h=0, data->z.o.l=data->y.o.l&0x7;
@y
  data->z.o=(octa){0, data->y.o.l&0x7};
@z

@x [356] l.6323
 case 2: case 3: @<Wait if there's an unfinished load ahead of us@>;
@y
 case 2: case 3: @<Wait\9{3} if there's an unfinished load ahead of us@>;
@z

@x [356] l.6327
  @<Clean the data caches@>;
@y
  @<Clean the \9{a}data caches@>;
@z

@x [357] l.6334
@ @<Wait if there's an unfinished load ahead of us@>=
@y
@ @<Wait\9{3} if there's an unfinished load ahead of us@>=
@z

@x [357] l.6335
{
  register control *cc;
  for (cc=data;cc!=hot;) {
    cc=(cc==reorder_top? reorder_bot: cc+1);
    if (cc->owner && (cc->i==ld || cc->i==ldunc || cc->i==pst)) wait(1);
  }
}
@y
for (control* cc=data;cc!=hot;) {
  cc=(cc==reorder_top? reorder_bot: cc+1);
  if (cc->owner && (cc->i==ld || cc->i==ldunc || cc->i==pst)) wait(1);
}
@z

@x [361] l.6387
@ @<Clean the data caches@>=
@y
@ @<Clean the \9{a}data caches@>=
@z

@x [361] l.6389
@<Wait till write buffer is empty@>;
@y
@<Wait\9{4} till write buffer is empty@>;
@z

@x [362] l.6400
@ @<Wait till write buffer is empty@>=
@y
@ @<Wait\9{4} till write buffer is empty@>=
@z

@x [364] l.6441
 @<Clean the I-cache block for |data->z.o|, if any@>;
@y
 @<Clean the \9{i}I-cache block for |data->z.o|, if any@>;
@z

@x [364] l.6444
 @<Wait till write buffer is empty@>;
@y
 @<Wait\9{4} till write buffer is empty@>;
@z

@x [364] l.6447
 @<Clean the D-cache block for |data->z.o|, if any@>;
@y
 @<Clean the \9{d}D-cache block for |data->z.o|, if any@>;
@z

@x [364] l.6451
 @<Clean the S-cache block for |data->z.o|, if any@>;
@y
 @<Clean the \9{s}S-cache block for |data->z.o|, if any@>;
@z

@x [364] l.6456
 @<Wait till write buffer is empty@>;
@y
 @<Wait\9{4} till write buffer is empty@>;
@z

@x [364] l.6459 Change from MMIX home.
   if (data->i==syncd) goto fin_ex;@+ else goto next_sync;
@y
   { if (data->i==syncd) goto fin_ex;@+ else goto next_sync; }
@z

@x [365] l.6474
@ @<Clean the I-cache block for |data->z.o|, if any@>=
@y
@ @<Clean the \9{i}I-cache block for |data->z.o|, if any@>=
@z

@x [366] l.6484
@ @<Clean the D-cache block for |data->z.o|, if any@>=
@y
@ @<Clean the \9{d}D-cache block for |data->z.o|, if any@>=
@z

@x [367] l.6494
@ @<Clean the S-cache block for |data->z.o|, if any@>=
@y
@ @<Clean the \9{s}S-cache block for |data->z.o|, if any@>=
@z

@x [369] l.6519 Change from MMIX home.
  data->y.o.l &= -data->b.o.l;
@y
  data->y.o.l &= -(int)data->b.o.l;
@z

@x [372] l.6566 Change from MMIX home.
case Fopen: g[rBB].o=mmix_fopen(zz,mb,ma);@+break;
@y
case Fopen: g[rBB].o=mmix_fopen(zz,mb,ma,mmgetchars);@+break;
@z

@x [372] l.6568 Decouple 'mixins'.
case Fread: g[rBB].o=mmix_fread(zz,mb,ma);@+break;
case Fgets: g[rBB].o=mmix_fgets(zz,mb,ma);@+break;
case Fgetws: g[rBB].o=mmix_fgetws(zz,mb,ma);@+break;
case Fwrite: g[rBB].o=mmix_fwrite(zz,mb,ma);@+break;
case Fputs: g[rBB].o=mmix_fputs(zz,g[rBB].o);@+break;
case Fputws: g[rBB].o=mmix_fputws(zz,g[rBB].o);@+break;
@y
case Fread: g[rBB].o=mmix_fread(zz,mb,ma,mmputchars,stdin_chr);@+break;
case Fgets: g[rBB].o=mmix_fgets(zz,mb,ma,mmputchars,stdin_chr);@+break;
case Fgetws: g[rBB].o=mmix_fgetws(zz,mb,ma,mmputchars,stdin_chr);@+break;
case Fwrite: g[rBB].o=mmix_fwrite(zz,mb,ma,mmgetchars);@+break;
case Fputs: g[rBB].o=mmix_fputs(zz,g[rBB].o,mmgetchars);@+break;
case Fputws: g[rBB].o=mmix_fputws(zz,g[rBB].o,mmgetchars);@+break;
@z

@x [373] l.6583 RAII.
  octa trap_loc;
  trap_loc=incr(g[rWW].o,-4);
@y
  octa trap_loc=incr(g[rWW].o,-4);
@z

@x [374] l.6590
char arg_count[]={1,3,1,3,3,3,3,2,2,2,1};
@y
static char arg_count[]={1,3,1,3,3,3,3,2,2,2,1};
@z

@x [375] l.6594 Decouple 'mixins'.
Here we need only declare those subroutines, and write three primitive
interfaces on which they depend.

@ @<Glob...@>=
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
@y
Here we need only write three primitive interfaces on which they depend.

@ The following three functions are used in {\mc MMIX-IO} as ``mixins'' in
section |@<Magic...@>|.  Similar functions are defined in the simplified \MMIX\
computer {\mc MMIX-SIM}.

@<Internal proto...@>=
static int mmgetchars(char*,int,octa,int);
static void mmputchars(unsigned char*,int,octa);
static char stdin_chr(void);
@z

@x [377] l.6611 Decouple 'mixins' from other private stuff..
int mmgetchars @,@,@[ARGS((char*,int,octa,int))@];
void mmputchars @,@,@[ARGS((unsigned char*,int,octa))@];
char stdin_chr @,@,@[ARGS((void))@];
octa magic_read @,@,@[ARGS((octa))@];
void magic_write @,@,@[ARGS((octa,octa))@];
@y
static octa magic_read(octa);
static void magic_write(octa,octa);
@z

@x [378] l.6623 Factor out private stuff.
octa magic_read(addr)
  octa addr;
@y
static octa magic_read(
  octa addr)
@z

@x [378] l.6626
  register write_node *q;
  register cacheblock *p;
@y
@z

@x [378] l.6628
  for (q=write_tail;;) {
    if (q==write_head) break;
@y
  for (write_node* q=write_tail; q!=write_head;) {
@z

@x [378] l.6634
    p=cache_search(Dcache,addr);
@y
    cacheblock* p=cache_search(Dcache,addr);
@z

@x [379] l.6656 Factor out private stuff.
void magic_write(addr,val)
  octa addr,val;
@y
static void magic_write(
  octa addr, octa val)
@z

@x [379] l.6659
  register write_node *q;
  register cacheblock *p;
@y
@z

@x [379] l.6661
  for (q=write_tail;;) {
    if (q==write_head) break;
@y
  for (write_node* q=write_tail; q!=write_head;) {
@z

@x [379] l.6667
    p=cache_search(Dcache,addr);
@y
    cacheblock* p=cache_search(Dcache,addr);
@z

@x [380] l.6695 RAII.
  octa arg_loc;
  arg_loc=g[rBB].o;
@y
  octa arg_loc=g[rBB].o;
@z

@x [381] l.6714 Factor out private stuff (mixins).
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

@x [384] l.6772 Factor out private stuff (mixins).
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

@x [386] l.6803 Compound literal.
  x.h=(*p<<24)+(*(p+1)<<16)+(*(p+2)<<8)+*(p+3);
  x.l=(*(p+4)<<24)+(*(p+5)<<16)+(*(p+6)<<8)+*(p+7);
@y
  x=(octa){(*p<<24)+(*(p+1)<<16)+(*(p+2)<<8)+*(p+3),@|
    (*(p+4)<<24)+(*(p+5)<<16)+(*(p+6)<<8)+*(p+7)};
@z

@x [387] l.6821 Factor out private stuff (mixins).
char stdin_chr()
@y
static char stdin_chr(void)
@z

@x [387] l.6827 Don't ignore return code from fgets().
    fgets(stdin_buf,256,stdin);
@y
    if (!fgets(stdin_buf,sizeof(stdin_buf),stdin)) break;
@z

@x [387] l.6829 Replace magic number.
    for (p=stdin_buf;p<stdin_buf+254;p++) if(*p=='\n') break;
@y
    for (p=stdin_buf;p<stdin_buf+sizeof(stdin_buf)-2;p++) if(*p=='\n') break;
@z

@x [388] l.6836
char stdin_buf[256]; /* standard input to the simulated program */
char *stdin_buf_start; /* current position in that buffer */
char *stdin_buf_end; /* current end of that buffer */
@y
static char stdin_buf[256]; /* standard input to the simulated program */
static char *stdin_buf_start; /* current position in that buffer */
static char *stdin_buf_end; /* current end of that buffer */
@z

@x [389] l.6840 Merge MMIX-MEM.
@* Index.
@y
@* Memory-mapped input and output. Here we supply procedures for reading
@^I/O@>
@^input/output@>
@^memory-mapped input/output@>
from and writing to \MMIX\ memory addresses that exceed 48 bits. Such addresses
are used by the operating system for input and output, so they require special
treatment. At present only dummy versions of these routines are implemented.
Users who need nontrivial versions of |spec_read| and/or |spec_write| should
prepare their own and link them with the rest of the simulator.

Many I/O devices communicate via bytes or wydes or tetras instead of
octabytes. So these prototype routines have a |size| parameter, to
distinguish between the various kinds of quantities that \MMIX\ wants to
read from and write to the memory-mapped addresses.

@<Internal...@>=
static octa spec_read(octa,int);
  /* for memory mapped I/O */
static void spec_write(octa,octa,int);
  /* likewise */

@ If the |interactive_read_bit| of the |verbose| control is set,
the user is supposed to supply values dynamically. Otherwise
zero is read.

@<Sub...@>=
static octa spec_read(
  octa addr,
  int size)
{
  octa val=zero_octa;
  char buf[20];
  char *kind[]={"byte","wyde","tetra","octa"};
  size&=0x3, addr.l&=-(1<<size);
  if (verbose&interactive_read_bit) {
    printf("** Read %s from loc %08x%08x: ",kind[size],addr.h,addr.l);
    if (fgets(buf,sizeof(buf),stdin)) val=read_hex(buf);
  }
  switch (size) {
case 0: val.l&=0xff;@+@=/* fall through */@>@;
case 1: val.l&=0xffff;@+@=/* fall through */@>@;
case 2: val.h=0;@+@=/* fall through */@>@;
case 3: break;
}
  if (verbose&show_spec_bit) {
    printf("   (spec_read ");
    switch (size) {
  case 0: printf("%02x",val.l);@+break;
  case 1: printf("%04x",val.l);@+break;
  case 2: printf("%08x",val.l);@+break;
  case 3: printf("%08x%08x",val.h,val.l);@+break;
    }
    printf(" from %08x%08x at time %d)\n",addr.h,addr.l,ticks.l);
  }
  return shift_left(val,(8-(1<<size)-(addr.l&7))<<3);
}

@ The default |spec_write| just reports its arguments, without actually
writing anything.

@<Sub...@>=
static void spec_write(
  octa addr, octa val,
  int size)
{
  if (verbose&show_spec_bit) {
    size&=0x3, addr.l&=-(1<<size);
    val=shift_right(val,(8-(1<<size)-(addr.l&7))<<3,true);
    printf("   (spec_write ");
    switch (size) {
  case 0: printf("%02x",val.l);@+break;
  case 1: printf("%04x",val.l);@+break;
  case 2: printf("%08x",val.l);@+break;
  case 3: printf("%08x%08x",val.h,val.l);@+break;
    }
    printf(" to %08x%08x at time %d)\n",addr.h,addr.l,ticks.l);
  }
}

@ Incidentally, the combined address $a$ and size $s$ could be transmitted
in 64 bits of an actual memory bus, because $a$ is always a multiple of~$2^s$
that is less than $2^{63}$. Thus $(a,s)$ can be packed neatly into the
64-bit number $2a+2^s$. (Think about it.)

@* Index.
@z
