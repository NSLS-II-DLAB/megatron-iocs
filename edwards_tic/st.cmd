#!bin/linux-x86_64/edwards_tic

## You may have to change edwards_tic to something else
## everywhere it appears in this file

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
dbLoadDatabase("dbd/edwards_tic.dbd",0,0)
edwards_tic_registerRecordDeviceDriver(pdbbase) 

drvAsynIPPortConfigure("$(SYSPORT)_TIC1", "$(TSADR):5003")

## Load record instances
dbLoadRecords("db/asynRecord.db","P=Depo,R={TIC:1}Asyn,PORT=Depo_TIC1,ADDR=0,OMAX=100,IMAX=100")
dbLoadRecords("db/edwards_tic.db")

iocInit()

## Start any sequence programs
#seq sncedwards_tic,"user=hxu"
