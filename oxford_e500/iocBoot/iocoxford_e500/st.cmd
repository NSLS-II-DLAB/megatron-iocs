#!../../bin/linux-x86_64/oxford_e500

## You may have to change oxford_e500 to something else
## everywhere it appears in this file

#< envPaths

## Register all support components
dbLoadDatabase("../../dbd/oxford_e500.dbd",0,0)
oxford_e500_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/oxford_e500.db","user=hxu")

iocInit()

## Start any sequence programs
#seq sncoxford_e500,"user=hxu"
