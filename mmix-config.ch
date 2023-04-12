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

@x [37] l.1002
l=(specnode*)calloc(lring_size,sizeof(specnode));
@y
l=(specnode*)calloc(lring_size,sizeof(specnode));
@:l}{\|l (ring of local registers)@>
@z

@x [38] l.1016
#include <stdio.h> /* |fopen|, |fgets|, |sscanf|, |rewind| */
@y
#include "mmix-config.h" /* we use our own interface first */
#include <stdio.h> /* |fopen|, |fgets|, |sscanf|, |rewind| */
@z

x [38] l.1021
#include "mmix-pipe.h"
y
z

@x [39] l.1041
@*Index.
@y
@ Here comes the exported interface of this MMIX-CONFIG program module.

@(mmix-config.h@>=
#ifndef MMIX_CONFIG_H
#define MMIX_CONFIG_H
@#
#define MMIX_PIPE_H
#include "mmix-pipe.h" /* TODO: clean up MMIX-PIPE interface */
#undef MMIX_PIPE_H
#ifdef __STDC__
#define ARGS(list) list
#else
#define ARGS(list) ()
#endif
@#
extern void MMIX_config @,@,@[ARGS((char *))@];
@#
#endif /* |MMIX_CONFIG_H| */

@*Index.
@z
