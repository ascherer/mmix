* Dallos's amazing way to extract the leading bit
* (February 2018, exercise 7.1.3--38)
      LOC  #100
x    GREG  #3700030014150092
y    GREG
a    GREG  #ff7f3f1f0f070301
b    GREG  #80c0e0f0f8fcfeff

      LOC  #100
Main MOR y,a,x        smear the transposed mtx downwards
     SRU y,y,1        shift right 1, leaking lo bits of octas
     MOR y,a,y        smear the transposed mtx downwards
     MOR y,y,b        smear the transposed mtx rightwards
     ANDN y,x,y       remove all but the leading bit
     TRAP 0,Halt,0


