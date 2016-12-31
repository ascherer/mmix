@x
@s bool normal @q unreserve a C++ keyword @>
@y
@z

@x
#include "abstime.h"
@y
@z

@x
  @<Local variables@>;
@y
  @<Local variables@>; (void)breakpoint_hit;
@z

@x
 cease:;
@y
@z

@x
typedef enum {@!false, @!true, @!wow}@+bool; /* slightly extended booleans */
@y
#include <stdbool.h> /* |bool| */
#include <stdint.h> /* |uint32_t| */
@z

@x
@<Type...@>=
typedef unsigned int tetra;
  /* for systems conforming to the LP-64 data model */
@y
@s uint32_t int
@<Type...@>=
typedef uint32_t tetra;
@z

@x
char *opcode_name[]={
"TRAP","FCMP","FUN","FEQL","FADD","FIX","FSUB","FIXU",@/
"FLOT","FLOTI","FLOTU","FLOTUI","SFLOT","SFLOTI","SFLOTU","SFLOTUI",@/
"FMUL","FCMPE","FUNE","FEQLE","FDIV","FSQRT","FREM","FINT",@/
"MUL","MULI","MULU","MULUI","DIV","DIVI","DIVU","DIVUI",@/
"ADD","ADDI","ADDU","ADDUI","SUB","SUBI","SUBU","SUBUI",@/
"2ADDU","2ADDUI","4ADDU","4ADDUI","8ADDU","8ADDUI","16ADDU","16ADDUI",@/
"CMP","CMPI","CMPU","CMPUI","NEG","NEGI","NEGU","NEGUI",@/
"SL","SLI","SLU","SLUI","SR","SRI","SRU","SRUI",@/
"BN","BNB","BZ","BZB","BP","BPB","BOD","BODB",@/
"BNN","BNNB","BNZ","BNZB","BNP","BNPB","BEV","BEVB",@/
"PBN","PBNB","PBZ","PBZB","PBP","PBPB","PBOD","PBODB",@/
"PBNN","PBNNB","PBNZ","PBNZB","PBNP","PBNPB","PBEV","PBEVB",@/
"CSN","CSNI","CSZ","CSZI","CSP","CSPI","CSOD","CSODI",@/
"CSNN","CSNNI","CSNZ","CSNZI","CSNP","CSNPI","CSEV","CSEVI",@/
"ZSN","ZSNI","ZSZ","ZSZI","ZSP","ZSPI","ZSOD","ZSODI",@/
"ZSNN","ZSNNI","ZSNZ","ZSNZI","ZSNP","ZSNPI","ZSEV","ZSEVI",@/
"LDB","LDBI","LDBU","LDBUI","LDW","LDWI","LDWU","LDWUI",@/
"LDT","LDTI","LDTU","LDTUI","LDO","LDOI","LDOU","LDOUI",@/
"LDSF","LDSFI","LDHT","LDHTI","CSWAP","CSWAPI","LDUNC","LDUNCI",@/
"LDVTS","LDVTSI","PRELD","PRELDI","PREGO","PREGOI","GO","GOI",@/
"STB","STBI","STBU","STBUI","STW","STWI","STWU","STWUI",@/
"STT","STTI","STTU","STTUI","STO","STOI","STOU","STOUI",@/
"STSF","STSFI","STHT","STHTI","STCO","STCOI","STUNC","STUNCI",@/
"SYNCD","SYNCDI","PREST","PRESTI","SYNCID","SYNCIDI","PUSHGO","PUSHGOI",@/
"OR","ORI","ORN","ORNI","NOR","NORI","XOR","XORI",@/
"AND","ANDI","ANDN","ANDNI","NAND","NANDI","NXOR","NXORI",@/
"BDIF","BDIFI","WDIF","WDIFI","TDIF","TDIFI","ODIF","ODIFI",@/
"MUX","MUXI","SADD","SADDI","MOR","MORI","MXOR","MXORI",@/
"SETH","SETMH","SETML","SETL","INCH","INCMH","INCML","INCL",@/
"ORH","ORMH","ORML","ORL","ANDNH","ANDNMH","ANDNML","ANDNL",@/
"JMP","JMPB","PUSHJ","PUSHJB","GETA","GETAB","PUT","PUTI",@/
@y
char *opcode_name[]={@|
"TRAP","FCMP","FUN","FEQL","FADD","FIX","FSUB","FIXU",@|
"FLOT","FLOTI","FLOTU","FLOTUI","SFLOT","SFLOTI","SFLOTU","SFLOTUI",@|
"FMUL","FCMPE","FUNE","FEQLE","FDIV","FSQRT","FREM","FINT",@|
"MUL","MULI","MULU","MULUI","DIV","DIVI","DIVU","DIVUI",@|
"ADD","ADDI","ADDU","ADDUI","SUB","SUBI","SUBU","SUBUI",@|
"2ADDU","2ADDUI","4ADDU","4ADDUI","8ADDU","8ADDUI","16ADDU","16ADDUI",@|
"CMP","CMPI","CMPU","CMPUI","NEG","NEGI","NEGU","NEGUI",@|
"SL","SLI","SLU","SLUI","SR","SRI","SRU","SRUI",@|
"BN","BNB","BZ","BZB","BP","BPB","BOD","BODB",@|
"BNN","BNNB","BNZ","BNZB","BNP","BNPB","BEV","BEVB",@|
"PBN","PBNB","PBZ","PBZB","PBP","PBPB","PBOD","PBODB",@|
"PBNN","PBNNB","PBNZ","PBNZB","PBNP","PBNPB","PBEV","PBEVB",@|
"CSN","CSNI","CSZ","CSZI","CSP","CSPI","CSOD","CSODI",@|
"CSNN","CSNNI","CSNZ","CSNZI","CSNP","CSNPI","CSEV","CSEVI",@|
"ZSN","ZSNI","ZSZ","ZSZI","ZSP","ZSPI","ZSOD","ZSODI",@|
"ZSNN","ZSNNI","ZSNZ","ZSNZI","ZSNP","ZSNPI","ZSEV","ZSEVI",@|
"LDB","LDBI","LDBU","LDBUI","LDW","LDWI","LDWU","LDWUI",@|
"LDT","LDTI","LDTU","LDTUI","LDO","LDOI","LDOU","LDOUI",@|
"LDSF","LDSFI","LDHT","LDHTI","CSWAP","CSWAPI","LDUNC","LDUNCI",@|
"LDVTS","LDVTSI","PRELD","PRELDI","PREGO","PREGOI","GO","GOI",@|
"STB","STBI","STBU","STBUI","STW","STWI","STWU","STWUI",@|
"STT","STTI","STTU","STTUI","STO","STOI","STOU","STOUI",@|
"STSF","STSFI","STHT","STHTI","STCO","STCOI","STUNC","STUNCI",@|
"SYNCD","SYNCDI","PREST","PRESTI","SYNCID","SYNCIDI","PUSHGO","PUSHGOI",@|
"OR","ORI","ORN","ORNI","NOR","NORI","XOR","XORI",@|
"AND","ANDI","ANDN","ANDNI","NAND","NANDI","NXOR","NXORI",@|
"BDIF","BDIFI","WDIF","WDIFI","TDIF","TDIFI","ODIF","ODIFI",@|
"MUX","MUXI","SADD","SADDI","MOR","MORI","MXOR","MXORI",@|
"SETH","SETMH","SETML","SETL","INCH","INCMH","INCML","INCL",@|
"ORH","ORMH","ORML","ORL","ANDNH","ANDNMH","ANDNML","ANDNL",@|
"JMP","JMPB","PUSHJ","PUSHJB","GETA","GETAB","PUT","PUTI",@|
@z

@x
internal_opcode internal_op[256]={@/
  trap,fcmp,funeq,funeq,fadd,fix,fsub,fix,@/
  flot,flot,flot,flot,flot,flot,flot,flot,@/
  fmul,feps,feps,feps,fdiv,fsqrt,frem,fint,@/
  mul,mul,mulu,mulu,div,div,divu,divu,@/
  add,add,addu,addu,sub,sub,subu,subu,@/
  addu,addu,addu,addu,addu,addu,addu,addu,@/
  cmp,cmp,cmpu,cmpu,sub,sub,subu,subu,@/
  shl,shl,shlu,shlu,shr,shr,shru,shru,@/
  br,br,br,br,br,br,br,br,@/
  br,br,br,br,br,br,br,br,@/
  pbr,pbr,pbr,pbr,pbr,pbr,pbr,pbr,@/
  pbr,pbr,pbr,pbr,pbr,pbr,pbr,pbr,@/
  cset,cset,cset,cset,cset,cset,cset,cset,@/
  cset,cset,cset,cset,cset,cset,cset,cset,@/
  zset,zset,zset,zset,zset,zset,zset,zset,@/
  zset,zset,zset,zset,zset,zset,zset,zset,@/
  ld,ld,ld,ld,ld,ld,ld,ld,@/
  ld,ld,ld,ld,ld,ld,ld,ld,@/
  ld,ld,ld,ld,cswap,cswap,ldunc,ldunc,@/
  ldvts,ldvts,preld,preld,prego,prego,go,go,@/
  pst,pst,pst,pst,pst,pst,pst,pst,@/
  pst,pst,pst,pst,st,st,st,st,@/
  pst,pst,pst,pst,st,st,st,st,@/
  syncd,syncd,prest,prest,syncid,syncid,pushgo,pushgo,@/
  or,or,orn,orn,nor,nor,xor,xor,@/
  and,and,andn,andn,nand,nand,nxor,nxor,@/
  bdif,bdif,wdif,wdif,tdif,tdif,odif,odif,@/
  mux,mux,sadd,sadd,mor,mor,mor,mor,@/
  set,set,set,set,addu,addu,addu,addu,@/
  or,or,or,or,andn,andn,andn,andn,@/
  jmp,jmp,pushj,pushj,set,set,put,put,@/
@y
internal_opcode internal_op[256]={@|
  trap,fcmp,funeq,funeq,fadd,fix,fsub,fix,@|
  flot,flot,flot,flot,flot,flot,flot,flot,@|
  fmul,feps,feps,feps,fdiv,fsqrt,frem,fint,@|
  mul,mul,mulu,mulu,div,div,divu,divu,@|
  add,add,addu,addu,sub,sub,subu,subu,@|
  addu,addu,addu,addu,addu,addu,addu,addu,@|
  cmp,cmp,cmpu,cmpu,sub,sub,subu,subu,@|
  shl,shl,shlu,shlu,shr,shr,shru,shru,@|
  br,br,br,br,br,br,br,br,@|
  br,br,br,br,br,br,br,br,@|
  pbr,pbr,pbr,pbr,pbr,pbr,pbr,pbr,@|
  pbr,pbr,pbr,pbr,pbr,pbr,pbr,pbr,@|
  cset,cset,cset,cset,cset,cset,cset,cset,@|
  cset,cset,cset,cset,cset,cset,cset,cset,@|
  zset,zset,zset,zset,zset,zset,zset,zset,@|
  zset,zset,zset,zset,zset,zset,zset,zset,@|
  ld,ld,ld,ld,ld,ld,ld,ld,@|
  ld,ld,ld,ld,ld,ld,ld,ld,@|
  ld,ld,ld,ld,cswap,cswap,ldunc,ldunc,@|
  ldvts,ldvts,preld,preld,prego,prego,go,go,@|
  pst,pst,pst,pst,pst,pst,pst,pst,@|
  pst,pst,pst,pst,st,st,st,st,@|
  pst,pst,pst,pst,st,st,st,st,@|
  syncd,syncd,prest,prest,syncid,syncid,pushgo,pushgo,@|
  or,or,orn,orn,nor,nor,xor,xor,@|
  and,and,andn,andn,nand,nand,nxor,nxor,@|
  bdif,bdif,wdif,wdif,tdif,tdif,odif,odif,@|
  mux,mux,sadd,sadd,mor,mor,mor,mor,@|
  set,set,set,set,addu,addu,addu,addu,@|
  or,or,or,or,andn,andn,andn,andn,@|
  jmp,jmp,pushj,pushj,set,set,put,put,@|
@z

@x
unsigned char flags[256]={
@y
unsigned char flags[256]={@|@t\1\1@>
@z

@x
(The macro \.{ABSTIME} is defined externally in the file \.{abstime.h},
which should have just been created by {\mc ABSTIME}\kern.05em;
{\mc ABSTIME} is
a trivial program that computes the value of the standard library function
|time(NULL)|. We assume that this number, which is the number of seconds in
@y
(The macro \.{ABSTIME} will be set to a numeric value at compilation-time in
\.{Makefile}. We assume that this number, which is the number of seconds in
@z

@x
@d VERSION 1 /* version of the \MMIX\ architecture that we support */
@y
@d ABSTIME /* number of seconds in “the epoch” */
@d VERSION 1 /* version of the \MMIX\ architecture that we support */
@z

@x
    if (a.l<32) printf(special_name[a.l]);
@y
    if (a.l<32) printf("%s",special_name[a.l]);
@z

@x
unsigned char third_operand[256]={@/
@y
unsigned char third_operand[256]={@|@t\1\1@>
@z

@x
if (rename_regs<cool->ren_x+cool->ren_a) goto stall;
if (cool->mem_x)
  if (mem_slots) mem_slots--;@+else goto stall;
@y
if (rename_regs<(cool->ren_x?1:0)+(cool->ren_a?1:0)) goto stall;
if (cool->mem_x)
{ if (mem_slots) mem_slots--;@+else goto stall; }
@z

@x
    new_O=incr(cool_O,-x-1);
@y
    new_O=incr(cool_O,-(int)x-1);
@z

@x
    if (x<new_L)
@y
    if (x<(unsigned int)new_L)
@z

@x
  @<Cases for stage 1 execution@>;
@y
  @<Cases for stage 1 execution@>;
  default: ;
@z

@x
  panic(confusion("lru victim")); /* what happened? nobody has rank zero */
@y
 default: panic(confusion("lru victim")); /* what happened? nobody has rank zero */
@z

@x
int page_n; /* the 10-bit |n| field of rV, times 8 */
@y
unsigned int page_n; /* the 10-bit |n| field of rV, times 8 */
@z

@x
    if (ticks.l-write_head->stamp<holding_time && !speed_lock)
@y
    if ((int)(ticks.l-write_head->stamp)<holding_time && !speed_lock)
@z

@x
if (((data->z.o.l<<PROT_OFFSET)&j)!=j) {
@y
if (((data->z.o.l<<PROT_OFFSET)&j)!=(unsigned int)j) {
@z

@x
  case st: data->state=st_ready;@+pass_after(1);@+goto passit;
@y
  case st: data->state=st_ready;@+pass_after(1);@+goto passit;
  default: ;
@z

@x
     if (data->i==preld || data->i==prest) goto fin_ex;@+ else goto square_one;
   if (no_hardware_PT || page_f)
     if (data->i==preld || data->i==prest) goto fin_ex;@+else goto emulate_virt;
@y
   { if (data->i==preld || data->i==prest) goto fin_ex;@+ else goto square_one; }
   if (no_hardware_PT || page_f)
   { if (data->i==preld || data->i==prest) goto fin_ex;@+else goto emulate_virt; }
@z

@x
   ((data->y.o.l+(data->xx&(Dcache->bb-1))+1)^data->y.o.l)>=Dcache->bb)
@y
   ((data->y.o.l+(data->xx&(Dcache->bb-1))+1)^data->y.o.l)>=(unsigned int)Dcache->bb)
@z

@x
   if (Dcache && Dcache->bb<data->b.o.l) data->b.o.l=Dcache->bb;
   goto do_syncid;
@y
   if (Dcache && (unsigned int)Dcache->bb<data->b.o.l) data->b.o.l=Dcache->bb;
   goto do_syncid;
 default: ;
@z

@x
     if (data->i==prego) goto fin_ex;@+else wait(1);
@y
   { if (data->i==prego) goto fin_ex;@+else wait(1); }
@z

@x
     if (data->i==prego) goto fin_ex;@+else goto new_fetch;
@y
   { if (data->i==prego) goto fin_ex;@+else goto new_fetch; }
@z

@x
 case FCMPE:@+ if (j) goto cmp_zero_or_invalid;
@y
 case FCMPE:@+ if (j) goto cmp_zero_or_invalid;
 default: ;
@z

@x
   if (data->i==syncd) goto fin_ex;@+ else goto next_sync;
@y
 { if (data->i==syncd) goto fin_ex;@+ else goto next_sync; }
@z

@x
  data->y.o.l &= -data->b.o.l;
@y
  data->y.o.l &= -(int)data->b.o.l;
@z

