% Example program ... Table of primes ... triple-divide version
%
       LOC #2000000000000000 % Data segment
PRIME  WYDE 2           % PRIME[0]=2
       LOC  @+2*499     % PRIME[1], ..., PRIME[499]
JCON   WYDE (1-500)*2
%
       GREGTOP $g250
p0     GREG Prime       % p0 == &PRIME[0]
p500   GREG Prime+2*500 % p500 == &PRIME[500]
n      GREG 0
q      GREG 0
r      GREG 0
jj     GREG 0           % jj == (J-500)*2
pk     GREG 0           % pk == &PRIME[K]
%
d      IS   $0
%
       LOC  #1000
Main   LDW  jj,JCON     % P1. Start table. J <- 1.
       SETL n,3         % N <- 3.
2H     STW  n,p500,jj   % P2. N is prime. PRIME[J] <- N.
       INCL jj,2        % J <- J+1.
3H     BZ   jj,2F       % P3. 500 found?
4H     INCL n,2         % P4. Advance N.
5H     ADD  pk,p0,2     % P5. K <- 1.
6H     LDW  d,pk,0      % P6. PRIME[K]\N?  D <- PRIME[K].
       DIV  q,n,d       % Q <- N/PRIME[K].
       GET  r,rR        % R <- N mod PRIME[K].
       LDW  d,pk,2
       DIV  q,n,d
       GET  $2,rR
       LDW  d,pk,4
       DIV  q,n,d
       GET  $3,rR
       BZ   r,4B        % To P4 if R=0.
       BZ   $2,4B
       BZ   $3,4B
7H     LSS  $1,d,q      % P7. PRIME[K] large?
8H     INCL pk,6        % P8. Advance K.
       PBNZ $1,6B       % To P6 if PRIME[K]<Q.
       JMP  2B          % Otherwise N is prime.
2H     TRAP                                  % to be continued...
