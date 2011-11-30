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