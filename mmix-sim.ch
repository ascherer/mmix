@x l.2824
 case handle:@+if (o.h==0 && o.l<3) printf(stream_name[o.l]);
@y
 case handle:@+if (o.h==0 && o.l<3) printf("%s", stream_name[o.l]);
@z

@x l.2835
case 's': printf(special_name[zz]);@+break;
@y
case 's': printf("%s", special_name[zz]);@+break;
@z

@x l.2837
case 'l': printf(lhs);@+break;
@y
case 'l': printf("%s", lhs);@+break;
@z

@x l.2970
    for (k=0;usage_help[k][0];k++) fprintf(stderr,usage_help[k]);
@y
    for (k=0;usage_help[k][0];k++) fprintf(stderr,"%s",usage_help[k]);
@z

@x l.2972
  }@+else@+ for (k=0;usage_help[k][1]!='b';k++) printf(usage_help[k]);
@y
  }@+else@+ for (k=0;usage_help[k][1]!='b';k++) printf("%s", usage_help[k]);
@z

@x l.3076
  case 'h':@+ for (k=0;interactive_help[k][0];k++) printf(interactive_help[k]);
@y
  case 'h':@+ for (k=0;interactive_help[k][0];k++) printf("%s", interactive_help[k]);
@z

@x l.3099
      if (command_buf[0]==' ') printf(command_buf);
@y
      if (command_buf[0]==' ') printf("%s", command_buf);
@z
