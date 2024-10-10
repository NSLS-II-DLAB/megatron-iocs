#!../../bin/linux-x86_64/bk1787b

## You may have to change bk1787b to something else
## everywhere it appears in this file

#< envPaths

## Register all support components
dbLoadDatabase("../../dbd/bk1787b.dbd",0,0)
bk1787b_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/bk1787b.db","user=hxu")

iocInit()

## Start any sequence programs
#seq sncbk1787b,"user=hxu"
