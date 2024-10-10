#!bin/linux-x86_64/nes_rte

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
dbLoadDatabase("dbd/nes_rte.dbd",0,0)
nes_rte_registerRecordDeviceDriver(pdbbase) 

drvAsynIPPortConfigure("$(SYSPORT)_Chill1", "$(TSADR):5004")

## Load record instances
dbLoadRecords("db/asynRecord.db","P=Depo,R={Chill:1}Asyn,PORT=Depo_Chill1,ADDR=0,OMAX=100,IMAX=100")
dbLoadRecords("db/nes_rte.db")

iocInit()
