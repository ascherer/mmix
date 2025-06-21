% Cassio Neri's solution to exercise 7.1.3--23 (left parens are 1 bits)
xxxiii GREG 33
mu0bar GREG #aaaaaaaaaaaaaaaa
x      GREG
t      GREG
u      GREG
k      GREG
v      GREG
       LOC  #100
Main   SRU  x,mu0bar,56      this is the case #aa (m=4)
1H     SUBU t,x,1
       ANDN u,x,t
       SADD k,t,x
       ADDU v,x,u
       SADD k,x,v
       SUB  k,xxxiii,k
       SRU  t,mu0bar,k
       SRU  t,t,k
       ADDU x,v,t            is ADDU y,v,t if we don't loop immediately
       JMP 1B
