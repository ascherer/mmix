@x
    if (shown_line>0)
      if (cur_line<shown_line) printf("--------\n"); /* indicate upward move */
      else printf("     ...\n"); /* indicate the gap */
@y
    if (shown_line>0) {
      if (cur_line<shown_line) printf("--------\n"); /* indicate upward move */
      else printf("     ...\n"); /* indicate the gap */
    }
@z

@x
  if (f&X_is_dest_bit) @<Install register~X as the destination,
          adjusting the register stack if necessary@>;
@y
  if (f&X_is_dest_bit){ @<Install register~X as the destination,
          adjusting the register stack if necessary@>; }
@z

@x
int tracing_exceptions; /* exception bits that cause tracing */
@y
unsigned int tracing_exceptions; /* exception bits that cause tracing */
@z

@x
tetra trace_threshold; /* each instruction should be traced this many times */
@y
unsigned int trace_threshold; /* each instruction should be traced this many times */
@z

@x
 round_mode=(y.l? y.l: cur_round);@+goto store_fx;
@y
 round_mode=(y.l? (int)y.l: cur_round);@+goto store_fx;
@z

@x
  if (z.l>L || z.h) z.h=0, z.l=L;
@y
  if ((int)z.l>L || z.h) z.h=0, z.l=L;
@z

@x
  if (z.h!=0 || z.l>255 || z.l<L || z.l<32) goto illegal_inst;
@y
  if (z.h!=0 || z.l>255 || z.l<(unsigned int)L || z.l<32) goto illegal_inst;
@z

@x
 case handle:@+if (o.h==0 && o.l<3) printf(stream_name[o.l]);
@y
 case handle:@+if (o.h==0 && o.l<3) printf("%s",stream_name[o.l]);
@z

@x
case 's': printf(special_name[zz]);@+break;
case '?': p++;@+if (z.l) printf("%c%d",*p,z.l);@+break;
case 'l': printf(lhs);@+break;
@y
case 's': printf("%s",special_name[zz]);@+break;
case '?': p++;@+if (z.l) printf("%c%d",*p,z.l);@+break;
case 'l': printf("%s",lhs);@+break;
@z

@x
  else if (sscanf(arg+1,"%d",&trace_threshold)!=1) trace_threshold=0;
@y
  else if (sscanf(arg+1,"%d",(int *)&trace_threshold)!=1) trace_threshold=0;
@z

@x
    for (k=0;usage_help[k][0];k++) fprintf(stderr,usage_help[k]);
    exit(-1);
  }@+else@+ for (k=0;usage_help[k][1]!='b';k++) printf(usage_help[k]);
@y
    for (k=0;usage_help[k][0];k++) fprintf(stderr,"%s",usage_help[k]);
    exit(-1);
  }@+else@+ for (k=0;usage_help[k][1]!='b';k++) printf("%s",usage_help[k]);
@z

@x
  case 'h':@+ for (k=0;interactive_help[k][0];k++) printf(interactive_help[k]);
@y
  case 'h':@+ for (k=0;interactive_help[k][0];k++) printf("%s",interactive_help[k]);
@z

@x
 check_syntax:@+ if (*p!='\n') {
@y
 if (*p!='\n') {
@z

@x
    }@+else if (command_buf[0]!='\n' && command_buf[0]!='i' &&
              command_buf[0]!='%')
      if (command_buf[0]==' ') printf(command_buf);
      else ready=true;
@y
    }@+else if (command_buf[0]!='\n' && command_buf[0]!='i' &&
              command_buf[0]!='%') {
      if (command_buf[0]==' ') printf("%s",command_buf);
      else ready=true;
    }
@z
@x
    if (val.h!=0 || val.l>255 || val.l<L || val.l<32) break;
    for (j=val.l; j<G; j++) g[j]=zero_octa;
    G=val.l;
  }@+else if (k==rL) {
    if (val.h==0 && val.l<L) L=val.l;
    else break;
  }
@y
    if (val.h!=0 || val.l>255 || (int)val.l<L || val.l<32) break;
    for (j=val.l; j<G; j++) g[j]=zero_octa;
    G=val.l;
  }@+else if (k==rL) {
    if (val.h==0 && (int)val.l<L) L=val.l;
    else break;
  }
@z
