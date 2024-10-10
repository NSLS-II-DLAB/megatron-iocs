TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = dl205
# dl205.dbd will be created and installed
DBD += dl205.dbd

# dl205.dbd will be made up from these files:
dl205_DBD += base.dbd

# Include dbd files from all support applications:
dl205_DBD += asyn.dbd
dl205_DBD += drvAsynIPPort.dbd
dl205_DBD += modbusSupport.dbd
dl205_DBD += devIocStats.dbd
dl205_DBD += caPutLog.dbd
dl205_DBD += subSCurveCalc.dbd

# Add all the support libraries needed by this IOC
dl205_LIBS += asyn modbus devIocStats caPutLog autosave

# dl205_registerRecordDeviceDriver.cpp derives from dl205.dbd
dl205_SRCS += dl205_registerRecordDeviceDriver.cpp

dl205_SRCS += subSCurveCalc.c

# Build the main IOC entry point on workstation OSs.
dl205_SRCS_DEFAULT += dl205Main.cpp
dl205_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#dl205_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
dl205_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

