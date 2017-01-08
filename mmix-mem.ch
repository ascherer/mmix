@x
extern octa read_hex(); /* found in the main program module */
@y
@z

@x
extern octa shift_right @,@,@[ARGS((octa y,int s,int u))@];
  /* $y\GG s$, signed if |!u| */
@y
extern octa shift_right @,@,@[ARGS((octa y,int s,int u))@];
  /* $y\GG s$, signed if |!u| */

@ Here's a simple program to read an octabyte in hexadecimal notation
from a buffer. It changes the buffer by storing a null character
after the input.
@^radix conversion@>

@d BUF_SIZE 100

@c
octa read_hex @,@,@[ARGS((char *))@];@+@t}\6{@>
octa read_hex(p)
  char *p;
{
  unsigned char d[BUF_SIZE];
  register int j,k;
  octa val;
  val.h=val.l=0;
  for (j=0;;j++) {
    if (p[j]>='0' && p[j]<='9') d[j]=p[j]-'0';
    else if (p[j]>='a' && p[j]<='f') d[j]=p[j]-'a'+10;
    else if (p[j]>='A' && p[j]<='F') d[j]=p[j]-'A'+10;
    else break;
  }
  p[j]='\0';
  for (j--,k=0;k<=j;k++) {
    if (k>=8) val.h+=d[j-k]<<(4*k-32);
    else val.l+=d[j-k]<<(4*k);
  }
  return val;
}
@z
