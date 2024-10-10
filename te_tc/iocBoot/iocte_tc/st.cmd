#!../../bin/linux-x86_64/te_tc

## You may have to change te_tc to something else
## everywhere it appears in this file

#< envPaths

## Register all support components
dbLoadDatabase("../../dbd/te_tc.dbd",0,0)
te_tc_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/te_tc.db","user=hxu")

iocInit()

## Start any sequence programs
#seq sncte_tc,"user=hxu"
