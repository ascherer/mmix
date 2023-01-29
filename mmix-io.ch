@x l.28
#include <stdlib.h>
@y
#include <stdlib.h>
#include <stdint.h>
@z

@x l.48
@<Type...@>=
typedef unsigned int tetra;
@y
@s uint32_t int
@<Type...@>=
typedef uint32_t tetra;
@z

@x l.199
if (size.l<s && !size.h) s=size.l;
@y
if (size.l<(tetra)s && !size.h) s=size.l;
@z

@x l.256
if (size.l<s && !size.h) s=size.l;
@y
if (size.l<(tetra)s && !size.h) s=size.l;
@z

@x l.288
    if (fwrite(buf,1,n,sfile[handle].fp)!=n) return ominus(zero_octa,size);
@y
    if (fwrite(buf,1,n,sfile[handle].fp)!=(size_t)n) return ominus(zero_octa,size);
@z

@x l.309
    if (fwrite(buf,1,n,sfile[handle].fp)!=n) return neg_one;
@y
    if (fwrite(buf,1,n,sfile[handle].fp)!=(size_t)n) return neg_one;
@z

@x l.333
    if (fwrite(buf,1,n,sfile[handle].fp)!=n) return neg_one;
@y
    if (fwrite(buf,1,n,sfile[handle].fp)!=(size_t)n) return neg_one;
@z
