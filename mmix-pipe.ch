
@x
 cease:;
@y
@z

@x
    if (a.l<32) printf(special_name[a.l]);
@y
    if (a.l<32) printf("%s",special_name[a.l]);
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