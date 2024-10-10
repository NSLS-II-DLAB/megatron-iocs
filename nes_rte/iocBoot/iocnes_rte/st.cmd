#!../../bin/linux-x86_64/nes_rte

## You may have to change nes_rte to something else
## everywhere it appears in this file

#< envPaths

## Register all support components
dbLoadDatabase("../../dbd/nes_rte.dbd",0,0)
nes_rte_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/nes_rte.db","user=hxu")

iocInit()

## Start any sequence programs
#seq sncnes_rte,"user=hxu"
