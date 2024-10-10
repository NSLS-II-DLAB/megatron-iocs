#!bin/linux-x86_64/vat_pm5

## Location of stream protocol files
epicsEnvSet("ENGINEER",			"hxu x4394")
epicsEnvSet("LOCATION",			"Bldg 703")
epicsEnvSet("STREAM_PROTOCOL_PATH",	"protocol")

epicsEnvSet("SYS",			"Depo")
epicsEnvSet("CTSYS",			"Depo-CT")
epicsEnvSet("IOCNAME",			"GV")
epicsEnvSet("TSADR",			"192.168.100.26")

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST",	"NO")
epicsEnvSet("EPICS_CA_ADDR_LIST",	"192.168.100.255")

## Register all support components
dbLoadDatabase("dbd/vat_pm5.dbd",0,0)
vat_pm5_registerRecordDeviceDriver(pdbbase) 

drvAsynIPPortConfigure("$(SYS)_GVC1", "$(TSADR):5007")
drvAsynIPPortConfigure("$(SYS)_GVC2", "$(TSADR):5008")

## Load record instances
dbLoadRecords("db/asynRecord.db","P=$(SYS),R={GVC:1}Asyn,PORT=Depo_GVC1,ADDR=0,OMAX=100,IMAX=100")
dbLoadRecords("db/asynRecord.db","P=$(SYS),R={GVC:2}Asyn,PORT=Depo_GVC2,ADDR=0,OMAX=100,IMAX=100")
dbLoadRecords("db/reccaster.db","P=$(SYS){IOC:$(IOCNAME)}RecSync")
dbLoadRecords("db/iocAdminSoft.db","IOC={$(CTSYS){IOC:$(IOCNAME)}")
#dbLoadRecords("db/save_restoreStatus.db","P={$(CTSYS){IOC:$(IOCNAME)}")

dbLoadRecords("db/vat_control.db")

#var streamError 1

iocInit()

