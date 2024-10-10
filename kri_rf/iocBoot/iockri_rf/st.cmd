#!../../bin/linux-x86_64/kri_rf

## You may have to change kri_rf to something else
## everywhere it appears in this file

#< envPaths

## Register all support components
dbLoadDatabase("../../dbd/kri_rf.dbd",0,0)
kri_rf_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/kri_rf.db","user=hxu")

iocInit()

## Start any sequence programs
#seq snckri_rf,"user=hxu"
