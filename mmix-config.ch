@x [0] l.7 CWEB 3.5 learned this in 1999.
@s bool int
@y
@z

@x [7] l.328 Improve typography.
in the \.{mmix-pipe} module, which defines and discusses the data structures
@y
in the {\mc MMIX-PIPE} module, which defines and discusses the data structures
@z

@x [8] l.345
by building some simple infrastructure. First we need some macros to
print error messages.

@d errprint0(f) fprintf(stderr,f)
@d errprint1(f,a) fprintf(stderr,f,a)
@d errprint2(f,a,b) fprintf(stderr,f,a,b)
@d errprint3(f,a,b,c) fprintf(stderr,f,a,b,c)
@d panic(x)@+ {@+x;@+errprint0("!\n");@+exit(-1);@+}
@y
by building some simple infrastructure. First we need a function to
print error messages.

@<Subroutines@>=
static void panic(const char *fmt, ...)
{
  va_list ap;
  va_start(ap, fmt);
  (void) vfprintf(stderr, fmt, ap);
  va_end(ap);@/
  fprintf(stderr, "!\n");
  exit(-1);
}
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

@x [10] l.382
        panic(errprint1("config file line too long: `%s...'",buffer));
@y
        panic("config file line too long: `%s...'",buffer);
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

@x [16] l.524
  if (!c) panic(errprint1("Can't allocate %s",name));
@y
  if (!c) panic("Can't allocate %s",name);
@z

@x [18] l.576
if (!funit) panic(errprint0("Can't allocate the functional units"));
@y
if (!funit) panic("Can't allocate the functional units");
@z

@x [19] l.600
  panic(errprint1(
   "Configuration syntax error: Specification can't start with `%s'",token));
@y
  panic(
   "Configuration syntax error: Specification can't start with `%s'",token);
@z

@x [20] l.608
  if (n<PV[j].minval) panic(errprint2(
@.Configuration error...@>
     "Configuration error: %s must be >= %d",PV[j].name,PV[j].minval));
  if (n>PV[j].maxval) panic(errprint2(
     "Configuration error: %s must be <= %d",PV[j].name,PV[j].maxval));
  if (PV[j].power_of_two && (n&(n-1))) panic(errprint1(
     "Configuration error: %s must be a power of 2",PV[j].name));
@y
  if (n<PV[j].minval) panic(
@.Configuration error...@>
     "Configuration error: %s must be >= %d",PV[j].name,PV[j].minval);
  if (n>PV[j].maxval) panic(
     "Configuration error: %s must be <= %d",PV[j].name,PV[j].maxval);
  if (PV[j].power_of_two && (n&(n-1))) panic(
     "Configuration error: %s must be a power of 2",PV[j].name);
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

@x [23] l.659
  if (j==CPV_size) panic(errprint1(
     "Configuration syntax error: `%s' isn't a cache parameter name",token));
@y
  if (j==CPV_size) panic(
     "Configuration syntax error: `%s' isn't a cache parameter name",token);
@z

@x [23] l.663
  if (n<CPV[j].minval) panic(errprint2(
     "Configuration error: %s must be >= %d",CPV[j].name,CPV[j].minval));
@y
  if (n<CPV[j].minval) panic(
     "Configuration error: %s must be >= %d",CPV[j].name,CPV[j].minval);
@z

@x [23] l.666
  if (n>CPV[j].maxval) panic(errprint2(
     "Configuration error: %s must be <= %d",CPV[j].name,CPV[j].maxval));
  if (CPV[j].power_of_two && (n&(n-1))) panic(errprint1(
     "Configuration error: %s must be power of 2",CPV[j].name));
@y
  if (n>CPV[j].maxval) panic(
     "Configuration error: %s must be <= %d",CPV[j].name,CPV[j].maxval);
  if (CPV[j].power_of_two && (n&(n-1))) panic(
     "Configuration error: %s must be power of 2",CPV[j].name);
@z

@x [24] l.693
    if (n==0) panic(errprint0(
      "Configuration error: Pipeline cycles must be positive"));
@.Configuration error...@>
    if (n>255) panic(errprint0(
      "Configuration error: Pipeline cycles must be <= 255"));
    if (n>max_cycs) max_cycs=n;
    if (i>=pipe_limit) panic(errprint1(
      "Configuration error: More than %d pipeline stages",pipe_limit));
@y
    if (n==0) panic(
      "Configuration error: Pipeline cycles must be positive");
@.Configuration error...@>
    if (n>255) panic(
      "Configuration error: Pipeline cycles must be <= 255");
    if (n>max_cycs) max_cycs=n;
    if (i>=pipe_limit) panic(
      "Configuration error: More than %d pipeline stages",pipe_limit);
@z

@x [25] l.711
  if (strlen(token)>15) panic(errprint1(
       "Configuration error: `%s' is more than 15 characters long",token));
@y
  if (strlen(token)>15) panic(
       "Configuration error: `%s' is more than 15 characters long",token);
@z

@x [25] l.716
  if (strlen(token)!=64) panic(errprint1(
       "Configuration error: unit %s doesn't have 64 hex digit specs",
                   funit[funit_count].name));
@y
  if (strlen(token)!=64) panic(
       "Configuration error: unit %s doesn't have 64 hex digit specs",
                   funit[funit_count].name);
@z

@x [25] l.723
    else panic(errprint1(
        "Configuration error: `%c' is not a hex digit",token[j]));
@y
    else panic(
        "Configuration error: `%c' is not a hex digit",token[j]);
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

@x [29] l.806
if (n==0) panic(errprint1(
       "Configuration error: unit %s doesn't do anything",funit[j].name));
@y
if (n==0) panic(
       "Configuration error: unit %s doesn't do anything",funit[j].name);
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

@x [31] l.831
  if (c->bb<c->gg) panic(errprint1(
      "Configuration error: blocksize of %s is less than granularity",name));
@.Configuration error...@>
  if (name[1]=='T' && c->bb!=8) panic(errprint1(
      "Configuration error: blocksize of %s must be 8",name));
@y
  if (c->bb<c->gg) panic(
      "Configuration error: blocksize of %s is less than granularity",name);
@.Configuration error...@>
  if (name[1]=='T' && c->bb!=8) panic(
      "Configuration error: blocksize of %s must be 8",name);
@z

@x [31] l.842
  if (c->a+c->b+c->c>=32) panic(errprint1(
     "Configuration error: %s has >= 4 gigabytes of data",name));
  if (c->gg!=8 && !(c->mode&WRITE_ALLOC)) panic(errprint2(
     "Configuration error: %s does write-around with granularity %d",
        name,c->gg));
@y
  if (c->a+c->b+c->c>=32) panic(
     "Configuration error: %s has >= 4 gigabytes of data",name);
  if (c->gg!=8 && !(c->mode&WRITE_ALLOC)) panic(
     "Configuration error: %s does write-around with granularity %d",
        name,c->gg);
@z

@x [31] l.850
  if (!c->inbuf.dirty) panic(errprint1(
     "Can't allocate dirty bits for inbuffer of %s",name));
@y
  if (!c->inbuf.dirty) panic(
     "Can't allocate dirty bits for inbuffer of %s",name);
@z

@x l.[31] l.854
    if (!c->inbuf.data) panic(errprint1(
     "Can't allocate data for inbuffer of %s",name));
  c->outbuf.dirty=(char*)calloc(c->bb>>c->g,sizeof(char));
  if (!c->outbuf.dirty) panic(errprint1(
     "Can't allocate dirty bits for outbuffer of %s",name));
  c->outbuf.data=(octa *)calloc(c->bb>>3,sizeof(octa));
    if (!c->outbuf.data) panic(errprint1(
     "Can't allocate data for outbuffer of %s",name));
@y
    if (!c->inbuf.data) panic(
     "Can't allocate data for inbuffer of %s",name);
  c->outbuf.dirty=(char*)calloc(c->bb>>c->g,sizeof(char));  
  if (!c->outbuf.dirty) panic(
     "Can't allocate dirty bits for outbuffer of %s",name);
  c->outbuf.data=(octa *)calloc(c->bb>>3,sizeof(octa));
    if (!c->outbuf.data) panic(
     "Can't allocate data for outbuffer of %s",name);
@z

@x [32] l.869
if (!c->set) panic(errprint1(
     "Can't allocate cache sets for %s",name));
@y
if (!c->set) panic(
     "Can't allocate cache sets for %s",name);
@z

@x [32] l.874
  if (!c->set[j]) panic(errprint2(
    "Can't allocate cache blocks for set %d of %s",j,name));
@y
  if (!c->set[j]) panic(
    "Can't allocate cache blocks for set %d of %s",j,name);
@z

@x [32] l.879
    if (!c->set[j][k].dirty) panic(errprint3(
      "Can't allocate dirty bits for block %d of set %d of %s",k,j,name));
    c->set[j][k].data=(octa *)calloc(c->bb>>3,sizeof(octa));
    if (!c->set[j][k].data) panic(errprint3(
      "Can't allocate data for block %d of set %d of %s",k,j,name));
@y
    if (!c->set[j][k].dirty) panic(
      "Can't allocate dirty bits for block %d of set %d of %s",k,j,name);
    c->set[j][k].data=(octa *)calloc(c->bb>>3,sizeof(octa));
    if (!c->set[j][k].data) panic(
      "Can't allocate data for block %d of set %d of %s",k,j,name);
@z

@x [33] l.890
  if (!c->victim) panic(errprint1(
      "Can't allocate blocks for victim cache of %s",name));
@y
  if (!c->victim) panic(
      "Can't allocate blocks for victim cache of %s",name);
@z

@x [33] l.895
    if (!c->victim[k].dirty) panic(errprint2(
      "Can't allocate dirty bits for block %d of victim cache of %s",
                       k,name));
@y
    if (!c->victim[k].dirty) panic(
      "Can't allocate dirty bits for block %d of victim cache of %s",
                       k,name);
@z

@x [33] l.900
    if (!c->victim[k].data) panic(errprint2(
      "Can't allocate data for block %d of victim cache of %s",k,name));
@y
    if (!c->victim[k].data) panic(
      "Can't allocate data for block %d of victim cache of %s",k,name);
@z

@x [34] l.908
  if (!c->reader) panic(errprint1(
@.Can't allocate...@>
        "Can't allocate readers for %s",name));
@y
  if (!c->reader) panic(
@.Can't allocate...@>
        "Can't allocate readers for %s",name);
@z

@x [35] l.934
  if (Scache->bb<Icache->bb) panic(errprint0(
     "Configuration error: Scache blocks smaller than Icache blocks"));
@.Configuration error...@>
  if (Scache->bb<Dcache->bb) panic(errprint0(
     "Configuration error: Scache blocks smaller than Dcache blocks"));
  if (Scache->gg!=Dcache->gg) panic(errprint0(
     "Configuration error: Scache granularity differs from the Dcache"));
@y
  if (Scache->bb<Icache->bb) panic(
     "Configuration error: Scache blocks smaller than Icache blocks");
@.Configuration error...@>
  if (Scache->bb<Dcache->bb) panic(
     "Configuration error: Scache blocks smaller than Dcache blocks");
  if (Scache->gg!=Dcache->gg) panic(
     "Configuration error: Scache granularity differs from the Dcache");
@z

@x [36] l.963
if (!ring) panic(errprint0("Can't allocate the scheduling ring"));
@y
if (!ring) panic("Can't allocate the scheduling ring");
@z

@x [37] l.975
if (hash_prime<=mem_chunks_max) panic(errprint0(
  "Configuration error: hashprime must exceed memchunksmax"));
@.Configuration error...@>
mem_hash=(chunknode *)calloc(hash_prime+1,sizeof(chunknode));
if (!mem_hash) panic(errprint0("Can't allocate the hash table"));
@y
if (hash_prime<=mem_chunks_max) panic(
  "Configuration error: hashprime must exceed memchunksmax");
@.Configuration error...@>
mem_hash=(chunknode *)calloc(hash_prime+1,sizeof(chunknode));
if (!mem_hash) panic("Can't allocate the hash table");
@z

@x [37] l.982
if (!mem_hash[0].chunk) panic(errprint0("Can't allocate chunk 0"));
mem_hash[hash_prime].chunk=(octa*)calloc(1<<13,sizeof(octa));
if (!mem_hash[hash_prime].chunk) panic(errprint0("Can't allocate 0 chunk"));
@y
if (!mem_hash[0].chunk) panic("Can't allocate chunk 0");
mem_hash[hash_prime].chunk=(octa*)calloc(1<<13,sizeof(octa));
if (!mem_hash[hash_prime].chunk) panic("Can't allocate 0 chunk");
@z

@x [37] l.987
if (!fetch_bot) panic(errprint0("Can't allocate the fetch buffer"));
@y
if (!fetch_bot) panic("Can't allocate the fetch buffer");
@z

@x [37] l.990
if (!reorder_bot) panic(errprint0("Can't allocate the reorder buffer"));
@y
if (!reorder_bot) panic("Can't allocate the reorder buffer");
@z

@x [37] l.993
if (!wbuf_bot) panic(errprint0("Can't allocate the write buffer"));
@y
if (!wbuf_bot) panic("Can't allocate the write buffer");
@z

@x [37] l.997
  if (bp_a+bp_b+bp_c>=31) panic(errprint0(
     "Configuration error: Branch table has >= 2 gigabytes of data"));
  bp_table=(char*)calloc(1<<(bp_a+bp_b+bp_c),sizeof(char));
  if (!bp_table) panic(errprint0("Can't allocate the branch table"));
@y
  if (bp_a+bp_b+bp_c>=31) panic(
     "Configuration error: Branch table has >= 2 gigabytes of data");
  bp_table=(char*)calloc(1<<(bp_a+bp_b+bp_c),sizeof(char));
  if (!bp_table) panic("Can't allocate the branch table");
@z

@x [37] l.1002 Change from MMIX home.
l=(specnode*)calloc(lring_size,sizeof(specnode));
if (!l) panic(errprint0("Can't allocate local registers"));
@y
l=(specnode*)calloc(lring_size,sizeof(specnode));
@:l}{\|l (ring of local registers)@>
if (!l) panic("Can't allocate local registers");
@z

@x [37] l.1007
if (!fetched) panic(errprint0("Can't allocate prefetch buffer"));
dispatch_stat=(int*)calloc(dispatch_max+1,sizeof(int));
if (!dispatch_stat) panic(errprint0("Can't allocate dispatch counts"));
@y
if (!fetched) panic("Can't allocate prefetch buffer");
dispatch_stat=(int*)calloc(dispatch_max+1,sizeof(int));
if (!dispatch_stat) panic("Can't allocate dispatch counts");
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
#include "mmix-pipe.h" /* |@!internal_opcode| and much more */
@#
#include <stdio.h> /* |fopen|, |fgets|, |sscanf|, |rewind| */
#include <stdarg.h> /* |vfprintf|, |va_start|, |va_end| */
#include <ctype.h> /* |isspace| */
#include <string.h> /* |strcpy|, |strlen|, |strcmp| */
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

@x [38] l.1030
    panic(errprint1("Can't open configuration file %s",filename));
@y
    panic("Can't open configuration file %s",filename);
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
static void panic(const char*, ...);
static void get_token(void);
static int get_int(void);
static cache* new_cache(char*);
static void ppol(replace_policy*);
static void pcs(cache*);
static int lg(int);
static void alloc_cache(cache*,char*);

@*Index.
@z
