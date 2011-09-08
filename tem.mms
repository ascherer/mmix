a      GREG  #80000000
d      GREG  Data_Segment
       LOC #100
Main   FLOTU $0,1
       STSF  $0,d,0
       FLOTU $1,a
       STSF  $1,d,4
       TRAP  0,Halt,0
