#!bin/linux-x86_64/depo

## Location of stream protocol files
epicsEnvSet("ENGINEER",			"hxu x4394")
epicsEnvSet("LOCATION",			"Bldg 703")
epicsEnvSet("STREAM_PROTOCOL_PATH",	"protocol")

epicsEnvSet("SYS",			"Depo")
epicsEnvSet("SYSPORT",			"Depo")
epicsEnvSet("CTSYS",			"Depo")
epicsEnvSet("TSADR",			"192.168.1.44")

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST",	"NO")
epicsEnvSet("EPICS_CA_ADDR_LIST",	"192.168.1.255")

## Register all support components
dbLoadDatabase("dbd/depo.dbd",0,0)
depo_registerRecordDeviceDriver(pdbbase) 

#drvAsynIPPortConfigure("$(SYSPORT)_Chill1", "$(TSADR):4001")
#drvAsynIPPortConfigure("$(SYSPORT)_TM1", "$(TSADR):4002")
#drvAsynIPPortConfigure("$(SYSPORT)_GVC1", "$(TSADR):4002")
#drvAsynIPPortConfigure("$(SYSPORT)_TTC1", "$(TSADR):4002")
drvAsynIPPortConfigure("$(SYSPORT)_PS1", "$(TSADR):4002")


## Load record instances
dbLoadRecords("db/asynRecord.db")
#dbLoadRecords("db/Neslab_rte.db")
#dbLoadRecords("db/Oxford_E500.db")
#dbLoadRecords("db/VAT_Control.db")
#dbLoadRecords("db/TE_TC.db")
dbLoadRecords("db/BK_1787B.db")

iocInit()

