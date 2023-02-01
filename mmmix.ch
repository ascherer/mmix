@x [0] l.9
@s bool int
@y
@z

@x [5] l.118
char buffer[BUF_SIZE];
@y
static char buffer[BUF_SIZE];
@z

@x [13] l.374
  fgets(buffer,BUF_SIZE,stdin);
@y
  if (fgets(buffer,BUF_SIZE,stdin)) {}
@z

Avoid cyclic dependeny. Move this part to mmix-mem.ch.

@x [16,17] l.433
static unsigned char d[BUF_SIZE];

@ Here's a simple program to read an octabyte in hexadecimal notation
from a buffer. It changes the buffer by storing a null character
after the input.
@^radix conversion@>

@<Sub...@>=
octa read_hex @,@,@[ARGS((char *))@];@+@t}\6{@>
octa read_hex(p)
  char *p;
{
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
@y
@ Function |read_hex| is used in \.{mmix-mem} (referenced as |extern|),
so we had better move it ``up'' (together with the |static| variable in
the previous section).
@z

@x [25] l.563
octa seven_octa={0,7};
@y
octa seven_octa={0,7};
extern octa read_hex @,@,@[ARGS((char *))@];
@z
