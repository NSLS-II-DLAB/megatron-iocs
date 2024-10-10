#!../../bin/linux-x86_64/edwards_tic

## You may have to change edwards_tic to something else
## everywhere it appears in this file

#< envPaths

## Register all support components
dbLoadDatabase("../../dbd/edwards_tic.dbd",0,0)
edwards_tic_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/edwards_tic.db","user=hxu")

iocInit()

## Start any sequence programs
#seq sncedwards_tic,"user=hxu"
