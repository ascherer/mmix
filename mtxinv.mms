* Inverse y of 8x8 binary matrix x by Goucher's hack
x     IS   $255
y     IS   $254
i     GREG #8040201008040201
test  GREG #c06030180c060301

      LOC  #100
      GREG @
Main  SET  x,test
0H    MXOR $1,x,x    % 2
      MXOR $2,$1,x   % 3
      MXOR y,$2,$1  % 5
      MXOR y,y,y  % 10
      MXOR y,y,y  % 20
      MXOR y,y,y  % 40
      MXOR $1,y,x % 41
      MXOR y,$1,y  % 81
      MXOR y,y,y  % 162
      MXOR y,y,y  % 324
      MXOR y,y,y  % 648
      MXOR y,y,y  % 1296
      MXOR y,y,y  % 2592
      MXOR y,y,y  % 5184
      MXOR y,y,$2   % 5187
      MXOR y,y,y  % 10374
      MXOR y,y,y  % 20748
      MXOR y,y,y  % 41496
      MXOR y,y,y  % 82992
      MXOR y,y,y  % 165914
      MXOR y,y,y  % 331968
      MXOR y,y,$1  % 332009
      MXOR y,y,y  % 664018
      MXOR y,y,x   % 664019
      MXOR y,y,y  % 1328032; y=x^{n-2}
      MXOR $1,y,x    % $1=x^{n-1}
      CMPU $2,$1,i  % is x^{n-1}=I?
      CSNZ y,$2,$1 % if not, y\gets x^{n-1}

      SET  x,y  trace this
      JMP  0B

