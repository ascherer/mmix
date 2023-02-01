@x [0] l.7
@s bool int
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
