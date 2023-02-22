Use C99 standard types instead of homebrewn typedefs.

@x [0] l.13
@s bool normal @q unreserve a C++ keyword @>
@y
@z

@x [1] l.35
#include <string.h>
@y
#include <string.h>
#include <stdbool.h>
#include <stdint.h>
@z

@x l.38
typedef enum{@+false,true@+} bool;
@y
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

@x [23] l.305
if (u[j+n]!=k) {
@y
if (u[j+n]!=(tetra)k) {
@z

@x [24] l.332
 case 0+0: return q;
@y
  @=/* else fall through */@>
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

again the default case helps the compiler see that no cases are missing.

@x [33] l.540
 case ROUND_NEAR: o=incr(o, o.l&4? 2: 1);@+break;
@y
 case ROUND_NEAR: default: o=incr(o, o.l&4? 2: 1);@+break;
@z

@x [40] l.689
 case zro: z=0;@+break;
@y
 default: case zro: z=0;@+break;
@z

@x [41] l.716
  register char xs;
@y
  register char xs='+';
@z

@x [42] l.734
case 4*zro+nan: case 4*num+nan: case 4*inf+nan:
@y
  @=/* else fall through */@>
case 4*zro+nan: case 4*num+nan: case 4*inf+nan:
@z

@x [44] l.759
  register char xs;
@y
  register char xs='+';
@z

@x l.767
 case 4*inf+num: case 4*inf+zro: x=inf_octa;@+break;
@y
  @=/* fall through */@>
 case 4*inf+num: case 4*inf+zro: x=inf_octa;@+break;
@z

@x [46] l.801
  register char xs;
@y
  register char xs='+';
@z

@x l.811
 case 4*num+inf: case 4*zro+inf: x=inf_octa;@+xs=zs;@+break;
@y
  @=/* else fall through */@>
 case 4*num+inf: case 4*zro+inf: x=inf_octa;@+xs=zs;@+break;
@z

@x l.815
 case 4*zro+zro: x=zero_octa;
@y
  @=/* else fall through */@>
 case 4*zro+zro: x=zero_octa;
@z

@x [67] l.1301
else if (strlen(s)>=e) printf("%.*s.%s",e,s,s+e);
@y
else if (strlen(s)>=(size_t)e) printf("%.*s.%s",e,s,s+e);
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

@x [79] l.1483
 make_it_zero: exp=-99999;@+ goto packit;
@y
  exp=-99999;@+ goto packit;
@z

@x [85] l.1587
  register int x;
@y
  register int x=0;
@z

@x [86] l.1625
 case inf: case zro: return z;
 case num: @<Integerize and |return|@>;
  }
@y
  @=/* else fall through */@>
 case inf: case zro: return z;
 case num: @<Integerize and |return|@>;
  }
  return z;
@z

@x [88] l.1676
  return (zs=='-'? ominus(zero_octa,o): o);
  }
@y
  return (zs=='-'? ominus(zero_octa,o): o);
  }
  return z;
@z
