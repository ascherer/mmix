@x [3]
@ The command line might also contain additional options, some day.
@y
@r
@ The command line might also contain additional options, some day.
@z

@x [7]
@ @<Change the current location@>=
@y
@r
@ @<Change the current location@>=
@z

@x [13]
  printf("Eh? Sorry, I don't understand. (Type h for help)\n");
@y
  printf("Eh? Sorry, I don't understand. (Type h for help)\n"); @+
@z

@x [17]
@d panic(r,m,...) {@+fprintf(stderr,
@y
@-d@>
@-r@>
@-m@>
@-__VA_OPT__@>
@-__VA_ARGS__@>
@d panic(r,m,...) {@+fprintf(stderr,
@z

@x [19]
@ The register stack pointers, rO and rS, are not kept up to date
@y
@r
@ The register stack pointers, rO and rS, are not kept up to date
@z

@x [26]
@* Index.
@y
@z