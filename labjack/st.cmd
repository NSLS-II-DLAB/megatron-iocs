#!bin/linux-x86_64/labjack

## Location of stream protocol files
epicsEnvSet("ENGINEER",			"hxu x4394")
epicsEnvSet("LOCATION",			"Bldg 703")

epicsEnvSet("SYS",			"Depo")
epicsEnvSet("SYSPORT",			"Depo")
epicsEnvSet("CTSYS",			"Depo")

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST",	"NO")
epicsEnvSet("EPICS_CA_ADDR_LIST",	"192.168.100.255")

## Register all support components
dbLoadDatabase("dbd/labjack.dbd",0,0)
labjack_registerRecordDeviceDriver(pdbbase) 

#< LJT7_3.cmd
#<LJT7_2.cmd
#<LJT7_1.cmd
<LJT7_4.cmd
#<depo-soft.cmd

iocInit()

