@x
pv_spec PV[]={@/
{"fetchbuffer", &fetch_buf_size, 4, 1, INT_MAX, false},@/
{"writebuffer", &write_buf_size, 2, 1, INT_MAX, false},@/
{"reorderbuffer", &reorder_buf_size, 5, 1, INT_MAX, false},@/
{"renameregs", &max_rename_regs, 5, 1, INT_MAX, false},@/
{"memslots", &max_mem_slots, 2, 1, INT_MAX, false},@/
{"localregs", &lring_size, 256, 256, 1024, true},@/
{"fetchmax", &fetch_max, 2, 1, INT_MAX, false},@/
{"dispatchmax", &dispatch_max, 1, 1, INT_MAX, false},@/
{"peekahead", &peekahead, 1, 0, INT_MAX, false},@/
{"commitmax", &commit_max, 1, 1, INT_MAX, false},@/
{"fremmax", &frem_max, 1, 1, INT_MAX, false},@/
{"denin",&denin_penalty, 1, 0, INT_MAX, false},@/
{"denout",&denout_penalty, 1, 0, INT_MAX, false},@/
{"writeholdingtime", &holding_time, 0, 0, INT_MAX, false},@/
{"memaddresstime", &mem_addr_time, 20, 1, INT_MAX, false},@/
{"memreadtime", &mem_read_time, 20, 1, INT_MAX, false},@/
{"memwritetime", &mem_write_time, 20, 1, INT_MAX, false},@/
{"membusbytes", &mem_bus_bytes, 8, 8, INT_MAX, true},@/
{"branchpredictbits", &bp_n, 0, 0, 8, false},@/
{"branchaddressbits", &bp_a, 0, 0, 32, false},@/
{"branchhistorybits", &bp_b, 0, 0, 32, false},@/
{"branchdualbits", &bp_c, 0, 0, 32, false},@/
{"hardwarepagetable", &hardware_PT, 1, 0, 1, false},@/
{"disablesecurity", (int*)&security_disabled, 0, 0, 1, false},@/
{"memchunksmax", &mem_chunks_max, 1000, 1, INT_MAX, false},@/
@y
pv_spec PV[]={@|
{"fetchbuffer", &fetch_buf_size, 4, 1, INT_MAX, false},@|
{"writebuffer", &write_buf_size, 2, 1, INT_MAX, false},@|
{"reorderbuffer", &reorder_buf_size, 5, 1, INT_MAX, false},@|
{"renameregs", &max_rename_regs, 5, 1, INT_MAX, false},@|
{"memslots", &max_mem_slots, 2, 1, INT_MAX, false},@|
{"localregs", &lring_size, 256, 256, 1024, true},@|
{"fetchmax", &fetch_max, 2, 1, INT_MAX, false},@|
{"dispatchmax", &dispatch_max, 1, 1, INT_MAX, false},@|
{"peekahead", &peekahead, 1, 0, INT_MAX, false},@|
{"commitmax", &commit_max, 1, 1, INT_MAX, false},@|
{"fremmax", &frem_max, 1, 1, INT_MAX, false},@|
{"denin",&denin_penalty, 1, 0, INT_MAX, false},@|
{"denout",&denout_penalty, 1, 0, INT_MAX, false},@|
{"writeholdingtime", &holding_time, 0, 0, INT_MAX, false},@|
{"memaddresstime", &mem_addr_time, 20, 1, INT_MAX, false},@|
{"memreadtime", &mem_read_time, 20, 1, INT_MAX, false},@|
{"memwritetime", &mem_write_time, 20, 1, INT_MAX, false},@|
{"membusbytes", &mem_bus_bytes, 8, 8, INT_MAX, true},@|
{"branchpredictbits", &bp_n, 0, 0, 8, false},@|
{"branchaddressbits", &bp_a, 0, 0, 32, false},@|
{"branchhistorybits", &bp_b, 0, 0, 32, false},@|
{"branchdualbits", &bp_c, 0, 0, 32, false},@|
{"hardwarepagetable", &hardware_PT, 1, 0, 1, false},@|
{"disablesecurity", (int*)&security_disabled, 0, 0, 1, false},@|
{"memchunksmax", &mem_chunks_max, 1000, 1, INT_MAX, false},@|
@z

@x
cpv_spec CPV[]={
{"associativity", assoc, 1, 1, INT_MAX, true},@/
{"blocksize", blksz, 8, 8, 8192, true},@/
{"setsize", setsz, 1, 1, INT_MAX, true},@/
{"granularity", gran, 8, 8, 8192, true},@/
{"victimsize", vctsz, 0, 0, INT_MAX, true},@/
{"writeback", wrb, 0, 0, 1,false},@/
{"writeallocate", wra, 0, 0, 1,false},@/
{"accesstime", acctm, 1, 1, INT_MAX, false},@/
{"copyintime", citm, 1, 1, INT_MAX, false},@/
{"copyouttime", cotm, 1, 1, INT_MAX, false},@/
@y
cpv_spec CPV[]={@|
{"associativity", assoc, 1, 1, INT_MAX, true},@|
{"blocksize", blksz, 8, 8, 8192, true},@|
{"setsize", setsz, 1, 1, INT_MAX, true},@|
{"granularity", gran, 8, 8, 8192, true},@|
{"victimsize", vctsz, 0, 0, INT_MAX, true},@|
{"writeback", wrb, 0, 0, 1,false},@|
{"writeallocate", wra, 0, 0, 1,false},@|
{"accesstime", acctm, 1, 1, INT_MAX, false},@|
{"copyintime", citm, 1, 1, INT_MAX, false},@|
{"copyouttime", cotm, 1, 1, INT_MAX, false},@|
@z

@x
op_spec OP[]={
@y
op_spec OP[]={@|
@z

@x
{"mul4", mul4, 10},
@y
{"mul4", mul4, 10},@|
@z

@x
for (j=div;j<=max_pipe_op;j++) int_stages[j]=strlen(pipe_seq[j]);
@y
for (j=div;j<=max_pipe_op;j++) int_stages[j]=(int)strlen((char*)pipe_seq[j]);
@z

@x
  if (strlen(pipe_seq[j])>n) n=strlen(pipe_seq[j]);
@y
  if ((int)strlen((char*)pipe_seq[j])>n) n=(int)strlen((char*)pipe_seq[j]);
@z

@x
internal_opcode int_op[256]={@/
  trap,fcmp,funeq,funeq,fadd,fix,fadd,fix,@/
  flot,flot,flot,flot,flot,flot,flot,flot,@/
  fmul,feps,feps,feps,fdiv,fsqrt,frem,fint,@/
  mul,mul,mul,mul,div,div,div,div,@/
  add,add,addu,addu,sub,sub,subu,subu,@/
  addu,addu,addu,addu,addu,addu,addu,addu,@/
  cmp,cmp,cmpu,cmpu,sub,sub,subu,subu,@/
  sh,sh,sh,sh,sh,sh,sh,sh,@/
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
  ld,ld,ld,ld,ld,ld,ld,ld,@/
  ld,ld,ld,ld,prego,prego,go,go,@/
  st,st,st,st,st,st,st,st,@/
  st,st,st,st,st,st,st,st,@/
  st,st,st,st,st,st,st,st,@/
  st,st,st,st,st,st,pushgo,pushgo,@/
  or,or,orn,orn,nor,nor,xor,xor,@/
  and,and,andn,andn,nand,nand,nxor,nxor,@/
  bdif,bdif,wdif,wdif,tdif,tdif,odif,odif,@/
  mux,mux,sadd,sadd,mor,mor,mor,mor,@/
  set,set,set,set,addu,addu,addu,addu,@/
  or,or,or,or,andn,andn,andn,andn,@/
  noop,noop,pushj,pushj,set,set,put,put,@/
@y
internal_opcode int_op[256]={@|
  trap,fcmp,funeq,funeq,fadd,fix,fadd,fix,@|
  flot,flot,flot,flot,flot,flot,flot,flot,@|
  fmul,feps,feps,feps,fdiv,fsqrt,frem,fint,@|
  mul,mul,mul,mul,div,div,div,div,@|
  add,add,addu,addu,sub,sub,subu,subu,@|
  addu,addu,addu,addu,addu,addu,addu,addu,@|
  cmp,cmp,cmpu,cmpu,sub,sub,subu,subu,@|
  sh,sh,sh,sh,sh,sh,sh,sh,@|
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
  ld,ld,ld,ld,ld,ld,ld,ld,@|
  ld,ld,ld,ld,prego,prego,go,go,@|
  st,st,st,st,st,st,st,st,@|
  st,st,st,st,st,st,st,st,@|
  st,st,st,st,st,st,st,st,@|
  st,st,st,st,st,st,pushgo,pushgo,@|
  or,or,orn,orn,nor,nor,xor,xor,@|
  and,and,andn,andn,nand,nand,nxor,nxor,@|
  bdif,bdif,wdif,wdif,tdif,tdif,odif,odif,@|
  mux,mux,sadd,sadd,mor,mor,mor,mor,@|
  set,set,set,set,addu,addu,addu,addu,@|
  or,or,or,or,andn,andn,andn,andn,@|
  noop,noop,pushj,pushj,set,set,put,put,@|
@z

