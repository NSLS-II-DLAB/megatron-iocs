#!bin/linux-x86_64/oxford_e500

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
dbLoadDatabase("dbd/oxford_e500.dbd",0,0)
oxford_e500_registerRecordDeviceDriver(pdbbase) 

# Not connected to Moxa
drvAsynIPPortConfigure("$(SYSPORT)_TM1", "$(TSADR):500")

## Load record instances
dbLoadRecords("db/asynRecord.db","P=Depo,R={TM:1}Asyn,PORT=Depo_TM1,ADDR=0,OMAX=100,IMAX=100")
dbLoadRecords("db/oxford_e500.db")

iocInit()

