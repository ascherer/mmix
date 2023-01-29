Use C99 standard types instead of homebrewn typedefs.

@x l.13
@s bool normal @q unreserve a C++ keyword @>
@y
@z

@x l.35
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

@x l.51
@<Tetra...@>=
typedef unsigned int tetra;
 /* for systems conforming to the LP-64 data model */
@y
@s uint32_t int
@<Tetra...@>=
typedef uint32_t tetra;
@z

@x l.305
if (u[j+n]!=k) {
@y
if (u[j+n]!=(tetra)k) {
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

@x l.540
 case ROUND_NEAR: o=incr(o, o.l&4? 2: 1);@+break;
@y
 case ROUND_NEAR: default: o=incr(o, o.l&4? 2: 1);@+break;
@z

@x l.689
 case zro: z=0;@+break;
@y
 default: case zro: z=0;@+break;
@z

@x l.716
  register char xs;
@y
  register char xs='+';
@z

@x l.759
  register char xs;
@y
  register char xs='+';
@z

@x l.801
  register char xs;
@y
  register char xs='+';
@z

@x l.1301
else if (strlen(s)>=e) printf("%.*s.%s",e,s,s+e);
@y
else if (strlen(s)>=(size_t)e) printf("%.*s.%s",e,s,s+e);
@z

@x l.1357
 no_const_found: next_char=s;@+return -1;
@y
  next_char=s;@+return -1;
@z

@x l.1402
    if (q>buf0 || *p!='0')
       if (q<buf_max) *q++=*p;
       else if (*(q-1)=='0') *(q-1)=*p;
@y
    if (q>buf0 || *p!='0') {
       if (q<buf_max) *q++=*p;
       else if (*(q-1)=='0') *(q-1)=*p; }
@z

@x l.1483
 make_it_zero: exp=-99999;@+ goto packit;
@y
  exp=-99999;@+ goto packit;
@z

@x l.1587
  register int x;
@y
  register int x=0;
@z

@x l.1626
 case num: @<Integerize and |return|@>;
  }
@y
 case num: @<Integerize and |return|@>;
  }
  return z;
@z

@x l.1676
  return (zs=='-'? ominus(zero_octa,o): o);
  }
@y
  return (zs=='-'? ominus(zero_octa,o): o);
  }
  return z;
@z
