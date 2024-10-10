#!bin/linux-x86_64/ion_ps

## Location of stream protocol files
epicsEnvSet("ENGINEER",			"hxu x4394")
epicsEnvSet("LOCATION",			"Bldg 703")
epicsEnvSet("STREAM_PROTOCOL_PATH",	"protocol")

epicsEnvSet("SYS",			"Depo")
epicsEnvSet("DEV",			"{PS:1}")
epicsEnvSet("SYSPORT",			"Depo_PS1")
epicsEnvSet("CTSYS",			"Depo-CT")
epicsEnvSet("IOCNAME",			"PS1")
epicsEnvSet("TSADR",			"192.168.100.26")

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST",	"NO")
epicsEnvSet("EPICS_CA_ADDR_LIST",	"192.168.100.255")

## Register all support components
dbLoadDatabase("dbd/ion_ps.dbd",0,0)
ion_ps_registerRecordDeviceDriver(pdbbase) 

drvAsynIPPortConfigure("$(SYSPORT)", "$(TSADR):5006")

## Load record instances
dbLoadRecords("db/asynRecord.db","P=$(SYS),R=$(DEV)Asyn,PORT=$(SYSPORT),ADDR=0,OMAX=100,IMAX=100")
dbLoadRecords("db/reccaster.db","P=$(SYS){IOC:$(IOCNAME)}RecSync")
dbLoadRecords("db/iocAdminSoft.db","IOC={$(CTSYS){IOC:$(IOCNAME)}")
#dbLoadRecords("db/save_restoreStatus.db","P={$(CTSYS){IOC:$(IOCNAME)}")
dbLoadRecords("db/ion_ps.db")

var streamError 1

iocInit()

