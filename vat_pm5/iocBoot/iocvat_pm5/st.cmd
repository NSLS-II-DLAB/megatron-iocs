#!../../bin/linux-x86_64/vat_pm5

## You may have to change vat_pm5 to something else
## everywhere it appears in this file

#< envPaths

## Register all support components
dbLoadDatabase("../../dbd/vat_pm5.dbd",0,0)
vat_pm5_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/vat_pm5.db","user=hxu")

iocInit()

## Start any sequence programs
#seq sncvat_pm5,"user=hxu"
