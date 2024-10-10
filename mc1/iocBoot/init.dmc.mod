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
WT 2000
MG "INITIALIZATION"
#BZHERE
BZ 4.9
WT 5000
OE 3
MG "DONE"
WT 2000
EN

XQ #THREADA,1
#THREADA
IF(homeA=1)
IF((((_LRA=0)&(hjsA>0))|(_LFA=0)&(hjsA<0)))&(hjogA=0))
IF((((_LRA=1)|(_LDA>1))&(hjsA<0))|(((_LFA=1)|(_LDA=1)|(_LDA=3))&(hjsA>0)))
IF((_MOA=0)&(_BGA=0));JGA=hjsA;WT10;BGA;hjogA=1;ENDIF;ENDIF;ENDIF
IF((((_LRA=1)&(hjsA>0))|((_LFA=1)&(hjsA<0))&(hjogA=1)&(_BGA=1));STA;ENDIF
IF(((_LRA=0)|(_LFA=0))&(_BGA=1)&(hjogA=0));STA;JGA=@ABS[hjsA]*-1;WT10;BGA;hjogA=1;ENDIF
IF((hjogA=1)&(_BGA=0))
IF((((_LRA=1)|(_LDA>1))&(hjsA<0))|(((_LFA=1)|(_LDA=1)|(_LDA=3))&(hjsA>0)))
IF((_MOA=0)&(ueipA=1)&(uiA=1));JGA=hjsA;FIA;WT10;BGA;hjogA=2
ELSE
IF(_MOA=0);hjogA=3;ENDIF;ENDIF;ENDIF;ENDIF
IF((_CN1=-1)&(_HMA<>hswactA)&(hjogA=0)&(_BGA=1));STA;DCA=limdcA;hjogA=3
ELSE
IF((_CN1=1)&(_HMA=hswactA)&(hjogA=0)&(_BGA=1));STA;DCA=limdcA;hjogA=3;ENDIF;ENDIF
IF((hjogA=2)&(_BGA=0));hjogA=3;ENDIF
IF((((_LRA=1)|(_LDA>1))|((_LFA=1)|(_LDA=1)|(_LDA=3)))&(hjogA=3)&(_BGA=0))
WT10;hjogA=0;homeA=0;homedA=1;MG "homedA",homedA;ENDIF;ENDIF
IF(mlock=1);II ,,dpon,dvalues;ENDIF
JP #THREADA
#CMDERR
errstr=_ED;errcde=_TC;cmderr=cmderr+1
EN1
#TCPERR
tcpcde=_TC;tcperr=tcperr+1
RE1
#LIMSWI
IF(((_SCA=2)|(_SCA=3))&(_BGA=1))
DCA=limdcA;VDS=limdcA;VDT=limdcA;ENDIF
RE 1
EN
