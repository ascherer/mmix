@x [0] l.13 Use C99 standard types instead of homebrewn typedefs.
@s bool normal @q unreserve a C++ keyword @>
@y
@z

@x [0] l.15
@s bignum int
@y
@s bignum int

\input pdfwebtocfront

@z

@x [1] l.34 Improved module structure with interfaces.
#include <stdio.h>
#include <string.h>
#include <ctype.h>
@y
#include "mmix-arith.h" /* we use our own interface first;
  see |@(mmix-arith.h@>| */
@#
#include <stdio.h> /* |@!printf| */
#include <string.h> /* |@!strncmp| */
#include <ctype.h> /* |@!isdigit| */
@#
@h
@#
@z

@x [1] l.37 Move to interface.
@<Stuff for \CEE/ preprocessor@>@;
typedef enum{@+false,true@+} bool;
@<Tetrabyte and octabyte type definitions@>@;
@y
@z

@x [1] l.41 Factor out private stuff.
@<Global variables@>@;
@<Subroutines@>
@y
@<Global variable@>@;
@<Internal prototypes@>@;
@<Subroutines@>@;
@<External variables@>@;
@<External routines@>@;
@z

@x [2] l.44 C99 prototypes for C2x.
@ Subroutines of this program are declared first with a prototype,
as in {\mc ANSI C}, then with an old-style \CEE/ function definition.
Here are some preprocessor commands that make this work correctly with both
new-style and old-style compilers.
@^prototypes for functions@>

@<Stuff for \CEE/ preprocessor@>=
#ifdef __STDC__
#define ARGS(list) list
#else
#define ARGS(list) ()
#endif
@y
@ Subroutines of this program are declared and defined with a prototype,
as in {\mc ANSI C}.
@^prototypes for functions@>

@s ftype int
@s octa int
@s tetra int

@<Internal...@>=
static octa fpack(octa,int,char,int);
static tetra sfpack(octa,int,char,int);
static ftype funpack(octa,octa*,int*,char*);
static ftype sfunpack(tetra,octa*,int*,char*);
@#
static void bignum_times_ten(bignum*);
static int bignum_compare(bignum*,bignum*);
static void bignum_dec(bignum*,bignum*,tetra);
static void bignum_double(bignum*);
@z

@x [3] l.57 Use standard C99 types.
@ The definition of type \&{tetra} should be changed, if necessary, so that
it represents an unsigned 32-bit integer.
@^system dependencies@>

@<Tetra...@>=
typedef unsigned int tetra;
 /* for systems conforming to the LP-64 data model */
@y
@ The definition of type \&{tetra}
represents an unsigned 32-bit integer.
@^system dependencies@>

@s uint8_t int
@s uint32_t int
@<Tetra...@>=
typedef uint8_t byte; /* a monobyte */
typedef uint32_t tetra;
@z

@x [4] l.66 RAII.
@ @d sign_bit ((unsigned)0x80000000)

@<Glob...@>=
octa zero_octa; /* |zero_octa.h=zero_octa.l=0| */
octa neg_one={-1,-1}; /* |neg_one.h=neg_one.l=-1| */
octa inf_octa={0x7ff00000,0}; /* floating point $+\infty$ */
octa standard_NaN={0x7ff80000,0}; /* floating point NaN(.5) */
@y
@ @<External routines@>=
void print_octa(octa o)
{
  if (o.h) printf("%x%08x",o.h,o.l);
  else printf("%x",o.l);
}
@z

@x [5] l.77 C99 prototypes for C2x.
@<Subr...@>=
octa oplus @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
octa oplus(y,z) /* compute $y+z$ */
  octa y,z;
@y
@<External routines@>=
octa oplus(octa y, octa z) /* compute $y+z$ */
@z

@x [5] l.81 RAII.
{@+ octa x;
  x.h=y.h+z.h;@+
  x.l=y.l+z.l;
@y
{@+ octa x = {y.h+z.h, y.l+z.l};
@z

@x [5] l.88 C99 prototypes for C2x.
octa ominus @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
octa ominus(y,z) /* compute $y-z$ */
  octa y,z;
@y
octa ominus(octa y, octa z) /* compute $y-z$ */
@z

@x [5] l.91 RAII.
{@+ octa x;
  x.h=y.h-z.h;@+
  x.l=y.l-z.l;
@y
{@+ octa x={y.h-z.h, y.l-z.l};
@z

@x [6] l.101 C99 prototypes for C2x.
@<Subr...@>=
octa incr @,@,@[ARGS((octa,int))@];@+@t}\6{@>
octa incr(y,delta) /* compute $y+\delta$ */
  octa y;
  int delta;
@y
@<External routines@>=
octa incr(octa y, int delta) /* compute $y+\delta$ */
@z

@x [6] l.106 RAII.
{@+ octa x;
  x.h=y.h;@+ x.l=y.l+delta;
@y
{@+ octa x={y.h, y.l+delta};
@z

@x [6] l.110 Format improvement. (if-block requires braces.)
  }@+else if (x.l>y.l) x.h--;
@y
  }@+else {if (x.l>y.l) x.h--;}
@z

@x [7] l.116 C99 prototypes for C2x.
@<Subr...@>=
octa shift_left @,@,@[ARGS((octa,int))@];@+@t}\6{@>
octa shift_left(y,s) /* shift left by $s$ bits, where $0\le s\le64$ */
  octa y;
  int s;
@y
@<External routines@>=
octa shift_left(octa y, int s)
  /* shift left by $s$ bits, where $0\le s\le64$ */
@z

@x [7] l.129 C99 prototypes for C2x.
octa shift_right @,@,@[ARGS((octa,int,int))@];@+@t}\6{@>
octa shift_right(y,s,u) /* shift right, arithmetically if $u=0$ */
  octa y;
  int s,u;
@y
octa shift_right(octa y, int s, bool u)
  /* shift right, arithmetically if $u=false$ */
@z

@x [8] l.149 C99 prototypes for C2x.
@<Subr...@>=
octa omult @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
octa omult(y,z)
  octa y,z;
@y
@<External routines@>=
octa omult(octa y, octa z)
@z

@x [8] l.155 Zero-initialization.
  tetra u[4],v[4],w[8];
@y
  tetra u[4],v[4],w[8]={0};
@z

@x [8] l.159 Zero-initialization.
  for (j=0;j<4;j++) w[j]=0;
@y
@z

@x [9] l.173
@ @<Glob...@>=
octa aux; /* secondary output of subroutines with multiple outputs */
bool overflow; /* set by certain subroutines for signed arithmetic */
@y
@ The identifier \&{Extern} is used in {\mc MMIX-ARITH} to
declare variables that are accessed in other modules. Actually
all appearances of `\&{Extern}' are defined to be blank here, but
`\&{Extern}' will become `\&{extern}' in the header file |@(mmix-arith.h@>|.

@d Extern  /* blank for us, \&{extern} for them */
@f Extern extern

@<External variables@>=
Extern octa aux; /* secondary output of subroutines with multiple outputs */
Extern bool overflow; /* set by certain subroutines for signed arithmetic */
@z

@x [11] l.182 Compound literals.
aux.h=(w[7]<<16)+w[6], aux.l=(w[5]<<16)+w[4];
acc.h=(w[3]<<16)+w[2], acc.l=(w[1]<<16)+w[0];
@y
aux=(octa){(w[7]<<16)+w[6], (w[5]<<16)+w[4]};
acc=(octa){(w[3]<<16)+w[2], (w[1]<<16)+w[0]};
@z

@x [12] l.190 C99 prototypes for C2x.
@<Subr...@>=
octa signed_omult @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
octa signed_omult(y,z)
  octa y,z;
@y
@<External routines@>=
octa signed_omult(
  octa y, octa z)
@z

@x [12] l.195 RAII.
  octa acc;
  acc=omult(y,z);
@y
  octa acc=omult(y,z);
@z

@x [13] l.214 C99 prototypes for C2x.
@<Subr...@>=
octa odiv @,@,@[ARGS((octa,octa,octa))@];@+@t}\6{@>
octa odiv(x,y,z)
  octa x,y,z;
@y
@<External routines@>=
octa odiv(
  octa x, octa y, octa z)
@z

@x [19] l.272 Compound literals.
acc.h=(q[3]<<16)+q[2], acc.l=(q[1]<<16)+q[0];
aux.h=(u[3]<<16)+u[2], aux.l=(u[1]<<16)+u[0];
@y
acc=(octa){(q[3]<<16)+q[2], (q[1]<<16)+q[0]};
aux=(octa){(u[3]<<16)+u[2], (u[1]<<16)+u[0]};
@z

@x [23] l.305 Change from MMIX home.
if (u[j+n]!=k) {
@y
if (u[j+n]!=(tetra)k) {
@z

@x [24] l.316 C99 prototypes for C2x.
@<Subr...@>=
octa signed_odiv @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
octa signed_odiv(y,z)
  octa y,z;
@y
@<External routines@>=
octa signed_odiv(
  octa y, octa z)
@z

@x [24] l.332 GCC warning. Change from MMIX home.
 case 0+0: return q;
@y
  @=/* else fall through */@>@;
 case 0+0: default: return q;
@z

@x [25] l.342 Add missing bit-fiddling functions.
implement directly, but three of them occur often enough to deserve
@y
implement directly, and they occur often enough to deserve
@z

@x [25] l.345 Add missing bit-fiddling functions.
@<Subr...@>=
@y
@<External routines@>=
octa onot(octa x) /* compute $\bar x$ */
{ @+ return (octa){~x.h,~x.l}; @+ }
@#
octa oor(octa y, octa z) /* compute $y\lor z$ */
{ @+ return (octa){y.h|z.h, y.l|z.l}; @+ }
@#
octa oorn(octa y, octa z) /* compute $y\lor\bar z$ */
{ @+ return oor(y, onot(z)); @+ }
@#
octa onor(octa y, octa z) /* compute $\overline{y\lor z}$ */
{ @+ return onot(oor(y, z)); @+ }
@#
@z

@x [25] l.346 C99 prototypes for C2x.
octa oand @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
octa oand(y,z) /* compute $y\land z$ */
  octa y,z;
{@+ octa x;
  x.h=y.h&z.h;@+ x.l=y.l&z.l;
  return x;
}
@y
octa oand(octa y, octa z) /* compute $y\land z$ */
{ @+ return (octa){y.h&z.h, y.l&z.l}; @+ }
@z

@x [25] l.354 C99 prototypes for C2x.
octa oandn @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
octa oandn(y,z) /* compute $y\land\bar z$ */
  octa y,z;
{@+ octa x;
  x.h=y.h&~z.h;@+ x.l=y.l&~z.l;
  return x;
}
@y
octa oandn(octa y, octa z) /* compute $y\land\bar z$ */
{ @+ return oand(y, onot(z)); @+ }
@#
octa onand(octa y, octa z) /* compute $\overline{y\land z}$ */
{ @+ return onot(oand(y, z)); @+ }
@z

@x [25] l.362 C99 prototypes for C2x.
octa oxor @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
octa oxor(y,z) /* compute $y\oplus z$ */
  octa y,z;
{@+ octa x;
  x.h=y.h^z.h;@+ x.l=y.l^z.l;
  return x;
}
@y
octa oxor(octa y, octa z) /* compute $y\oplus z$ */
{ @+ return (octa){y.h^z.h, y.l^z.l}; @+ }
@#
octa onxor(octa y, octa z) /* compute $\overline{y\oplus z}$ */
{ @+ return onot(oxor(y, z)); @+ }
@z

@x [26] l.386 C99 prototypes for C2x.
@<Subr...@>=
int count_bits @,@,@[ARGS((tetra))@];@+@t}\6{@>
int count_bits(x)
  tetra x;
@y
@<External routines@>=
int count_bits(
  tetra x)
@z

@x [27] l.402 C99 prototypes for C2x.
@<Subr...@>=
tetra byte_diff @,@,@[ARGS((tetra,tetra))@];@+@t}\6{@>
tetra byte_diff(y,z)
  tetra y,z;
@y
@<External routines@>=
tetra byte_diff(
  tetra y, tetra z)
@z

@x [28] l.420 C99 prototypes for C2x.
@<Subr...@>=
tetra wyde_diff @,@,@[ARGS((tetra,tetra))@];@+@t}\6{@>
tetra wyde_diff(y,z)
  tetra y,z;
@y
@<External routines@>=
tetra wyde_diff(
  tetra y, tetra z)
@z

@x [29] l.433 C99 prototypes for C2x.
@<Subr...@>=
octa bool_mult @,@,@[ARGS((octa,octa,bool))@];@+@t}\6{@>
octa bool_mult(y,z,xor)
  octa y,z; /* the operands */
  bool xor; /* do we do xor instead of or? */
@y
@<External routines@>=
octa bool_mult(
  octa y, octa z, /* the operands */
  bool xor) /* do we do xor instead of or? */
@z
@x [29] l.442 Issue #16.
  for (k=0,o=y,x=zero_octa;o.h||o.l;k++,o=shift_right(o,8,1))
@y
  for (k=0,o=y,x=zero_octa;o.h||o.l;k++,o=shift_right(o,8,true))
@z
@x [29] l.447
      if (xor) x.h^=a&c, x.l^=b&c;
      else x.h|=a&c, x.l|=b&c;
@y
      if (xor) x=oxor(x,(octa){a&c,b&c});
      else x=oor(x,(octa){a&c,b&c});
@z

@x [30] l.463
@<Glob...@>=
int cur_round; /* the current rounding mode */
@y
@<External variables@>=
Extern int cur_round; /* the current rounding mode */
@z

@x [31] l.489
tiny, |X_BIT| if and only if the result is inexact.
@y
tiny, |X_BIT| if and only if the result is inexact.
A~full list of these codes is defined in {\mc MMIX-PIPE}.
@z
@x [31] l.500
@d V_BIT (1<<14) /* integer overflow */
@d D_BIT (1<<15) /* integer divide check */
@y
@z

@x [31] l.505 Factor out private stuff.
octa fpack @,@,@[ARGS((octa,int,char,int))@];@+@t}\6{@>
octa fpack(f,e,s,r)
  octa f; /* the normalized fraction part */
  int e; /* the raw exponent */
  char s; /* the sign */
  int r; /* the rounding mode */
@y
static octa fpack(
  octa f, /* the normalized fraction part */
  int e, /* the raw exponent */
  char s, /* the sign */
  int r) /* the rounding mode */
@z

@x [31] l.516
      if (e<-54) o.h=0, o.l=1;
@y
      if (e<-54) o=(octa){0,1};
@z

@x [31] l.518 Issue #16.
        o=shift_right(f,-e,1);
@y
        o=shift_right(f,-e,true);
@z

@x [32] l.529
@ @<Glob...@>=
int exceptions; /* bits possibly destined for rA */
@y
@ @<External variables@>=
Extern int exceptions; /* bits possibly destined for rA */
@z

@x [33] l.532 Change from MMIX home.
@ Everything falls together so nicely here, it's almost too good to be true!
@y
@ Everything falls together so nicely here, it's almost too good to be true!
The conditional expression in the case for |ROUND_NEAR|
rounds towards an even number in case of a tie.
@z

@x [33] l.540 Change from MMIX home.
 case ROUND_NEAR: o=incr(o, o.l&4? 2: 1);@+break;
@y
 case ROUND_NEAR: default: o=incr(o, o.l&4? 2: 1);@+break;
@z

@x [33] l.542 Issue #16.
o = shift_right(o,2,1);
@y
o = shift_right(o,2,true);
@z

@x [34] l.553 Factor out private stuff.
tetra sfpack @,@,@[ARGS((octa,int,char,int))@];@+@t}\6{@>
tetra sfpack(f,e,s,r)
  octa f; /* the fraction part */
  int e; /* the raw exponent */
  char s; /* the sign */
  int r; /* the rounding mode */
@y
static tetra sfpack(
  octa f, /* the fraction part */
  int e, /* the raw exponent */
  char s, /* the sign */
  int r) /* the rounding mode */
@z

@x [35] l.588
o = o>>2;
@y
o >>= 2;
@z

@x [37] l.610 Factor out private stuff.
ftype funpack @,@,@[ARGS((octa,octa*,int*,char*))@];@+@t}\6{@>
ftype funpack(x,f,e,s)
  octa x; /* the given floating point value */
  octa *f; /* address where the fraction part should be stored */
  int *e; /* address where the exponent part should be stored */
  char *s; /* address where the sign should be stored */
@y
static ftype funpack(
  octa x, /* the given floating point value */
  octa *f, /* address where the fraction part should be stored */
  int *e, /* address where the exponent part should be stored */
  char *s) /* address where the sign should be stored */
@z

@x [38] l.636 Factor out private stuff.
ftype sfunpack @,@,@[ARGS((tetra,octa*,int*,char*))@];@+@t}\6{@>
ftype sfunpack(x,f,e,s)
  tetra x; /* the given floating point value */
  octa *f; /* address where the fraction part should be stored */
  int *e; /* address where the exponent part should be stored */
  char *s; /* address where the sign should be stored */
@y
static ftype sfunpack(
  tetra x, /* the given floating point value */
  octa *f, /* address where the fraction part should be stored */
  int *e, /* address where the exponent part should be stored */
  char *s) /* address where the sign should be stored */
@z

@x [38] l.646 Compound literal.
  f->h=(x>>1)&0x3fffff, f->l=x<<31;
@y
  *f=(octa){(x>>1)&0x3fffff, x<<31};
@z

@x [39] l.664 C99 prototypes for C2x.
@<Subr...@>=
octa load_sf @,@,@[ARGS((tetra))@];@+@t}\6{@>
octa load_sf(z)
  tetra z; /* 32 bits to be loaded into a 64-bit register */
@y
@<External routines@>=
octa load_sf(
  tetra z) /* 32 bits to be loaded into a 64-bit register */
@z

@x [39] l.669 RAII.
  octa f,x;@+int e;@+char s;@+ftype t;
  t=sfunpack(z,&f,&e,&s);
@y
  octa f,x;@+int e;@+char s;@+ftype t=sfunpack(z,&f,&e,&s);
@z

@x [39] l.675 Issue #16.
 case nan: x=shift_right(f,2,1);@+x.h|=0x7ff00000;@+break;
@y
 case nan: x=shift_right(f,2,true);@+x.h|=0x7ff00000;@+break;
@z

@x [40] l.681 C99 prototypes for C2x.
@ @<Subr...@>=
tetra store_sf @,@,@[ARGS((octa))@];@+@t}\6{@>
tetra store_sf(x)
  octa x; /* 64 bits to be loaded into a 32-bit word */
@y
@ @<External routines@>=
tetra store_sf(
  octa x) /* 64 bits to be loaded into a 32-bit word */
@z

@x [40] l.686 RAII.
  octa f;@+tetra z;@+int e;@+char s;@+ftype t;
  t=funpack(x,&f,&e,&s);
@y
  octa f;@+tetra z;@+int e;@+char s;@+ftype t=funpack(x,&f,&e,&s);
@z

@x [40] l.689 Change from MMIX home.
 case zro: z=0;@+break;
@y
 default: case zro: z=0;@+break;
@z

@x [41] l.706 C99 prototypes for C2x.
@<Subr...@>=
octa fmult @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
octa fmult(y,z)
  octa y,z;
@y
@<External routines@>=
octa fmult(
  octa y, octa z)
@z

@x [41] l.711 RAII.
  ftype yt,zt;
  int ye,ze;
  char ys,zs;
  octa x,xf,yf,zf;
  register int xe;
  register char xs;
  yt=funpack(y,&yf,&ye,&ys);
  zt=funpack(z,&zf,&ze,&zs);
  xs=ys+zs-'+'; /* will be |'-'| when the result is negative */
@y
  octa x,xf,yf,zf;
  int ye,ze;
  char ys,zs;
  ftype yt=funpack(y,&yf,&ye,&ys),@|zt=funpack(z,&zf,&ze,&zs);
  register int xe;
  register char xs=ys+zs-'+'; /* will be |'-'| when the result is negative */
@z

@x [41] l.722 Change from MMIX home.
 case 4*zro+zro: case 4*zro+num: case 4*num+zro: x=zero_octa;@+break;
@y
 default: case 4*zro+zro: case 4*zro+num: case 4*num+zro: x=zero_octa;@+break;
@z

@x [42] l.734 GCC warning.
case 4*zro+nan: case 4*num+nan: case 4*inf+nan:
@y
  @=/* else fall through */@>@;
case 4*zro+nan: case 4*num+nan: case 4*inf+nan:
@z

@x [44] l.749 C99 prototypes for C2x.
@ @<Subr...@>=
octa fdivide @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
octa fdivide(y,z)
  octa y,z;
@y
@ @<External routines@>=
octa fdivide(
  octa y, octa z)
@z

@x [44] l.754 RAII.
  ftype yt,zt;
  int ye,ze;
  char ys,zs;
  octa x,xf,yf,zf;
  register int xe;
  register char xs;
  yt=funpack(y,&yf,&ye,&ys);
  zt=funpack(z,&zf,&ze,&zs);
  xs=ys+zs-'+'; /* will be |'-'| when the result is negative */
@y
  octa x,xf,yf,zf;
  int ye,ze;
  char ys,zs;
  ftype yt=funpack(y,&yf,&ye,&ys),@|zt=funpack(z,&zf,&ze,&zs);
  register int xe;
  register char xs=ys+zs-'+'; /* will be |'-'| when the result is negative */
@z

@x [44] l.767 GCC warning. Change from MMIX home.
 case 4*inf+num: case 4*inf+zro: x=inf_octa;@+break;
 case 4*zro+zro: case 4*inf+inf: x=standard_NaN;
@y
  @=/* fall through */@>@;
 case 4*inf+num: case 4*inf+zro: x=inf_octa;@+break;
 default: case 4*zro+zro: case 4*inf+inf: x=standard_NaN;
@z

@x [45] l.781 Issue #16.
  xf=shift_right(xf,1,1);
@y
  xf=shift_right(xf,1,true);
@z

@x [46] l.791 C99 prototypes for C2x.
@<Subr...@>=
octa fplus @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
octa fplus(y,z)
  octa y,z;
@y
@<External routines@>=
octa fplus(
  octa y, octa z)
@z

@x [46] l.796 RAII.
  ftype yt,zt;
  int ye,ze;
  char ys,zs;
  octa x,xf,yf,zf;
  register int xe,d;
  register char xs;
  yt=funpack(y,&yf,&ye,&ys);
  zt=funpack(z,&zf,&ze,&zs);
@y
  octa x,xf,yf,zf;
  int ye,ze;
  char ys,zs;
  ftype yt=funpack(y,&yf,&ye,&ys),@|zt=funpack(z,&zf,&ze,&zs);
  register int xe,d;
  register char xs;
@z

@x [46] l.811 GCC warning.
 case 4*num+inf: case 4*zro+inf: x=inf_octa;@+xs=zs;@+break;
@y
  @=/* else fall through */@>@;
 case 4*num+inf: case 4*zro+inf: x=inf_octa;@+xs=zs;@+break;
@z

@x [46] l.815 GCC warning. Change from MMIX home.
 case 4*zro+zro: x=zero_octa;
@y
  @=/* else fall through */@>@;
 default: case 4*zro+zro: x=zero_octa;
@z

@x [47] l.831 Issue #16.
    if (xf.h>=0x800000) xe++, d=xf.l&1, xf=shift_right(xf,1,1), xf.l|=d;
@y
    if (xf.h>=0x800000) xe++, d=xf.l&1, xf=shift_right(xf,1,true), xf.l|=d;
@z

@x [47] l.834 Issue #16.
    if (xf.h>=0x800000) xe++, d=xf.l&1, xf=shift_right(xf,1,1), xf.l|=d;
@y
    if (xf.h>=0x800000) xe++, d=xf.l&1, xf=shift_right(xf,1,true), xf.l|=d;
@z

@x [49] l.862 Compound literal and issue #16.
  if (d<=2) zf=shift_right(zf,d,1); /* exact result */
  else if (d>54) zf.h=0, zf.l=1; /* tricky but OK */
@y
  if (d<=2) zf=shift_right(zf,d,true); /* exact result */
  else if (d>54) zf=(octa){0,1}; /* tricky but OK */
@z

@x [49] l.867 Issue #16.
    zf=shift_right(o,d,1);
@y
    zf=shift_right(o,d,true);
@z

@x [50] l.879
or |e| is negative. It returns 1 if |s=0| and $y\approx z\ (e)$ or if
|s!=0| and $y\sim z\ (e)$,
@y
or |e| is negative. It returns 1 if |s=false| and $y\approx z\ (e)$ or if
|s=true| and $y\sim z\ (e)$,
@z

@x [50] l.884 C99 prototypes for C2x.
@<Subr...@>=
int fepscomp @,@,@[ARGS((octa,octa,octa,int))@];@+@t}\6{@>
int fepscomp(y,z,e,s)
  octa y,z,e; /* the operands */
  int s; /* test similarity? */
@y
@<External routines@>=
int fepscomp(
  octa y, octa z, octa e, /* the operands */
  bool s) /* test similarity? */
@z

@x [51] l.932 Issue #16.
else ef=shift_right(ef,1021-ee,1);
@y
else ef=shift_right(ef,1021-ee,true);
@z

@x [53] l.959 Issue #16.
else o=shift_right(zf,d,1),oo=shift_left(o,d);
@y
else o=shift_right(zf,d,true),oo=shift_left(o,d);
@z

@x [54] l.973
@<Subr...@>=
static void bignum_times_ten @,@,@[ARGS((bignum*))@];
static void bignum_dec @,@,@[ARGS((bignum*,bignum*,tetra))@];
static int bignum_compare @,@,@[ARGS((bignum*,bignum*))@];
void print_float @,@,@[ARGS((octa))@];@+@t}\6{@>
void print_float(x)
  octa x;
@y
@<External routines@>=
void print_float(
  octa x)
@z

@x [57] l.1055
  f.h=0x3fffff, f.l=0xffffffff;
  g.h=0x400000, g.l=2;
@y
  f=(octa){0x3fffff,0xffffffff};
  g=(octa){0x400000,2};
@z

@x [60] l.1122 C99 prototypes for C2x.
static void bignum_times_ten(f)
  bignum *f;
@y
static void bignum_times_ten(
  bignum *f)
@z

@x [61] l.1140 C99 prototypes for C2x.
static int bignum_compare(f,g)
  bignum *f,*g;
@y
static int bignum_compare(
  bignum *f, bignum *g)
@z

@x [62] l.1157 C99 prototypes for C2x.
static void bignum_dec(f,g,r)
  bignum *f,*g;
  tetra r; /* the radix */
@y
static void bignum_dec(
  bignum *f, bignum *g,
  tetra r) /* the radix */
@z

@x [63] l.1198 Issue #16.
ff.dat[k-1]=shift_right(f,magic_offset+28-e-28*k,1).l&0xfffffff;
gg.dat[k-1]=shift_right(g,magic_offset+28-e-28*k,1).l&0xfffffff;
ff.dat[k]=shift_right(f,magic_offset-e-28*k,1).l&0xfffffff;
gg.dat[k]=shift_right(g,magic_offset-e-28*k,1).l&0xfffffff;
@y
ff.dat[k-1]=shift_right(f,magic_offset+28-e-28*k,true).l&0xfffffff;
gg.dat[k-1]=shift_right(g,magic_offset+28-e-28*k,true).l&0xfffffff;
ff.dat[k]=shift_right(f,magic_offset-e-28*k,true).l&0xfffffff;
gg.dat[k]=shift_right(g,magic_offset-e-28*k,true).l&0xfffffff;
@z

@x [65] l.1262
  while (1) {
@y
  while (true) {
@z

@x [67] l.1301 Change from MMIX home.
else if (strlen(s)>=e) printf("%.*s.%s",e,s,s+e);
@y
else if (strlen(s)>=(size_t)e) printf("%.*s.%s",e,s,s+e);
@z

@x [68] l.1341 C99 prototypes for C2x.
@<Subr...@>=
static void bignum_double @,@,@[ARGS((bignum*))@];
int scan_const @,@,@[ARGS((char*))@];@+@t}\6{@>
int scan_const(s)
  char *s;
@y
@<External routines@>=
int scan_const(
  char *s)
@z

@x [68] l.1348 RAII.
  val.h=val.l=0;
@y
  val=zero_octa;
@z

@x [68] l.1357 Change from MMIX home.
 no_const_found: next_char=s;@+return -1;
@y
  next_char=s;@+return -1;
@z

@x [69] l.1360
@ @<Glob...@>=
octa val; /* value returned by |scan_const| */
char *next_char; /* pointer returned by |scan_const| */
@y
@ @<External variables@>=
Extern octa val; /* value returned by |scan_const| */
Extern char *next_char; /* pointer returned by |scan_const| */
@z

@x [73] l.1402 GCC warning.
    if (q>buf0 || *p!='0')
       if (q<buf_max) *q++=*p;
       else if (*(q-1)=='0') *(q-1)=*p;
@y
    if (q>buf0 || *p!='0') {
       if (q<buf_max) *q++=*p;
       else if (*(q-1)=='0') *(q-1)=*p; }
@z

@x [76] l.1439 GCC warning.
register int zeros; /* leading zeros removed after decimal point */
@y
register int zeros=0; /* leading zeros removed after decimal point */
@z

@x [79] l.1483 Change from MMIX home.
 make_it_zero: exp=-99999;@+ goto packit;
@y
  exp=-99999;@+ goto packit;
@z

@x [82] l.1515 C99 prototypes for C2x.
static void bignum_double(f)
  bignum *f;
@y
static void bignum_double(
  bignum *f)
@z

@x [85] l.1578 C99 prototypes for C2x.
@<Subr...@>=
int fcomp @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
int fcomp(y,z)
  octa y,z;
@y
@<External routines@>=
int fcomp(
  octa y, octa z)
@z

@x [85] l.1583 RAII.
  ftype yt,zt;
  int ye,ze;
  char ys,zs;
  octa yf,zf;
  register int x;
  yt=funpack(y,&yf,&ye,&ys);
  zt=funpack(z,&zf,&ze,&zs);
@y
  octa yf,zf;
  int ye,ze;
  char ys,zs;
  ftype yt=funpack(y,&yf,&ye,&ys),@|zt=funpack(z,&zf,&ze,&zs);
  register int x=0;
@z

@x [85] l.1593 Change from MMIX home.
 case 4*zro+zro: return 0;
@y
 default: case 4*zro+zro: return 0;
@z

@x [86] l.1611 C99 prototypes for C2x.
@<Subr...@>=
octa fintegerize @,@,@[ARGS((octa,int))@];@+@t}\6{@>
octa fintegerize(z,r)
  octa z; /* the operand */
  int r; /* the rounding mode */
@y
@<External routines@>=
octa fintegerize(
  octa z, /* the operand */
  int r) /* the rounding mode */
@z

@x [86] l.1617 RAII.
  ftype zt;
  int ze;
  char zs;
  octa xf,zf;
  zt=funpack(z,&zf,&ze,&zs);
@y
  octa xf,zf;
  int ze;
  char zs;
  ftype zt=funpack(z,&zf,&ze,&zs);
@z

@x [86] l.1625 GCC warning. Change from MMIX home.
 case inf: case zro: return z;
@y
  @=/* else fall through */@>@;
 case inf: case zro: default: return z;
@z

@x [87] l.1632 Compound literal.
if (ze<=1020) xf.h=0,xf.l=1;
@y
if (ze<=1020) xf=(octa){0,1};
@z

@x [87] l.1634 Issue #16.
  xf=shift_right(zf,1074-ze,1);
@y
  xf=shift_right(zf,1074-ze,true);
@z

@x [87] l.1647 Compound literal.
if (xf.l) xf.h=0x3ff00000, xf.l=0;
@y
if (xf.l) xf=(octa){0x3ff00000, 0};
@z

@x [88] l.1653 C99 prototypes for C2x.
@<Subr...@>=
octa fixit @,@,@[ARGS((octa,int))@];@+@t}\6{@>
octa fixit(z,r)
  octa z; /* the operand */
  int r; /* the rounding mode */
@y
@<External routines@>=
octa fixit(
  octa z, /* the operand */
  int r) /* the rounding mode */
@z

@x [88] l.1659 RAII.
  ftype zt;
  int ze;
  char zs;
  octa zf,o;
  zt=funpack(z,&zf,&ze,&zs);
@y
  octa zf,o;
  int ze;
  char zs;
  ftype zt=funpack(z,&zf,&ze,&zs);
@z

@x [88] l.1667 Change from MMIX home.
 case zro: return zero_octa;
@y
 case zro: default: return zero_octa;
@z

@x [88] l.1669 Issue #16.
   if (ze<=1076) o=shift_right(zf,1076-ze,1);
@y
   if (ze<=1076) o=shift_right(zf,1076-ze,true);
@z

@x [89] l.1684 C99 prototypes for C2x.
@<Subr...@>=
octa floatit @,@,@[ARGS((octa,int,int,int))@];@+@t}\6{@>
octa floatit(z,r,u,p)
  octa z; /* octabyte to float */
  int r; /* rounding mode */
  int u; /* unsigned? */
  int p; /* short precision? */
@y
@<External routines@>=
octa floatit(
  octa z, /* octabyte to float */
  int r, /* rounding mode */
  bool u, /* unsigned? */
  bool p) /* short precision? */
@z

@x [89] l.1703 Issue #16.
    z=shift_right(z,1,1);
@y
    z=shift_right(z,1,true);
@z

@x [90] l.1712 RAII.
  register int ex;@+register tetra t;
  t=sfpack(z,e,s,r);
  ex=exceptions;
@y
  register tetra t=sfpack(z,e,s,r);
  register int ex=exceptions;
@z

@x [91] l.1721 C99 prototypes for C2x.
@<Subr...@>=
octa froot @,@,@[ARGS((octa,int))@];@+@t}\6{@>
octa froot(z,r)
  octa z; /* the operand */
  int r; /* the rounding mode */
@y
@<External routines@>=
octa froot(
  octa z, /* the operand */
  int r) /* the rounding mode */
@z

@x [91] l.1727 RAII.
  ftype zt;
  int ze;
  char zs;
  octa x,xf,rf,zf;
  register int xe,k;
  if (!r) r=cur_round;
  zt=funpack(z,&zf,&ze,&zs);
@y
  octa x,xf,rf,zf;
  int ze;
  char zs;
  ftype zt=funpack(z,&zf,&ze,&zs);
  register int xe,k;
  if (!r) r=cur_round;
@z

@x [91] l.1738 Change from MMIX home.
 case inf: case zro: x=z;@+break;
@y
 default: case inf: case zro: x=z;@+break;
@z

@x [92] l.1754 Compound literal.
xf.h=0, xf.l=2;
@y
xf=(octa){0, 2};
@z

@x [92] l.1757 Compound literal.
rf.h=0, rf.l=(zf.h>>22)-1;
@y
rf=(octa){0, (zf.h>>22)-1};
@z

@x [93] l.1777 C99 prototypes for C2x.
@<Subr...@>=
octa fremstep @,@,@[ARGS((octa,octa,int))@];@+@t}\6{@>
octa fremstep(y,z,delta)
  octa y,z;
  int delta;
@y
@<External routines@>=
octa fremstep(
  octa y, octa z,
  int delta)
@z

@x [93] l.1783 RAII.
  ftype yt,zt;
  int ye,ze;
  char xs,ys,zs;
  octa x,xf,yf,zf;
  register int xe,thresh,odd;
  yt=funpack(y,&yf,&ye,&ys);
  zt=funpack(z,&zf,&ze,&zs);
@y
  octa x,xf,yf,zf;
  int ye,ze;
  char xs,ys,zs;
  ftype yt=funpack(y,&yf,&ye,&ys),@|zt=funpack(z,&zf,&ze,&zs);
  register int xe,thresh,odd;
@z

@x [93] l.1797 Change from MMIX home.
 zero_out: x=zero_octa;
@y
 default: zero_out: x=zero_octa;
@z

@x [94] l.1823 Issue #16.
yf=shift_right(yf,1,1);
@y
yf=shift_right(yf,1,true);
@z

@x [96] l.1845 Improved module structure with interface.
@* Index.
@y
@* Public interface. This program module is central to the whole \MMIX\ system.
Each user of its functionality should include the following header file.

@(mmix-arith.h@>=
#ifndef MMIX_ARITH_H
#define MMIX_ARITH_H
@#
#include <stdbool.h> /* |@!bool| */
#include <stdint.h>  /* |@!uint32_t| */
@#
#define Extern extern
@<Tetrabyte and octabyte type definitions@>@;
@<Exported constants@>@;
@<External variables@>@;
@<External prototypes@>@;
#undef Extern
@#
#endif /* |MMIX_ARITH_H| */

@ @<Exported constants@>=
#define zero_octa @[(octa){0,0}@] /* |zero_octa.h=zero_octa.l=0| */
#define neg_one @[(octa){-1,-1}@] /* |neg_one.h=neg_one.l=-1| */
#define inf_octa @[(octa){0x7ff00000,0}@] /* floating point $+\infty$ */
#define standard_NaN @[(octa){0x7ff80000,0}@] /* floating point NaN(.5) */
@#
#define sign_bit ((tetra)0x80000000)

@ @<External proto...@>=
@^prototypes for functions@>
Extern void print_octa(octa);
  /* standard output format */
@#
Extern octa oplus(octa,octa);
  /* unsigned $y+z$ */
Extern octa ominus(octa,octa);
  /* unsigned $y-z$ */
Extern octa incr(octa,int);
  /* unsigned $y+\delta$ ($\delta$ is signed) */
Extern octa shift_left(octa,int);
  /* $y\LL s$, $0\le s\le64$ */
Extern octa shift_right(octa,int,bool);
  /* $y\GG s$, signed if |!u| */
Extern octa omult(octa,octa);
  /* unsigned $(|aux|,x)=y\times z$ */
Extern octa signed_omult(octa,octa);
  /* signed $x=y\times z$, setting |overflow| */
Extern octa odiv(octa,octa,octa);
  /* unsigned $(x,y)/z$; $|aux|=(x,y)\bmod z$ */
Extern octa signed_odiv(octa,octa);
  /* signed $y/z$, when $z\ne0$; $|aux|=y\bmod z$ */
@#
Extern octa onot(octa);
  /* $\bar x$ */
Extern octa oor(octa,octa);
  /* $y\lor z$ */
Extern octa oorn(octa,octa);
  /* $y\lor\bar z$ */
Extern octa onor(octa,octa);
  /* $\overline{y\lor z}$ */
Extern octa oand(octa,octa);
  /* $y\land z$ */
Extern octa oandn(octa,octa);
  /* $y\land \bar z$ */
Extern octa onand(octa,octa);
  /* $\overline{y\land z}$ */
Extern octa oxor(octa,octa);
  /* $y\oplus z$ */
Extern octa onxor(octa,octa);
  /* $\overline{y\oplus z}$ */
@#
Extern int count_bits(tetra);
  /* $x=\nu(z)$ */
@#
Extern tetra byte_diff(tetra,tetra);
  /* half of \.{BDIF} */
Extern tetra wyde_diff(tetra,tetra);
  /* half of \.{WDIF} */
Extern octa bool_mult(octa,octa,bool);
  /* \.{MOR} or \.{MXOR} */
@#
Extern octa load_sf(tetra);
  /* load short float */
Extern tetra store_sf(octa);
  /* store short float */
Extern octa fmult(octa,octa);
  /* floating point $x=y\otimes z$ */
Extern octa fdivide(octa,octa);
  /* floating point $x=y\oslash z$ */
Extern octa fplus(octa,octa);
  /* floating point $x=y\oplus z$ */
Extern int fepscomp(octa,octa,octa,bool);
  /* $x=|sim|\,?\,[y\sim z\ (\epsilon)]\,:\,[y\approx z\ (\epsilon)]$ */
Extern void print_float(octa);
  /* print octabyte as floating decimal */
Extern int scan_const(char*);
  /* |val| = floating or integer constant; returns the type */
Extern int fcomp(octa,octa);
  /* $-1$, 0, 1, or 2 if $y<z$, $y=z$, $y>z$, $y\parallel z$ */
Extern octa fintegerize(octa,int);
  /* floating point $x={\rm round}(z)$ */
Extern octa fixit(octa,int);
  /* float to fix */
Extern octa floatit(octa,int,bool,bool);
  /* fix to float */
Extern octa froot(octa,int);
  /* floating point $x=\sqrt z$ */
Extern octa fremstep(octa,octa,int);
  /* floating point $x\,{\rm rem}\,z=y\,{\rm rem}\,z$ */

@* Index.
@z
