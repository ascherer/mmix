* Traffic Signal Problem
rate GREG 100 % ridiculously small, for testing (shd be 250MHz)
t IS $255
Sensor_Buf IS Data_Segment
     GREG Sensor_Buf

       LOC #100
         GREG @
delta    GREG
ref_time GREG
delay_go GREG
2H    NEG  delta,ref_time
1H    SET  ref_time,t
      GET  t,rI
  SL t,t,52; SR t,t,52  (truncate rI to 12 bits for testing)
      CMPU ref_time,ref_time,t
      PBP  ref_time,1B
Delay GET  t,rI
  SL t,t,52; SR t,t,52  (truncate rI to 12 bits for testing)
      SUBU ref_time,t,delta
      BN   t,1F
      BN   ref_time,2B
1H    GET  t,rI
      SUBU t,t,ref_time  NB: not CMPU
  SL t,t,52; SR t,t,52  (truncate to 12 bits for testing)
      PBP  t,1B
      GO   delay_go,delay_go,0

Lights  IS 3
Sensor IS 4
%Lights_Name BYTE "/dev/lights",0
%Sensor_Name BYTE "/dev/sensor",0
Lights_Name BYTE "lights",0     (temporary name)
Sensor_Name BYTE "sensor",0    (temporary name)
Lights_Args OCTA Lights_Name,BinaryWrite
Sensor_Args OCTA Sensor_Name,BinaryRead
Read_Sensor OCTA Sensor_Buf,1

Dg IS #40;Da IS #c0;Dr IS #80;Dw IS #4;Dd IS #c
Bg IS #10;Ba IS #30;Br IS #20;Bw IS #1;Bd IS #3
Boulevard BYTE Dg|Dw|Br|Bd,0,Dg|Dd|Br|Bd,0,Dg|Br|Bd,0,Da|Dd|Br|Bd,0
Avenue    BYTE Bg|Bw|Dr|Dd,0,Bg|Bd|Dr|Dd,0,Bg|Dr|Dd,0,Ba|Bd|Dr|Dd,0

flash_go GREG
n     GREG
green GREG
Flash SET  n,8
1H    ADDU t,green,2*1
      TRAP 0,Fputs,Lights DONT WALK
      SR   delta,rate,1
      GO   delay_go,Delay
      ADDU t,green,2*2
      TRAP 0,Fputs,Lights off
      SR   delta,rate,1
      GO   delay_go,Delay
      SUB   n,n,1
      PBP   n,1B
      ADDU t,green,2*1
      TRAP 0,Fputs,Lights DONT WALK
      MUL  delta,rate,4
      GO   delay_go,Delay
      ADDU t,green,2*3
      TRAP 0,Fputs,Lights DONT WALK, amber
      GO   flash_go,flash_go,0

Main GETA t,Lights_Args
     TRAP 0,Fopen,Lights
     GETA t,Sensor_Args
     TRAP 0,Fopen,Sensor
     JMP  2F

Wait  GETA t,Read_Sensor
      TRAP 0,Fread,Sensor
      LDB  t,Sensor_Buf
      BZ   t,Wait
      GETA green,Boulevard
      GO   flash_go,Flash
      MUL  delta,rate,8
      GO   delay_go,Delay
      GETA  t,Avenue
      TRAP  0,Fputs,Lights
      MUL   delta,rate,8
      GO   delay_go,Delay
      GETA  green,Avenue
      GO   flash_go,Flash
      GETA  t,Read_Sensor
      TRAP  0,Fread,Sensor % clear redundant signal
      MUL   delta,rate,5
      GO   delay_go,Delay
2H    GETA  t,Boulevard
      TRAP  0,Fputs,Lights
      MUL   delta,rate,18
      GO   delay_go,Delay
      JMP   Wait

