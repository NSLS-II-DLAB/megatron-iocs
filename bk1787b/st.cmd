#!bin/linux-x86_64/bk1787b

## Location of stream protocol files
epicsEnvSet("ENGINEER",			"hxu x4394")
epicsEnvSet("LOCATION",			"Bldg 703")
epicsEnvSet("STREAM_PROTOCOL_PATH",	"protocol")

epicsEnvSet("SYS",			"Depo")
epicsEnvSet("SYSPORT",			"Depo")
epicsEnvSet("CTSYS",			"Depo")
epicsEnvSet("TSADR",			"192.168.100.26")

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST",	"NO")
epicsEnvSet("EPICS_CA_ADDR_LIST",	"192.168.100.255")

## Register all support components
dbLoadDatabase("dbd/bk1787b.dbd",0,0)
bk1787b_registerRecordDeviceDriver(pdbbase) 

drvAsynIPPortConfigure("$(SYSPORT)_PS2", "$(TSADR):5002")

## Load record instances
dbLoadRecords("db/asynRecord.db","P=Depo,R={BK:PS}Asyn,PORT=Depo_PS2,ADDR=0,OMAX=100,IMAX=100")
dbLoadRecords("db/bk_1787b.db")

#var streamError 1

iocInit()

