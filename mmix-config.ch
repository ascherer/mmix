@x [0] l.7
@s bool int
@y
@z

@x [9] l.359
FILE *config_file; /* input comes from here */
char token[BUF_SIZE]; /* and tokens are copied to here */
bool token_prescanned; /* does |token| contain the next token already? */
@y
static FILE *config_file; /* input comes from here */
static char token[BUF_SIZE]; /* and tokens are copied to here */
static bool token_prescanned; /* does |token| contain the next token already? */
@z

@x [10] l.367
static void get_token @,@,@[ARGS((void))@];@+@t}\6{@>
@y
@z

@x [11] l.397
static int get_int @,@,@[ARGS((void))@];@+@t}\6{@>
@y
@z

@x [15] l.447
int fetch_buf_size,write_buf_size,reorder_buf_size,mem_bus_bytes,hardware_PT;
int max_cycs=60;
pv_spec PV[]={@|
@y
static int fetch_buf_size,write_buf_size,reorder_buf_size,mem_bus_bytes,hardware_PT;
static int max_cycs=60;
static pv_spec PV[]={@|
@z

@x [15] l.477
cpv_spec CPV[]={@|
@y
static cpv_spec CPV[]={@|
@z

@x [15] l.490
op_spec OP[]={@|
@y
static op_spec OP[]={@|
@z

@x [15] l.513
int PV_size,CPV_size,OP_size; /* the number of entries in |PV|, |CPV|, |OP| */
@y
static int PV_size,CPV_size,OP_size; /* the number of entries in |PV|, |CPV|, |OP| */
@z

@x [16] l.520
static cache* new_cache @,@,@[ARGS((char*))@];@+@t}\6{@>
@y
@z

@x [22] l.639
static void ppol @,@,@[ARGS((replace_policy*))@];@+@t}\6{@>
@y
@z

@x [23] l.652
static void pcs @,@,@[ARGS((cache*))@];@+@t}\6{@>
@y
@z

@x [27] l.752
for (j=div;j<=max_pipe_op;j++) int_stages[j]=strlen(pipe_seq[j]);
@y
for (j=div;j<=max_pipe_op;j++) int_stages[j]=strlen((const char*)pipe_seq[j]);
@z

@x l.755
  if (strlen(pipe_seq[j])>n) n=strlen(pipe_seq[j]);
@y
  if (strlen((const char*)pipe_seq[j])>(size_t)n)
    n=(int)strlen((const char*)pipe_seq[j]);
@z

@x [28] l.765
internal_opcode int_op[256]={@|
@y
static internal_opcode int_op[256]={@|
@z

@x [28] l.798
int int_stages[max_real_command+1];
       /* stages as function of |internal_opcode| */
int stages[256]; /* stages as function of |mmix_opcode| */
@y
static int int_stages[max_real_command+1];
       /* stages as function of |internal_opcode| */
static int stages[256]; /* stages as function of |mmix_opcode| */
@z

@x [30] l.817
static int lg @,@,@[ARGS((int))@];@+@t}\6{@>
@y
@z

@x [31] l.826
static void alloc_cache @,@,@[ARGS((cache*,char*))@];@+@t}\6{@>
@y
@z

@x [37] l.1002
l=(specnode*)calloc(lring_size,sizeof(specnode));
@y
l=(specnode*)calloc(lring_size,sizeof(specnode));
@:l}{\|l (ring of local registers)@>
@z

@x [38] l.1016
#include <stdio.h> /* |fopen|, |fgets|, |sscanf|, |rewind| */
#include <stdlib.h> /* |calloc|, |exit| */
#include <ctype.h> /* |isspace| */
#include <string.h> /* |strcpy|, |strlen|, |strcmp| */
#include <limits.h> /* |INT_MAX| */
#include "mmix-pipe.h"
@y
#include "mmix-config.h" /* we use our own interface first */
#include "mmix-pipe.h" /* |@!internal_op_code| and much more */
@#
#include <stdio.h> /* |fopen|, |fgets|, |sscanf|, |rewind| */
#include <string.h> /* |strcpy|, |strlen|, |strcmp| */
#include <ctype.h> /* |isspace| */
#include <limits.h> /* |INT_MAX| */
@#
@z

@x [38] l.1024
@<Subroutines@>@;
@y
@<Private...@>@;
@<Subroutines@>@;
@z

@x [39] l.1041
@*Index.
@y
@ Here comes the exported interface of this {\mc MMIX-CONFIG} program module.

@(mmix-config.h@>=
#ifndef MMIX_CONFIG_H
#define MMIX_CONFIG_H
@#
#include "mmix-arith.h" /* |@!ARGS| */
@#
extern void MMIX_config @,@,@[ARGS((char *))@];
@#
#endif /* |MMIX_CONFIG_H| */

@ @<Private prototypes@>=
static void get_token @,@,@[ARGS((void))@];
static int get_int @,@,@[ARGS((void))@];
static cache* new_cache @,@,@[ARGS((char*))@];
static void ppol @,@,@[ARGS((replace_policy*))@];
static void pcs @,@,@[ARGS((cache*))@];
static int lg @,@,@[ARGS((int))@];
static void alloc_cache @,@,@[ARGS((cache*,char*))@];

@*Index.
@z
