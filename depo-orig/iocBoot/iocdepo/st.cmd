#!../../bin/linux-x86_64/depo

## You may have to change depo to something else
## everywhere it appears in this file

#< envPaths

## Register all support components
dbLoadDatabase("../../dbd/depo.dbd",0,0)
depo_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/depo.db","user=hxu")

iocInit()

## Start any sequence programs
#seq sncdepo,"user=hxu"
