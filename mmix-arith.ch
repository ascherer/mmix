Use C99 standard types instead of homebrewn typedefs.

@x [0] l.13
@s bool normal @q unreserve a C++ keyword @>
@y
@z

@x [1] l.34
#include <stdio.h>
#include <string.h>
@y
#include "mmix-arith.h" /* we use our own interface first */
@#
#include <stdio.h>
#include <string.h>
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

@x [5] l.78
octa oplus @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
@y
@z

@x [5] l.88
octa ominus @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
@y
@z

@x [6] l.102
octa incr @,@,@[ARGS((octa,int))@];@+@t}\6{@>
@y
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
 case 0+0: return q;
@z

@x l.337
  else return ominus(zero_octa,q);
  }
@y
  else return ominus(zero_octa,q);
  }
  return q;
@z

@x [25] l.346
octa oand @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
@y
@z

@x [25] l.354
octa oandn @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
@y
@z

@x [25] l.362
octa oxor @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
@y
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
@y
@z

again the default case helps the compiler see that no cases are missing.

@x [33] l.540
 case ROUND_NEAR: o=incr(o, o.l&4? 2: 1);@+break;
@y
 case ROUND_NEAR: default: o=incr(o, o.l&4? 2: 1);@+break;
@z

@x [34] l.553
tetra sfpack @,@,@[ARGS((octa,int,char,int))@];@+@t}\6{@>
@y
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

@x [40] l.682
tetra store_sf @,@,@[ARGS((octa))@];@+@t}\6{@>
@y
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

@x [41] l.716
  register char xs;
@y
  register char xs='+';
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

@x [44] l.759
  register char xs;
@y
  register char xs='+';
@z

@x l.767
 case 4*inf+num: case 4*inf+zro: x=inf_octa;@+break;
@y
  @=/* fall through */@>@;
 case 4*inf+num: case 4*inf+zro: x=inf_octa;@+break;
@z

@x [46] l.792
octa fplus @,@,@[ARGS((octa,octa))@];@+@t}\6{@>
@y
@z

@x [46] l.801
  register char xs;
@y
  register char xs='+';
@z

@x l.811
 case 4*num+inf: case 4*zro+inf: x=inf_octa;@+xs=zs;@+break;
@y
  @=/* else fall through */@>@;
 case 4*num+inf: case 4*zro+inf: x=inf_octa;@+xs=zs;@+break;
@z

@x l.815
 case 4*zro+zro: x=zero_octa;
@y
  @=/* else fall through */@>@;
 case 4*zro+zro: x=zero_octa;
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
static char buf[785]="00000000"; /* where we put significant input digits */
@y
@d buf_max (buf+777)

@<Priv...@>=
static char buf[785]="00000000"; /* where we put significant input digits */
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

@x [85] l.1587
  register int x;
@y
  register int x=0;
@z

@x [86] l.1612
octa fintegerize @,@,@[ARGS((octa,int))@];@+@t}\6{@>
@y
@z

@x [86] l.1625
 case inf: case zro: return z;
 case num: @<Integerize and |return|@>;
  }
@y
  @=/* else fall through */@>@;
 case inf: case zro: return z;
 case num: @<Integerize and |return|@>;
  }
  return z;
@z

@x [88] l.1654
octa fixit @,@,@[ARGS((octa,int))@];@+@t}\6{@>
@y
@z

@x [88] l.1676
  return (zs=='-'? ominus(zero_octa,o): o);
  }
@y
  return (zs=='-'? ominus(zero_octa,o): o);
  }
  return z;
@z

@x [89] l.1695
octa floatit @,@,@[ARGS((octa,int,int,int))@];@+@t}\6{@>
@y
@z

@x [91] l.1722
octa froot @,@,@[ARGS((octa,int))@];@+@t}\6{@>
@y
@z

@x [93] l.1778
octa fremstep @,@,@[ARGS((octa,octa,int))@];@+@t}\6{@>
@y
@z

@x [96] l.1845
@* Index.  
@y
@* Public interface.

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
extern octa zero_octa;
extern octa neg_one;
extern octa inf_octa;
extern octa standard_NaN;
extern octa aux;
extern bool overflow;
extern int cur_round;
extern int exceptions;
extern octa val;
extern char *next_char;

@ @<External proto...@>=
extern octa oplus @,@,@[ARGS((octa,octa))@];
extern octa ominus @,@,@[ARGS((octa,octa))@];
extern octa incr @,@,@[ARGS((octa,int))@];
extern octa shift_left @,@,@[ARGS((octa,int))@];
extern octa shift_right @,@,@[ARGS((octa,int,int))@];
extern octa omult @,@,@[ARGS((octa,octa))@];
extern octa signed_omult @,@,@[ARGS((octa,octa))@];
extern octa odiv @,@,@[ARGS((octa,octa,octa))@];
extern octa signed_odiv @,@,@[ARGS((octa,octa))@];
extern octa oand @,@,@[ARGS((octa,octa))@];
extern octa oandn @,@,@[ARGS((octa,octa))@];
extern octa oxor @,@,@[ARGS((octa,octa))@];
extern int count_bits @,@,@[ARGS((tetra))@];
extern tetra byte_diff @,@,@[ARGS((tetra,tetra))@];
extern tetra wyde_diff @,@,@[ARGS((tetra,tetra))@];
extern octa bool_mult @,@,@[ARGS((octa,octa,bool))@];
extern octa fpack @,@,@[ARGS((octa,int,char,int))@];
extern tetra sfpack @,@,@[ARGS((octa,int,char,int))@];
extern octa load_sf @,@,@[ARGS((tetra))@];
extern tetra store_sf @,@,@[ARGS((octa))@];
extern octa fmult @,@,@[ARGS((octa,octa))@];
extern octa fdivide @,@,@[ARGS((octa,octa))@];
extern octa fplus @,@,@[ARGS((octa,octa))@];
extern int fepscomp @,@,@[ARGS((octa,octa,octa,int))@];
extern void print_float @,@,@[ARGS((octa))@];
extern int scan_const @,@,@[ARGS((char*))@];
extern int fcomp @,@,@[ARGS((octa,octa))@];
extern octa fintegerize @,@,@[ARGS((octa,int))@];
extern octa fixit @,@,@[ARGS((octa,int))@];
extern octa floatit @,@,@[ARGS((octa,int,int,int))@];
extern octa froot @,@,@[ARGS((octa,int))@];
extern octa fremstep @,@,@[ARGS((octa,octa,int))@];

@ @<Internal...@>=
static ftype funpack @,@,@[ARGS((octa,octa*,int*,char*))@];
static ftype sfunpack @,@,@[ARGS((tetra,octa*,int*,char*))@];
static void bignum_times_ten @,@,@[ARGS((bignum*))@];
static void bignum_dec @,@,@[ARGS((bignum*,bignum*,tetra))@];
static int bignum_compare @,@,@[ARGS((bignum*,bignum*))@];
static void bignum_double @,@,@[ARGS((bignum*))@];

@* Index.
@z
