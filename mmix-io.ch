@x [0] l.6
\def\Hex#1{\hbox{$^{\scriptscriptstyle\#}$\tt#1}} % experimental hex constant
@y
\def\Hex#1{\hbox{$^{\scriptscriptstyle\#}$\tt#1}} % experimental hex constant
@s tetra int
@s octa int
@z

@x [1] l.17
@<Preprocessor macros@>@;
@<Type definitions@>@;
@<External subroutines@>@;
@y
#include "mmix-io.h" /* we use our own interface first;
  see |@(mmix-io.h@>| */
#include <stdlib.h> /* |@!calloc|, |@!free| */
@#
@h
@<Preprocessor macros@>@;
@<Type definitions@>@;
@z

@x [2] l.23
@ Of course we include standard \CEE/ library routines, and we set things
up to accommodate older versions of \CEE/.

@<Preproc...@>=
#include <stdio.h>
#include <stdlib.h>
#ifdef __STDC__
#define ARGS(list) list
#else
#define ARGS(list) ()
#endif
#ifndef FILENAME_MAX
#define FILENAME_MAX 256
#endif
#ifndef SEEK_SET
#define SEEK_SET 0
#endif
#ifndef SEEK_END
#define SEEK_END 2
#endif
@y
@ We set things up to accommodate older versions of \CEE/.

@<Preproc...@>=
#ifndef FILENAME_MAX
#define FILENAME_MAX 256
#endif
#ifndef SEEK_SET
#define SEEK_SET 0
#endif
#ifndef SEEK_END
#define SEEK_END 2
#endif
@z

@x [3] l.48
@ The unsigned 32-bit type \&{tetra} must agree with its definition
in the simulators.

@<Type...@>=
typedef unsigned int tetra;
typedef struct {tetra h,l;} octa; /* two tetrabytes make one octabyte */
@y
@* Interface.  Here comes the exported interface of this program module.

@(mmix-io.h@>=
#ifndef MMIX_IO_H
#define MMIX_IO_H
#include <stdio.h> /* |@!FILE| */
@#
#include "mmix-arith.h" /* |@!ARGS|, |@!octa| */
@#
extern void mmix_io_init @,@,@[ARGS((void))@];
extern octa mmix_fopen @,@,@[ARGS((unsigned char,octa,octa, /* mixin */
@t\qquad@>
  int @,(*mmgetchars) @,@,@[ARGS((char* buf,int size,octa addr,int stop))@]
@,))@];
extern void mmix_fake_stdin @,@,@[ARGS((FILE*))@];
extern octa mmix_fclose @,@,@[ARGS((unsigned char))@];
extern octa mmix_fread @,@,@[ARGS((unsigned char,octa,octa, /* mixins */
@t\qquad@>
  void @,(*mmputchars) @,@,@[ARGS((unsigned char* buf,int size,octa addr))@],@|
  char @,(*stdin_chr) @,@,@[ARGS((void))@]
@,))@];
extern octa mmix_fgets @,@,@[ARGS((unsigned char,octa,octa, /* mixins */
@t\qquad@>
  void @,(*mmputchars) @,@,@[ARGS((unsigned char* buf,int size,octa addr))@],@|
  char @,(*stdin_chr) @,@,@[ARGS((void))@]
@,))@];
extern octa mmix_fgetws @,@,@[ARGS((unsigned char,octa,octa, /* mixins */
@t\qquad@>
  void @,(*mmputchars) @,@,@[ARGS((unsigned char* buf,int size,octa addr))@],@|
  char @,(*stdin_chr) @,@,@[ARGS((void))@]
@,))@];
extern octa mmix_fwrite @,@,@[ARGS((unsigned char,octa,octa, /* mixin */
@t\qquad@>
  int @,(*mmgetchars) @,@,@[ARGS((char* buf,int size,octa addr,int stop))@]
@,))@];
extern octa mmix_fputs @,@,@[ARGS((unsigned char,octa, /* mixin */
@t\qquad@>
  int @,(*mmgetchars) @,@,@[ARGS((char* buf,int size,octa addr,int stop))@]
@,))@];
extern octa mmix_fputws @,@,@[ARGS((unsigned char,octa, /* mixin */
@t\qquad@>
  int @,(*mmgetchars) @,@,@[ARGS((char* buf,int size,octa addr,int stop))@]
@,))@];
extern octa mmix_fseek @,@,@[ARGS((unsigned char,octa))@];
extern octa mmix_ftell @,@,@[ARGS((unsigned char))@];
extern void print_trip_warning @,@,@[ARGS((int,octa))@];
@#
#endif /* |MMIX_IO_H| */
@z

@x [4] l.51
@ Three basic subroutines are used to get strings from the simulated
memory and to put strings into that memory. These subroutines are
defined appropriately in each simulator. We also use a few subroutines
and constants defined in {\mc MMIX-ARITH}.

@<External...@>=
extern char stdin_chr @,@,@[ARGS((void))@];
extern int mmgetchars @,@,@[ARGS((char* buf,int size,octa addr,int stop))@];
extern void mmputchars @,@,@[ARGS((unsigned char* buf,int size,octa addr))@];
extern octa oplus @,@,@[ARGS((octa,octa))@];
extern octa ominus @,@,@[ARGS((octa,octa))@];
extern octa incr @,@,@[ARGS((octa,int))@];
extern octa zero_octa; /* |zero_octa.h=zero_octa.l=0| */
extern octa neg_one; /* |neg_one.h=neg_one.l=-1| */
@y
@ The ``mixins'' in the interface above are defined similarly, but slightly
differently, as \&{static} functions in the simulators {\mc MMIX-PIPE} and
{\mc MMIX-SIM}. Only these two program modules of the {\mc MMIX} system
call any of the extended functions from this module.
@z

@x [5] l.66
@ Each possible handle has a file pointer and a current mode.
@y
@* Implementation.  Each possible handle has a file pointer and a current mode.
@z

@x [6] l.75
sim_file_info sfile[256];
@y
static sim_file_info sfile[256];
@z

@x [7] l.80
void mmix_io_init @,@,@[ARGS((void))@];@+@t}\6{@>
@y
@z

@x [8] l.93
octa mmix_fopen @,@,@[ARGS((unsigned char,octa,octa))@];@+@t}\6{@>
octa mmix_fopen(handle,name,mode)
  unsigned char handle;
  octa name,mode;
@y
octa mmix_fopen(handle,name,mode,mmgetchars)
  unsigned char handle;
  octa name,mode;
@t\qquad@>
  int @,(*mmgetchars) @,@,@[ARGS((char* buf,int size,octa addr,int stop))@];
@z

@x {8] l.99
  if (mode.h || mode.l>4) goto abort;
  if (mmgetchars(name_buf,FILENAME_MAX,name,0)==FILENAME_MAX) goto abort;
  if (sfile[handle].mode!=0 && handle>2) fclose(sfile[handle].fp);
@y
  if (mode.h || mode.l>4) return neg_one;
  if (mmgetchars(name_buf,FILENAME_MAX,name,0)==FILENAME_MAX) return neg_one;
  mmix_fclose(handle);
@z

@x [8] l.103
  if (!sfile[handle].fp) goto abort;
@y
  if (!sfile[handle].fp) return neg_one;
@z

@x [8] l.106
 abort: sfile[handle].mode=0;
  return neg_one; /* failure */
@y
@z

@x [9] l.111
char *mode_string[]={"r","w","rb","wb","w+b"};
int mode_code[]={0x1,0x2,0x5,0x6,0xf};
@y
static char *mode_string[]={"r","w","rb","wb","w+b"};
static int mode_code[]={0x1,0x2,0x5,0x6,0xf};
@z

@x [10] l.118
void mmix_fake_stdin @,@,@[ARGS((FILE*))@];@+@t}\6{@>
@y
@z

@x [11] l.126
octa mmix_fclose @,@,@[ARGS((unsigned char))@];@+@t}\6{@>
@y
@z

@x [11] l.131
  if (handle>2 && fclose(sfile[handle].fp)!=0) return neg_one;
  sfile[handle].mode=0;
@y
  sfile[handle].mode=0;
  if (((handle==0 && sfile[handle].fp!=stdin) ||
      (handle==1 && sfile[handle].fp!=stdout) ||
      (handle==2 && sfile[handle].fp!=stderr) ||
      handle>2) && fclose(sfile[handle].fp)!=0) return neg_one;
@z

@x [12] l.137
octa mmix_fread @,@,@[ARGS((unsigned char,octa,octa))@];@+@t}\6{@>
octa mmix_fread(handle,buffer,size)
  unsigned char handle;
  octa buffer,size;
@y
octa mmix_fread(handle,buffer,size,mmputchars,stdin_chr)
  unsigned char handle;
  octa buffer,size;
@t\qquad@>
  void @,(*mmputchars) @,@,@[ARGS((unsigned char* buf,int size,octa addr))@];
@+@t}\6{\qquad@>
  char @,(*stdin_chr) @,@,@[ARGS((void))@];
@z

@x [12] l.144
  octa o;
  o=neg_one;
@y
  octa o=neg_one;
@z

@x [14] l.172
octa mmix_fgets @,@,@[ARGS((unsigned char,octa,octa))@];@+@t}\6{@>
octa mmix_fgets(handle,buffer,size)
  unsigned char handle;
  octa buffer,size;
@y
octa mmix_fgets(handle,buffer,size,mmputchars,stdin_chr)
  unsigned char handle;
  octa buffer,size;
@t\qquad@>
  void @,(*mmputchars) @,@,@[ARGS((unsigned char* buf,int size,octa addr))@];
@+@t}\6{\qquad@>
  char @,(*stdin_chr) @,@,@[ARGS((void))@];
@z

@x [14] l.180
  octa o;
@y
  octa o=zero_octa;
@z

@x [14] l.186
  o=zero_octa;
@y
@z

@x [15] l.199
if (size.l<s && !size.h) s=size.l;
@y
if (size.l<(tetra)s && !size.h) s=(int)size.l;
@z

@x [16] l.227
octa mmix_fgetws @,@,@[ARGS((unsigned char,octa,octa))@];@+@t}\6{@>
octa mmix_fgetws(handle,buffer,size)
  unsigned char handle;
  octa buffer,size;
@y
octa mmix_fgetws(handle,buffer,size,mmputchars,stdin_chr)
  unsigned char handle;
  octa buffer,size;
@t\qquad@>
  void @,(*mmputchars) @,@,@[ARGS((unsigned char* buf,int size,octa addr))@];
@+@t}\6{\qquad@>
  char @,(*stdin_chr) @,@,@[ARGS((void))@];
@z

@x [16] l.235
  octa o;
@y
  octa o=zero_octa;
@z

@x [16] l.242
  o=zero_octa;
@y
@z

@x [17] l.256
if (size.l<s && !size.h) s=size.l;
@y
if (size.l<(tetra)s && !size.h) s=size.l;
@z

@x [18] l.275
octa mmix_fwrite @,@,@[ARGS((unsigned char,octa,octa))@];@+@t}\6{@>
octa mmix_fwrite(handle,buffer,size)
  unsigned char handle;
  octa buffer,size;
@y
octa mmix_fwrite(handle,buffer,size,mmgetchars)
  unsigned char handle;
  octa buffer,size;
@t\qquad@>
  int @,(*mmgetchars) @,@,@[ARGS((char* buf,int size,octa addr,int stop))@];
@z

@x [18] l.288
    if (fwrite(buf,1,n,sfile[handle].fp)!=n) return ominus(zero_octa,size);
@y
    if (fwrite(buf,1,n,sfile[handle].fp)!=(size_t)n) return ominus(zero_octa,size);
@z

@x [19] l.296
octa mmix_fputs @,@,@[ARGS((unsigned char,octa))@];@+@t}\6{@>
octa mmix_fputs(handle,string)
  unsigned char handle;
  octa string;
@y
octa mmix_fputs(handle,string,mmgetchars)
  unsigned char handle;
  octa string;
@t\qquad@>
  int @,(*mmgetchars) @,@,@[ARGS((char* buf,int size,octa addr,int stop))@];
@z

@x [19] l.304
  octa o;
  o=zero_octa;
@y
  octa o=zero_octa;
@z

@x [19] l.309
    if (fwrite(buf,1,n,sfile[handle].fp)!=n) return neg_one;
@y
    if (fwrite(buf,1,n,sfile[handle].fp)!=(size_t)n) return neg_one;
@z

@x [20] l.320
octa mmix_fputws @,@,@[ARGS((unsigned char,octa))@];@+@t}\6{@>
octa mmix_fputws(handle,string)
  unsigned char handle;
  octa string;
@y
octa mmix_fputws(handle,string,mmgetchars)
  unsigned char handle;
  octa string;
@t\qquad@>
  int @,(*mmgetchars) @,@,@[ARGS((char* buf,int size,octa addr,int stop))@];
@z

@x [20] l.327
  octa o;
  o=zero_octa;
@y
  octa o=zero_octa;
@z

@x [20] l.333
    if (fwrite(buf,1,n,sfile[handle].fp)!=n) return neg_one;
@y
    if (fwrite(buf,1,n,sfile[handle].fp)!=(size_t)n) return neg_one;
@z

@x [21] l.346
octa mmix_fseek @,@,@[ARGS((unsigned char,octa))@];@+@t}\6{@>
@y
@z

@x [22] l.364
octa mmix_ftell @,@,@[ARGS((unsigned char))@];@+@t}\6{@>
@y
@z

@x [23] l.381
void print_trip_warning @,@,@[ARGS((int,octa))@];@+@t}\6{@>
@y
@z

@x [24] l.392
char *trip_warning[]={
@y
static char *trip_warning[]={
@z
