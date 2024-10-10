#!bin/linux-x86_64/dl205
## Location of stream protocol files
epicsEnvSet("ENGINEER",			"hxu x4394")
epicsEnvSet("LOCATION",			"Bldg 703")

epicsEnvSet("SYS",			"Depo")
epicsEnvSet("SYSPORT",			"Depo")
epicsEnvSet("CTSYS",			"Depo")

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST",	"NO")
epicsEnvSet("EPICS_CA_ADDR_LIST",	"192.168.100.255")

## Register all support components
dbLoadDatabase("dbd/dl205.dbd",0,0)
dl205_registerRecordDeviceDriver(pdbbase) 

drvAsynIPPortConfigure("$(SYSPORT)_PLC1", "192.168.100.31:502")

#######################################################################
# modbusInterposeConfig(const char *portName,
#                      modbusLinkType linkType, .... Modbus link layer type: 0 = TCP/IP , 1 = RTU, 2 = ASCII
#                      int timeoutMsec, 
#                      int writeDelayMsec)
modbusInterposeConfig("$(SYSPORT)_PLC1", 0, 1000, 0)

# Enable ASYN_TRACEIO_HEX on octet server
#asynSetTraceIOMask("$(SYSPORT)_PLC1",0,4)
# Enable ASYN_TRACE_ERROR and ASYN_TRACEIO_DRIVER on octet server
#asynSetTraceMask("$(SYSPORT)_PLC1",0,9)

#######################################################################
# modbus port driver is created with the following command:
#drvModbusAsynConfigure(portName, 
#                        tcpPortName,
#                        slaveAddress, 
#                        modbusFunction, 
#                        modbusStartAddress, 
#                        modbusLength,
#                        dataType,
#                        pollMsec, 
#                        plcType);
#######################################################################

##Modbus functions
#Function name                          Function code
#Read Discrete Inputs                    2
#Read Coils                              1
#Write Single Coil                       5
#Write Multiple Coils                   15
#Read Input Registers                    4
#Read Holding Registers                  3
#Write Single Register                   6
#Write Multiple Registers               16
#Read/Write Multiple Registers          23
#Mask Write Register                    22
#Read FIFO Queue                        24
#Read File Record                       20
#Write File Record                      21
#Read Exception Status                   7
#Diagnostic                              8
#Get Com Event Counter                  11
#Get Com Event Log                      12
#Report Slave ID                        17
#Read Device Identification             43
#Encapsulated Interface Transport       43
#
#######################################################################

#######################################################################
#Supported Modbus data types
#modbusDataType value	drvUser field	Description
#0	UINT16	Unsigned 16-bit binary integers
#1	INT16SM	16-bit binary integers, sign and magnitude format. In this format bit 15 is the sign bit, and bits 0-14 are the absolute value of the magnitude of the number. 
#			This is one of the formats used, for example, by Koyo PLCs for numbers such as ADC conversions.
#2	BCD_UNSIGNED	Binary coded decimal (BCD), unsigned. This data type is for a 16-bit number consisting of 4 4-bit nibbles, each of which encodes a decimal number from 0-9. 
#			A BCD number can thus store numbers from 0 to 9999. Many PLCs store some numbers in BCD format.
#3	BCD_SIGNED	4-digit binary coded decimal (BCD), signed. This data type is for a 16-bit number consisting of 3 4-bit nibbles, and one 3-bit nibble. 
#			Bit 15 is a sign bit. Signed BCD numbers can hold values from -7999 to +7999. This is one of the formats used by Koyo PLCs for numbers such as ADC conversions.
#4	INT16		16-bit signed (2's complement) integers. This data type extends the sign bit when converting to epicsInt32.
#5	INT32_LE	32-bit integers, little endian (least significant word at Modbus address N, most significant word at Modbus address N+1)
#6	INT32_BE	32-bit integers, big endian (most significant word at Modbus address N, least significant word at Modbus address N+1)
#7	FLOAT32_LE	32-bit floating point, little endian (least significant word at Modbus address N, most significant word at Modbus address N+1)
#8	FLOAT32_BE	32-bit floating point, big endian (most significant word at Modbus address N, least significant word at Modbus address N+1)
#9	FLOAT64_LE	64-bit floating point, little endian (least significant word at Modbus address N, most significant word at Modbus address N+3)
#10	FLOAT64_BE	64-bit floating point, big endian (most significant word at Modbus address N, least significant word at Modbus address N+3)
#######################################################################

# Configure to read V Memory
# The DL205 has word access to the V memory at Modbus address 11400 - 11477 (octal),
# but this is offset by 1, per CVD. So we start at 011401.
# Access 1 word, Function code = 3, data type = unsigned int.

# Digital and analog input registers: function 3 (Read Holding Registers), address 11401, length 76, data_type = UINT16 = 0, 
# pollMsec = for read func, waits XXX msecs
drvModbusAsynConfigure("depo_plc_11401_In_Word", "$(SYSPORT)_PLC1", 10, 3, 011401, 076, 0, 100, "Koyo")

# Digital/Analog output registers: function 6 (Write Single Register), address 40500, length 6, data_type = UINT16 = 0, 
# pollMsec = for read func, waits XXX msecs
#drvModbusAsynConfigure("depo_plc_15260_Out_Word", "$(SYSPORT)_PLC1", 10, 6, 015260, 06, 0, 1, "Koyo")
#working
#drvModbusAsynConfigure("depo_plc_11601_Out_Word", "$(SYSPORT)_PLC1", 10, 16, 015200, 010, 0, 1, "Koyo")

# write through 11601
drvModbusAsynConfigure("depo_plc_11601_Out_Word", "$(SYSPORT)_PLC1", 10, 6, 011601, 0100, 0, 1, "Koyo")
# check readout through 11601
drvModbusAsynConfigure("depo_plc_11601_Out_Word_RBV", "$(SYSPORT)_PLC1", 10, 3, 011601, 0100, 0, 100, "Koyo")
# check readout through 15200
drvModbusAsynConfigure("depo_plc_15200_Out_Word_RBV", "$(SYSPORT)_PLC1", 10, 3, 015200, 0100, 0, 100, "Koyo")

#drvModbusAsynConfigure("depo_plc_11673_B0", "$(SYSPORT)_PLC1", 10, 1, 011673, 01, 0, 100, "Koyo")
#drvModbusAsynConfigure("depo_plc_11676_B0", "$(SYSPORT)_PLC1", 10, 1, 011676, 01, 0, 100, "Koyo")


dbLoadRecords("db/depo-plc.db")
dbLoadRecords("db/depo-plc-di.db")
dbLoadRecords("db/depo-plc-ai-calc.db")
dbLoadRecords("db/depo-plc-pt-calc.db")

dbLoadRecords("db/depo-plc-do.db")
dbLoadRecords("db/test.db")
dbLoadRecords("db/depo-plc-write.db")
dbLoadRecords("db/depo-plc-gv.db")


iocInit()

#dbpf "Depo{PLC:1}Enbl:Write-Cmd.SCAN" ".1 second"
