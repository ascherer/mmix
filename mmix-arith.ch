Use C99 standard types instead of homebrewn typedefs.

@x [0] l.13
@s bool normal @q unreserve a C++ keyword @>
@y
@z

@x [1] l.34
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

@x [1] l.37
@<Stuff for \CEE/ preprocessor@>@;
typedef enum{@+false,true@+} bool;
@<Tetrabyte and octabyte type definitions@>@;
@y
@z

@x [1] l.41
@<Global variables@>@;
@y
@<Global variables@>@;
@<Private variable@>@;
@<Internal prototypes@>@;
@z

@x [3] l.51
@<Tetra...@>=
typedef unsigned int tetra;
 /* for systems conforming to the LP-64 data model */
@y
@s uint32_t int
@<Tetra...@>=
typedef uint32_t tetra;
@z

@x [4] l.69
octa zero_octa; /* |zero_octa.h=zero_octa.l=0| */
@y
octa zero_octa={0,0}; /* |zero_octa.h=zero_octa.l=0| */
@z

@x [5] l.78
octa oplus @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
@y
@z

@x [5] l.83
{@+ octa x;
  x.h=y.h+z.h;@+
  x.l=y.l+z.l;
@y
{@+ octa x = {y.h+z.h, y.l+z.l};
@z

@x [5] l.88
octa ominus @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
@y
@z

@x [5] l.91
{@+ octa x;
  x.h=y.h-z.h;@+
  x.l=y.l-z.l;
@y
{@+ octa x={y.h-z.h, y.l-z.l};
@z

@x [6] l.102
octa incr @,@,@[ARGS((octa,int))@];@+@t}\6{@>
@y
@z

@x [6] l.106
{@+ octa x;
  x.h=y.h;@+ x.l=y.l+delta;
@y
{@+ octa x={y.h, y.l+delta};
@z

@x [6] l.110
  }@+else if (x.l>y.l) x.h--;
@y
  }@+else {if (x.l>y.l) x.h--;}
@z

@x [7] l.117
octa shift_left @,@,@[ARGS((octa,int))@];@+@t}\6{@>
@y
@z

@x [7] l.129
octa shift_right @,@,@[ARGS((octa,int,int))@];@+@t}\6{@>
@y
@z

@x [9] l.150
octa omult @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
@y
@z

@x [12] l.191
octa signed_omult @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
@y
@z

@x [12] l.195
  octa acc;
  acc=omult(y,z);
@y
  octa acc=omult(y,z);
@z

@x [13] l.215
octa odiv @,@,@[ARGS((octa,octa,octa))@];@+@t}\6{@>
@y
@z

@x [23] l.305
if (u[j+n]!=k) {
@y
if (u[j+n]!=(tetra)k) {
@z

@x [24] l.317
octa signed_odiv @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
@y
@z

@x [24] l.332
 case 0+0: return q;
@y
  @=/* else fall through */@>@;
 case 0+0: default: return q;
@z

@x [25] l.346
octa oand @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
@y
@z

@x [25] l.349
{@+ octa x;
  x.h=y.h&z.h;@+ x.l=y.l&z.l;
@y
{@+ octa x={y.h&z.h, y.l&z.l};
@z

@x [25] l.354
octa oandn @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
@y
@z

@x [25] l.357
{@+ octa x;
  x.h=y.h&~z.h;@+ x.l=y.l&~z.l;
@y
{@+ octa x={y.h&~z.h, y.l&~z.l};
@z

@x [25] l.362
octa oxor @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
@y
@z

@x [25] l.365
{@+ octa x;
  x.h=y.h^z.h;@+ x.l=y.l^z.l;
@y
{@+ octa x={y.h^z.h, y.l^z.l};
@z

@x [26] l.387
int count_bits @,@,@[ARGS((tetra))@];@+@t}\6{@>
@y
@z

@x [27] l.403
tetra byte_diff @,@,@[ARGS((tetra,tetra))@];@+@t}\6{@>
@y
@z

@x [28] l.421
tetra wyde_diff @,@,@[ARGS((tetra,tetra))@];@+@t}\6{@>
@y
@z

@x [29] l.434
octa bool_mult @,@,@[ARGS((octa,octa,bool))@];@+@t}\6{@>
@y
@z

@x [31] l.505
octa fpack @,@,@[ARGS((octa,int,char,int))@];@+@t}\6{@>
octa fpack(f,e,s,r)
@y
static octa fpack(f,e,s,r)
@z

@x [33] l.532
@ Everything falls together so nicely here, it's almost too good to be true!
@y
@ Everything falls together so nicely here, it's almost too good to be true!
The conditional expression in the case for |ROUND_NEAR|
rounds towards an even number in case of a tie.
@z

again the default case helps the compiler see that no cases are missing.

@x [33] l.540
 case ROUND_NEAR: o=incr(o, o.l&4? 2: 1);@+break;
@y
 case ROUND_NEAR: default: o=incr(o, o.l&4? 2: 1);@+break;
@z

@x [34] l.553
tetra sfpack @,@,@[ARGS((octa,int,char,int))@];@+@t}\6{@>
tetra sfpack(f,e,s,r)
@y
static tetra sfpack(f,e,s,r)
@z

@x [37] l.610
ftype funpack @,@,@[ARGS((octa,octa*,int*,char*))@];@+@t}\6{@>
ftype funpack(x,f,e,s)
@y
static ftype funpack(x,f,e,s)
@z

@x [38] l.636
ftype sfunpack @,@,@[ARGS((tetra,octa*,int*,char*))@];@+@t}\6{@>
ftype sfunpack(x,f,e,s)
@y
static ftype sfunpack(x,f,e,s)
@z

@x [39] l.665
octa load_sf @,@,@[ARGS((tetra))@];@+@t}\6{@>
@y
@z

@x [39] l.669
  octa f,x;@+int e;@+char s;@+ftype t;
  t=sfunpack(z,&f,&e,&s);
@y
  octa f,x;@+int e;@+char s;@+ftype t=sfunpack(z,&f,&e,&s);
@z

@x [40] l.682
tetra store_sf @,@,@[ARGS((octa))@];@+@t}\6{@>
@y
@z

@x [40] l.686
  octa f;@+tetra z;@+int e;@+char s;@+ftype t;
  t=funpack(x,&f,&e,&s);
@y
  octa f;@+tetra z;@+int e;@+char s;@+ftype t=funpack(x,&f,&e,&s);
@z

@x [40] l.689
 case zro: z=0;@+break;
@y
 default: case zro: z=0;@+break;
@z

@x [41] l.707
octa fmult @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
@y
@z

@x [41] l.711
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

@x [41] l.722
 case 4*zro+zro: case 4*zro+num: case 4*num+zro: x=zero_octa;@+break;
@y
 default: case 4*zro+zro: case 4*zro+num: case 4*num+zro: x=zero_octa;@+break;
@z

@x [42] l.734
case 4*zro+nan: case 4*num+nan: case 4*inf+nan:
@y
  @=/* else fall through */@>@;
case 4*zro+nan: case 4*num+nan: case 4*inf+nan:
@z

@x [44] l.750
octa fdivide @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
@y
@z

@x [44] l.754
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

@x [44] l.767
 case 4*inf+num: case 4*inf+zro: x=inf_octa;@+break;
 case 4*zro+zro: case 4*inf+inf: x=standard_NaN;
@y
  @=/* fall through */@>@;
 case 4*inf+num: case 4*inf+zro: x=inf_octa;@+break;
 default: case 4*zro+zro: case 4*inf+inf: x=standard_NaN;
@z

@x [46] l.792
octa fplus @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
@y
@z

@x [46] l.796
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

@x [46] l.811
 case 4*num+inf: case 4*zro+inf: x=inf_octa;@+xs=zs;@+break;
@y
  @=/* else fall through */@>@;
 case 4*num+inf: case 4*zro+inf: x=inf_octa;@+xs=zs;@+break;
@z

@x [46] l.815
 case 4*zro+zro: x=zero_octa;
@y
  @=/* else fall through */@>@;
 default: case 4*zro+zro: x=zero_octa;
@z

@x [50] l.885
int fepscomp @,@,@[ARGS((octa,octa,octa,int))@];@+@t}\6{@>
@y
@z

@x [54] l.974
static void bignum_times_ten @,@,@[ARGS((bignum*))@];
static void bignum_dec @,@,@[ARGS((bignum*,bignum*,tetra))@];
static int bignum_compare @,@,@[ARGS((bignum*,bignum*))@];
void print_float @,@,@[ARGS((octa))@];@+@t}\6{@>
@y
@z

@x [67] l.1301
else if (strlen(s)>=e) printf("%.*s.%s",e,s,s+e);
@y
else if (strlen(s)>=(size_t)e) printf("%.*s.%s",e,s,s+e);
@z

@x [68] l.1342
static void bignum_double @,@,@[ARGS((bignum*))@];
int scan_const @,@,@[ARGS((char*))@];@+@t}\6{@>
@y
@z

@x [68] l.1348
  val.h=val.l=0;
@y
  val=zero_octa;
@z

@x [68] l.1357
 no_const_found: next_char=s;@+return -1;
@y
  next_char=s;@+return -1;
@z

@x [73] l.1402
    if (q>buf0 || *p!='0')
       if (q<buf_max) *q++=*p;
       else if (*(q-1)=='0') *(q-1)=*p;
@y
    if (q>buf0 || *p!='0') {
       if (q<buf_max) *q++=*p;
       else if (*(q-1)=='0') *(q-1)=*p; }
@z

@x [75] l.1431
@d buf_max (buf+777)

@<Glob...@>=
@y
@d buf_max (buf+777)

@<Priv...@>=
@z

@x [76] l.1439
register int zeros; /* leading zeros removed after decimal point */
@y
register int zeros=0; /* leading zeros removed after decimal point */
@z

@x [79] l.1483
 make_it_zero: exp=-99999;@+ goto packit;
@y
  exp=-99999;@+ goto packit;
@z

@x [85] l.1579
int fcomp @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
@y
@z

@x [85] l.1583
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

@x [85] l.1593
 case 4*zro+zro: return 0;
@y
 default: case 4*zro+zro: return 0;
@z

@x [86] l.1612
octa fintegerize @,@,@[ARGS((octa,int))@];@+@t}\6{@>
@y
@z

@x [86] l.1617
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

@x [86] l.1625
 case inf: case zro: return z;
@y
  @=/* else fall through */@>@;
 case inf: case zro: default: return z;
@z

@x [88] l.1654
octa fixit @,@,@[ARGS((octa,int))@];@+@t}\6{@>
@y
@z

@x [88] l.1659
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

@x [88] l.1667
 case zro: return zero_octa;
@y
 case zro: default: return zero_octa;
@z

@x [89] l.1695
octa floatit @,@,@[ARGS((octa,int,int,int))@];@+@t}\6{@>
@y
@z

@x [91] l.1722
octa froot @,@,@[ARGS((octa,int))@];@+@t}\6{@>
@y
@z

@x [91] l.1727
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

@x [91] l.1738
 case inf: case zro: x=z;@+break;
@y
 default: case inf: case zro: x=z;@+break;
@z

@x [93] l.1778
octa fremstep @,@,@[ARGS((octa,octa,int))@];@+@t}\6{@>
@y
@z

@x [93] l.1789
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

@x [93] l.1797
 zero_out: x=zero_octa;
@y
 default: zero_out: x=zero_octa;
@z

@x [96] l.1845
@* Index.  
@y
@* Public interface. This program module, {\mc MMIX-ARITH}, is central to the
whole \MMIX\ system. Each user of its functionality should include the
following header file.

@(mmix-arith.h@>=
#ifndef MMIX_ARITH_H
#define MMIX_ARITH_H
#include <stdbool.h> /* |@!bool| */
#include <stdint.h>  /* |@!uint32_t| */
@#
@<Stuff for \CEE/ preprocessor@>@;
@<Tetrabyte and octabyte type definitions@>@;
@<Exported variables@>@;
@<External prototypes@>@;
@#
#endif /* |MMIX_ARITH_H| */

@ @<Exported...@>=
extern octa zero_octa; /* |zero_octa.h=zero_octa.l=0| */
extern octa neg_one; /* |neg_one.h=neg_one.l=-1| */
extern octa inf_octa; /* floating point $+\infty$ */
extern octa standard_NaN; /* floating point NaN(.5) */
extern octa aux; /* auxiliary output of a subroutine */
extern bool overflow; /* set by certain subroutines for signed arithmetic */
extern int cur_round; /* the current rounding mode */
extern int exceptions; /* bits set by floating point operations */
extern octa val; /* value returned by |scan_const| */
extern char *next_char; /* where a scanned constant ended */

@ @<External proto...@>=
extern octa oplus @,@,@[ARGS((octa,octa))@];
  /* unsigned $y+z$ */
extern octa ominus @,@,@[ARGS((octa,octa))@];
  /* unsigned $y-z$ */
extern octa incr @,@,@[ARGS((octa,int))@];
  /* unsigned $y+\delta$ ($\delta$ is signed) */
extern octa shift_left @,@,@[ARGS((octa,int))@];
  /* $y\LL s$, $0\le s\le64$ */
extern octa shift_right @,@,@[ARGS((octa,int,int))@];
  /* $y\GG s$, signed if |!u| */
extern octa omult @,@,@[ARGS((octa,octa))@];
  /* unsigned $(|aux|,x)=y\times z$ */
extern octa signed_omult @,@,@[ARGS((octa,octa))@];
  /* signed $x=y\times z$, setting |overflow| */
extern octa odiv @,@,@[ARGS((octa,octa,octa))@];
  /* unsigned $(x,y)/z$; $|aux|=(x,y)\bmod z$ */
extern octa signed_odiv @,@,@[ARGS((octa,octa))@];
  /* signed $y/z$, when $z\ne0$; $|aux|=y\bmod z$ */
extern octa oand @,@,@[ARGS((octa,octa))@];
  /* $y\land z$ */
extern octa oandn @,@,@[ARGS((octa,octa))@];
  /* $y\land \bar z$ */
extern octa oxor @,@,@[ARGS((octa,octa))@];
  /* $y\oplus z$ */
extern int count_bits @,@,@[ARGS((tetra))@];
  /* $x=\nu(z)$ */
@#
extern tetra byte_diff @,@,@[ARGS((tetra,tetra))@];
  /* half of \.{BDIF} */
extern tetra wyde_diff @,@,@[ARGS((tetra,tetra))@];
  /* half of \.{WDIF} */
extern octa bool_mult @,@,@[ARGS((octa,octa,bool))@];
  /* \.{MOR} or \.{MXOR} */
@#
extern octa load_sf @,@,@[ARGS((tetra))@];
  /* load short float */
extern tetra store_sf @,@,@[ARGS((octa))@];
  /* store short float */
extern octa fmult @,@,@[ARGS((octa,octa))@];
  /* floating point $x=y\otimes z$ */
extern octa fdivide @,@,@[ARGS((octa,octa))@];
  /* floating point $x=y\oslash z$ */
extern octa fplus @,@,@[ARGS((octa,octa))@];
  /* floating point $x=y\oplus z$ */
extern int fepscomp @,@,@[ARGS((octa,octa,octa,int))@];
  /* $x=|sim|?\ [y\sim z\ (\epsilon)]:\ [y\approx z\ (\epsilon)]$ */
extern void print_float @,@,@[ARGS((octa))@];
  /* print octabyte as floating decimal */
extern int scan_const @,@,@[ARGS((char*))@];
  /* |val| = floating or integer constant; returns the type */
extern int fcomp @,@,@[ARGS((octa,octa))@];
  /* $-1$, 0, 1, or 2 if $y<z$, $y=z$, $y>z$, $y\parallel z$ */
extern octa fintegerize @,@,@[ARGS((octa,int))@];
  /* floating point $x={\rm round}(z)$ */
extern octa fixit @,@,@[ARGS((octa,int))@];
  /* float to fix */
extern octa floatit @,@,@[ARGS((octa,int,int,int))@];
  /* fix to float */
extern octa froot @,@,@[ARGS((octa,int))@];
  /* floating point $x=\sqrt z$ */
extern octa fremstep @,@,@[ARGS((octa,octa,int))@];
  /* floating point $x\,{\rm rem}\,z=y\,{\rm rem}\,z$ */

@ @<Internal...@>=
static octa fpack @,@,@[ARGS((octa,int,char,int))@];
static tetra sfpack @,@,@[ARGS((octa,int,char,int))@];
static ftype funpack @,@,@[ARGS((octa,octa*,int*,char*))@];
static ftype sfunpack @,@,@[ARGS((tetra,octa*,int*,char*))@];
@#
static void bignum_times_ten @,@,@[ARGS((bignum*))@];
static void bignum_dec @,@,@[ARGS((bignum*,bignum*,tetra))@];
static int bignum_compare @,@,@[ARGS((bignum*,bignum*))@];
static void bignum_double @,@,@[ARGS((bignum*))@];

@* Index.
@z
