#!bin/linux-x86_64/te_tc

## Location of stream protocol files
epicsEnvSet("ENGINEER",			"hxu x4394")
epicsEnvSet("LOCATION",			"Bldg 703")
epicsEnvSet("STREAM_PROTOCOL_PATH",	"protocol")

epicsEnvSet("SYS",			"Depo")
epicsEnvSet("DEV",			"{TC:1}")
epicsEnvSet("SYSPORT",			"Depo_TC1")
epicsEnvSet("CTSYS",			"Depo-CT")
epicsEnvSet("TSADR",			"192.168.100.26")
epicsEnvSet("IOCNAME",			"TC1")
epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST",	"NO")
epicsEnvSet("EPICS_CA_ADDR_LIST",	"192.168.100.255")

## Register all support components
dbLoadDatabase("dbd/te_tc.dbd",0,0)
te_tc_registerRecordDeviceDriver(pdbbase) 

drvAsynIPPortConfigure("$(SYSPORT)_TC1", "$(TSADR):5013")

## Load record instances
dbLoadRecords("db/asynRecord.db","P=$(SYS),R=$(DEV)Asyn,PORT=$(SYSPORT),ADDR=0,OMAX=100,IMAX=100")
dbLoadRecords("db/reccaster.db","P=$(SYS){IOC:$(IOCNAME)}RecSync")
dbLoadRecords("db/iocAdminSoft.db","IOC={$(CTSYS){IOC:$(IOCNAME)}")
#dbLoadRecords("db/save_restoreStatus.db","P={$(CTSYS){IOC:$(IOCNAME)}")

dbLoadRecords("db/te_tc.db")

var streamError 1

iocInit()
