#!../../bin/linux-x86_64/dl205

## You may have to change dl205 to something else
## everywhere it appears in this file

#< envPaths

## Register all support components
dbLoadDatabase("../../dbd/dl205.dbd",0,0)
dl205_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/dl205.db","user=hxu")

iocInit()

## Start any sequence programs
#seq sncdl205,"user=hxu"
