@x [0] l.7 CWEB 3.5 learned this in 1999.
@s bool int
@y
@z

@x [7] l.328 Improve typography.
in the \.{mmix-pipe} module, which defines and discusses the data structures
@y
in the {\mc MMIX-PIPE} module, which defines and discusses the data structures
@z

@x [9] l.359 Factor out private stuff.
FILE *config_file; /* input comes from here */
char token[BUF_SIZE]; /* and tokens are copied to here */
bool token_prescanned; /* does |token| contain the next token already? */
@y
static FILE *config_file; /* input comes from here */
static char token[BUF_SIZE]; /* and tokens are copied to here */
static bool token_prescanned; /* does |token| contain the next token already? */
@z

@x [10] l.367 C99 prototypes for C2x.
static void get_token @,@,@[ARGS((void))@];@+@t}\6{@>
static void get_token() /* set |token| to the next token of the configuration file */
@y
static void get_token(void) /* set |token| to the next token of the configuration file */
@z

@x [11] l.397 C99 prototypes for C2x.
static int get_int @,@,@[ARGS((void))@];@+@t}\6{@>
static int get_int()
@y
static int get_int(void)
@z

@x [15] l.447 Factor out private stuff.
int fetch_buf_size,write_buf_size,reorder_buf_size,mem_bus_bytes,hardware_PT;
int max_cycs=60;
pv_spec PV[]={@|
@y
static int fetch_buf_size,write_buf_size,reorder_buf_size,mem_bus_bytes,hardware_PT;
static int max_cycs=60;
static pv_spec PV[]={@|
@z

@x [15] l.477 Factor out private stuff.
cpv_spec CPV[]={@|
@y
static cpv_spec CPV[]={@|
@z

@x [15] l.490 Factor out private stuff.
op_spec OP[]={@|
@y
static op_spec OP[]={@|
@z

@x [15] l.513 Factor out private stuff.
int PV_size,CPV_size,OP_size; /* the number of entries in |PV|, |CPV|, |OP| */
@y
static int PV_size,CPV_size,OP_size; /* the number of entries in |PV|, |CPV|, |OP| */
@z

@x [16] l.520 C99 prototypes for C2x.
static cache* new_cache @,@,@[ARGS((char*))@];@+@t}\6{@>
static cache* new_cache(name)
  char *name;
@y
static cache* new_cache(
  char *name)
@z

@x [22] l.639 C99 prototypes for C2x.
static void ppol @,@,@[ARGS((replace_policy*))@];@+@t}\6{@>
static void ppol(rr) /* subroutine to scan for a replacement policy */
  replace_policy *rr;
@y
static void ppol( /* subroutine to scan for a replacement policy */
  replace_policy *rr)
@z

@x [23] l.652 C99 prototypes for C2x.
static void pcs @,@,@[ARGS((cache*))@];@+@t}\6{@>
static void pcs(c) /* subroutine to process a cache spec */
  cache *c;
@y
static void pcs( /* subroutine to process a cache spec */
  cache *c)
@z

@x [27] l.752 Change from MMIX home.
for (j=div;j<=max_pipe_op;j++) int_stages[j]=strlen(pipe_seq[j]);
@y
for (j=div;j<=max_pipe_op;j++)
  int_stages[j]=(int)strlen((const char*)pipe_seq[j]);
@z

@x [27] l.755 Change from MMIX home.
  if (strlen(pipe_seq[j])>n) n=strlen(pipe_seq[j]);
@y
  if (strlen((const char*)pipe_seq[j])>(size_t)n)
    n=(int)strlen((const char*)pipe_seq[j]);
@z

@x [28] l.765 Factor out private stuff.
internal_opcode int_op[256]={@|
@y
static internal_opcode int_op[256]={@|
@z

@x [28] l.798 Factor out private stuff.
int int_stages[max_real_command+1];
       /* stages as function of |internal_opcode| */
int stages[256]; /* stages as function of |mmix_opcode| */
@y
static int int_stages[max_real_command+1];
       /* stages as function of |internal_opcode| */
static int stages[256]; /* stages as function of |mmix_opcode| */
@z

@x [30] l.817 C99 prototypes for C2x.
static int lg @,@,@[ARGS((int))@];@+@t}\6{@>
static int lg(n) /* compute binary logarithm */
  int n;
@y
static int lg( /* compute binary logarithm */
  int n)
@z

@x [31] l.826 C99 prototypes for C2x.
static void alloc_cache @,@,@[ARGS((cache*,char*))@];@+@t}\6{@>
static void alloc_cache(c,name)
  cache *c;
  char *name;
@y
static void alloc_cache(
  cache *c,
  char *name)
@z

@x [37] l.1002 Change from MMIX home.
l=(specnode*)calloc(lring_size,sizeof(specnode));
@y
l=(specnode*)calloc(lring_size,sizeof(specnode));
@:l}{\|l (ring of local registers)@>
@z

@x [38] l.1016 Improved module structure with interfaces.
#include <stdio.h> /* |fopen|, |fgets|, |sscanf|, |rewind| */
#include <stdlib.h> /* |calloc|, |exit| */
#include <ctype.h> /* |isspace| */
#include <string.h> /* |strcpy|, |strlen|, |strcmp| */
#include <limits.h> /* |INT_MAX| */
#include "mmix-pipe.h"
@y
#include "mmix-config.h" /* we use our own interface first;
  see |@(mmix-config.h@>| */
#include "mmix-pipe.h" /* |@!internal_op_code| and much more */
@#
#include <stdio.h> /* |fopen|, |fgets|, |sscanf|, |rewind| */
#include <string.h> /* |strcpy|, |strlen|, |strcmp| */
#include <ctype.h> /* |isspace| */
#include <limits.h> /* |INT_MAX| */
@#
@h
@#
@z

@x [38] l.1024 Factor out private stuff.
@<Subroutines@>@;
void MMIX_config(filename)
  char *filename;
@y
@<Private...@>@;
@<Subroutines@>@;
void MMIX_config(
  char *filename)
@z

@x [39] l.1041 Improved module structure with interface.
@*Index.
@y
@ Here comes the exported interface of this {\mc MMIX-CONFIG} program module.

@(mmix-config.h@>=
#ifndef MMIX_CONFIG_H
#define MMIX_CONFIG_H
@#
extern void MMIX_config(char *);
@#
#endif /* |MMIX_CONFIG_H| */

@ @<Private prototypes@>=
static void get_token(void);
static int get_int(void);
static cache* new_cache(char*);
static void ppol(replace_policy*);
static void pcs(cache*);
static int lg(int);
static void alloc_cache(cache*,char*);

@*Index.
@z
