* Exercise 7.2.2.3--258 (that number will change)
* a cheap substitute for GAD filtering if domain sizes <= 64
t IS $255
start GREG Data_Segment      first domain of given size
next  GREG Data_Segment+64   next domain of same size
dom   GREG Data_Segment+128  D_k is the octabyte dom+8k
u     GREG  % bits for U
h     GREG  % bits for H
i     GREG  % temp index
j     GREG  % loop step
k     GREG  % domain being processed
kk    GREG  % 8*k
m     GREG 6
      LOC Data_Segment+128+8 beginning of test data
      OCTA #0000000000000030
      OCTA #bad0ad0be0facade
      OCTA #0000000000000072
      OCTA #0000000000000060
      OCTA #0000000000000003
      OCTA #0000000000000050
      LOC  #100
Main  SET  j,0
      SET  i,56             
1H    STOU j,start,i        Clear start[i..i+7] to zero
      SUB  i,i,8            i <- i-8
      PBNN i,1B             while i>=0
      CMP  t,i,0            t <- -1
      STB  t,m,start        start[m]<-t
      SET  k,m
1H    8ADDU kk,k,0
      LDOU  t,kk,dom        t <- D_k
      SADD  t,t,0           t <- |D_k|
      CMP   i,t,m
      CSP   t,i,m           if t>m set t<-m
      LDB   i,start,t 
      STB   i,next,k        next[k]<-start[t]
      STB   k,start,t       start[t]<-k
      SUB   k,k,1           k<-k-1
      PBP   k,1B            loop while k>0
DoIt  SET   u,0             u<-\emptyset
      SET   h,0             h<-\emptyset
      SET   i,0             i<-0
      LDB   k,start,0       k<-start[0]
      PBZ   k,2F            branch unless there was an empty domain
1H    INCL  j,1             j<-j+1
      8ADDU kk,k,0
      LDOU  t,kk,dom        t<-D_k
      OR    u,u,t           U<-U\cup t
      ANDN  t,t,h           t<-t\setminus H
      BZ    t,Unfeas        To Unfeas if D_k will become empty
      STOU  t,kk,dom        D_k<-t
      SADD  t,u,0           t<-|U|
      CMP   t,t,j           t<-sign(t-j)
      BN    t,Unfeas        To Unfeas if |U|<j
      CSZ   h,t,u           if |U|=j set H<-U
      LDB   k,k,next        k<-next[k]
      BP    k,1B            repeat loop if k>0
      BN    k,Feas          we're done if k<0
2H    INCL  i,1             i<-i+1 (for domains of size i)
      LDB   k,i,start       k<-start[i]
      PBP   k,1B            repeat loop if k>0
      PBZ   k,2B            increase size if k=0
Feas  TRAP  0,Halt,0        normal exit
Unfeas TRAP 0,Halt,0        abnormal exit (domains not feasible)

      
