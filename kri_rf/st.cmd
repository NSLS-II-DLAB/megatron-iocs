#!bin/linux-x86_64/kri_rf

## Location of stream protocol files
epicsEnvSet("ENGINEER",			"hxu x4394")
epicsEnvSet("LOCATION",			"Bldg 703")
epicsEnvSet("STREAM_PROTOCOL_PATH",	"protocol")

epicsEnvSet("SYS",			"Depo")
epicsEnvSet("DEV",			"{RF:1}")
epicsEnvSet("SYSPORT",			"Depo_RF1")
epicsEnvSet("CTSYS",			"Depo-CT")
epicsEnvSet("TSADR",			"192.168.100.26")
epicsEnvSet("IOCNAME",			"RF1")
epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST",	"NO")
epicsEnvSet("EPICS_CA_ADDR_LIST",	"192.168.100.255")

## Register all support components
dbLoadDatabase("dbd/kri_rf.dbd",0,0)
kri_rf_registerRecordDeviceDriver(pdbbase) 

drvAsynIPPortConfigure("$(SYSPORT)", "$(TSADR):5012")

## Load record instances
dbLoadRecords("db/asynRecord.db","P=$(SYS),R=$(DEV)Asyn,PORT=$(SYSPORT),ADDR=0,OMAX=100,IMAX=100")
dbLoadRecords("db/reccaster.db","P=$(SYS){IOC:$(IOCNAME)}RecSync")
dbLoadRecords("db/iocAdminSoft.db","IOC={$(CTSYS){IOC:$(IOCNAME)}")
#dbLoadRecords("db/save_restoreStatus.db","P={$(CTSYS){IOC:$(IOCNAME)}")
dbLoadRecords("db/kri_rf.db")

## autosave/restore machinery
#save_restoreSet_Debug(0)
#save_restoreSet_IncompleteSetsOk(1)
#save_restoreSet_DatedBackupFiles(1)
#save_restoreSet_status_prefix("Depo{Dev}")

#set_savefile_path("${TOP}/as", "/save")
#set_requestfile_path("${TOP}/as", "/req")
#system("install -m 777 -d ${TOP}/as/save")
#system("install -m 777 -d ${TOP}/as/req")

#set_pass0_restoreFile("info_settings.sav")
#set_pass1_restoreFile("info_settings.sav")

iocInit()

#cd ${TOP}/as/req
#makeAutosaveFiles()
#create_monitor_set("info_settings.req", 15, "")
