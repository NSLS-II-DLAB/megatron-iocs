#AUTO
BA A
BM 609600
KD 5
KP 1
KI .1
MT 1
CE 2
CN 1,-1,-1,0,0
HV 5000
FL 2713600
BL -2105400 
AC 1000000
DC 1000000
SP 200000
OE 1
ERA=16384
IF(cinitA=0)
BZ -4.9
ENDIF
IF((_MOA=0)&(cinitA=0));cinitA=1
ELSE
cinitA=0;ENDIF
EN
