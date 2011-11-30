k ist an int, where u is an array of tetras (unsigned int)

@x
if (u[j+n]!=k) {
@y
if (u[j+n]!=(tetra)k) {
@z

here the switch statement lacks a default statement 
since there is no return statement after the switch
this change helps the compiler to see that every execution
path reaches a return statement.

@x
 case 0+0: return q;
@y
 case 0+0: default: return q;
@z

in old style C (without function propotypes)
arguments to functions are promotet to type int or double.
So having a parameter of type char might lead to a missmatch.

@x
octa fpack @,@,@[ARGS((octa,int,char,int))@];@+@t}\6{@>
@y
octa fpack @,@,@[ARGS((octa,int,int,int))@];@+@t}\6{@>
@z

the sign is used in fpack and funpack which where changed to use ints

@x
  char s; /* the sign */
@y
  int s; /* the sign */
@z

again the default case helps the compiler see that no cases are missing.

@x
 case ROUND_NEAR: o=incr(o, o.l&4? 2: 1);@+break;
@y
 case ROUND_NEAR: default: o=incr(o, o.l&4? 2: 1);@+break;
@z

same as fpack (see above)

@x
tetra sfpack @,@,@[ARGS((octa,int,char,int))@];@+@t}\6{@>
@y
tetra sfpack @,@,@[ARGS((octa,int,int,int))@];@+@t}\6{@>
@z

same as above
@x
  char s; /* the sign */
@y
  int s; /* the sign */
@z

strlen returns size_t which is unsigned. comparing it
to s signed value e, might give unexpected results.
So it is casted to an int, which causes no problems because
the strings here are quite short.

@x
else if (strlen(s)>=e) printf("%.*s.%s",e,s,s+e);
@y
else if ((int)strlen(s)>=e) printf("%.*s.%s",e,s,s+e);
@z

the label no_const_found is never used

@x
 no_const_found: next_char=s;@+return -1;
@y
 next_char=s;@+return -1;
@z

here an if else is nested after an if, which makes the else
somewhat ambiguous. Packing the if else into a compound
statement clarifies it.

@x
    if (q>buf0 || *p!='0')
       if (q<buf_max) *q++=*p;
       else if (*(q-1)=='0') *(q-1)=*p;
@y
    if (q>buf0 || *p!='0') {
         if (q<buf_max) *q++=*p;
         else if (*(q-1)=='0') *(q-1)=*p;
    }
@z

the label make_it_zero is not referenced.

@x
 make_it_zero: exp=-99999;@+ goto packit;
@y
 exp=-99999;@+ goto packit;
@z

adding a default case tells the compiler
that the switch statement handles all cases
and there is no way to reach the end of the function
without a return statement.

@x
 case inf: case zro: return z;
@y
 case inf: case zro: default: return z;
@z

@x
 case zro: return zero_octa;
@y
 case zro: default: return zero_octa;
@z
