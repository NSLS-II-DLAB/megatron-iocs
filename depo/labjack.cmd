#!bin/linux-x86_64/depo

epicsEnvSet("SYS",			"Depo")
epicsEnvSet("SYSPORT",			"Depo")

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST",	"NO")
epicsEnvSet("EPICS_CA_ADDR_LIST",	"192.168.1.255")

## Register all support components
dbLoadDatabase("dbd/depo.dbd",0,0)
depo_registerRecordDeviceDriver(pdbbase) 

epicsEnvSet("LJPORT", "LJ1")
drvAsynIPPortConfigure("$(LJPORT)", "192.168.1.211:502", 0, 0, 1)
#######################################################################
# modbusInterposeConfig(const char *portName,
#                      modbusLinkType linkType, .... Modbus link layer type: 0 = TCP/IP , 1 = RTU, 2 = ASCII
#                      int timeoutMsec,
#                      int writeDelayMsec)
modbusInterposeConfig("$(LJPORT)", 0, 0, 0)

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
#Supported Modbus data types
#modbusDataType value   drvUser field   Description
#0      UINT16  Unsigned 16-bit binary integers
#1      INT16SM         16-bit binary integers, sign and magnitude format. In this format bit 15 is the sign bit, and bits 0-14 are the absolute value of the magnitude of the number.
#                       This is one of the formats used, for example, by Koyo PLCs for numbers such as ADC conversions.
#2      BCD_UNSIGNED    Binary coded decimal (BCD), unsigned. This data type is for a 16-bit number consisting of 4 4-bit nibbles, each of which encodes a decimal number from 0-9.
#                       A BCD number can thus store numbers from 0 to 9999. Many PLCs store some numbers in BCD format.
#3      BCD_SIGNED      4-digit binary coded decimal (BCD), signed. This data type is for a 16-bit number consisting of 3 4-bit nibbles, and one 3-bit nibble.
#                       Bit 15 is a sign bit. Signed BCD numbers can hold values from -7999 to +7999. This is one of the formats used by Koyo PLCs for numbers such as ADC conversions.
#4      INT16           16-bit signed (2's complement) integers. This data type extends the sign bit when converting to epicsInt32.
#5      INT32_LE        32-bit integers, little endian (least significant word at Modbus address N, most significant word at Modbus address N+1)
#6      INT32_BE        32-bit integers, big endian (most significant word at Modbus address N, least significant word at Modbus address N+1)
#7      FLOAT32_LE      32-bit floating point, little endian (least significant word at Modbus address N, most significant word at Modbus address N+1)
#8      FLOAT32_BE      32-bit floating point, big endian (most significant word at Modbus address N, least significant word at Modbus address N+1)
#9      FLOAT64_LE      64-bit floating point, little endian (least significant word at Modbus address N, most significant word at Modbus address N+3)
#10     FLOAT64_BE      64-bit floating point, big endian (most significant word at Modbus address N, least significant word at Modbus address N+3)
#######################################################################
 
# Labjack T7 AIs: function 4 (Read Input Registers), address 0, length 14, data_type = FLOAT32_BE = 8,
# pollMsec - for read func, waits XXX msecs
drvModbusAsynConfigure("$(LJPORT)_AI", "$(LJPORT)", 0, 4, 0, 28, 8, 100, "LJ_T7")
dbLoadRecords("db/Labjack_T7-ai.db","Sys=$(SYS), Dev={IO},LJPORT=LJ1")

# Labjack T7 AOs: function 16 (Write Multiple Registers), address 1000, length 4, data_type = FLOAT32_BE = 8,
# pollMsec - for write function (4,..) any non-zero val to read first
drvModbusAsynConfigure("$(LJPORT)_AO", "$(LJPORT)", 0, 16, 1000, 4, 8, 1, "LJ_T7")

# Labjack T7 AO RBVs: function 3 (Read Holding Registers), address 0, length 4, data_type = FLOAT32_BE = 8,
# pollMsec - for read func, waits XXX msecs
drvModbusAsynConfigure("$(LJPORT)_AO_RBV", "$(LJPORT)", 0, 3, 1000, 4, 8, 100, "LJ_T7")
dbLoadRecords("db/Labjack_T7-ao-all.db","Sys=$(SYS), Dev={IO},LJPORT=LJ1")

# Labjack T7 DOs: function 6 (Write Single Register), address 2000, length 8, data_type = UNIT16 = 0,
# pollMsec - for write function (4,..) any non-zero val to read first
drvModbusAsynConfigure("$(LJPORT)_DO", "$(LJPORT)", 0, 6, 2000, 8, 0, 1, "LJ_T7")
dbLoadRecords("db/Labjack_T7-do.db","Sys=$(SYS), Dev={IO},LJPORT=LJ1")

# Labjack T7 DO RBVs: function 4 (Read Single Register), address 2008, length 8, data_type = UINT16 = 0,
# pollMsec - for read func, waits XXX msecs
drvModbusAsynConfigure("$(LJPORT)_DI", "$(LJPORT)", 0, 4, 2008, 8, 0, 100, "LJ_T7")
dbLoadRecords("db/Labjack_T7-di.db","Sys=$(SYS), Dev={IO},LJPORT=LJ1")

# Labjack T7 AI_EFs: function 6 (Write Single Register), address 9000, length 8, data_type = UNIT32 = 6,
# pollMsec - for write function (4,..) any non-zero val to read first
# EF_INDEX
drvModbusAsynConfigure("$(LJPORT)_TC_TYPE", "$(LJPORT)", 0, 6, 9000, 8, 6, 1, "LJ_T7")
# EF_CONFIG_A
drvModbusAsynConfigure("$(LJPORT)_TC_UNIT", "$(LJPORT)", 0, 6, 9300, 8, 6, 1, "LJ_T7")

# Labjack T7 AI_EFs: function 4 (Read Single Register), address 7000, length 16, data_type = FLOAT32_BE = 8,
# pollMsec - for read func, waits XXX msecs
drvModbusAsynConfigure("$(LJPORT)_EF_A", "$(LJPORT)", 0, 4, 7000, 32, 8, 100, "LJ_T7")
dbLoadRecords("db/Labjack_T7-ef-a.db","Sys=$(SYS), Dev={IO},LJPORT=LJ1")

iocInit()

