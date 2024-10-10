#!../../bin/linux-x86_64/labjack

#- You may have to change labjack to something else
#- everywhere it appears in this file

#< envPaths

## Register all support components
dbLoadDatabase("../../dbd/labjack.dbd",0,0)
labjack_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/labjack.db","user=softioc")

iocInit()

## Start any sequence programs
#seq snclabjack,"user=softioc"
