      LOC   #100
Main  PUSHJ $206,SUB1
      PUSHJ $200,SUB2
      PUSHJ $250,SUB2
      TRAP  0,Halt,0
SUB2  GET   $0,rJ
      PUSHJ $205,SUB1
      PUT   rJ,$0
SUB1  SET   $49,#1234
      POP   50,0
