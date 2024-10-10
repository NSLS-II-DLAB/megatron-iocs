#!../../bin/linux-x86_64/ion_ps

## You may have to change ion_ps to something else
## everywhere it appears in this file

#< envPaths

## Register all support components
dbLoadDatabase("../../dbd/ion_ps.dbd",0,0)
ion_ps_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/ion_ps.db","user=hxu")

iocInit()

## Start any sequence programs
#seq sncion_ps,"user=hxu"
