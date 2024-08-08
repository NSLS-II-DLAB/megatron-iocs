TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = depo
# depo.dbd will be created and installed
DBD += depo.dbd

# depo.dbd will be made up from these files:
depo_DBD += base.dbd

# Include dbd files from all support applications:
depo_DBD += asyn.dbd
depo_DBD += calcSupport.dbd
depo_DBD += busySupport.dbd
depo_DBD += drvAsynIPPort.dbd
depo_DBD += asSupport.dbd
depo_DBD += stream.dbd
depo_DBD += modbusSupport.dbd
depo_DBD += devIocStats.dbd
depo_DBD += caPutLog.dbd
depo_DBD += system.dbd

# Add all the support libraries needed by this IOC
depo_LIBS += asyn stream modbus calc autosave busy devIocStats caPutLog

# depo_registerRecordDeviceDriver.cpp derives from depo.dbd
depo_SRCS += depo_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
depo_SRCS_DEFAULT += depoMain.cpp
depo_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#depo_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
depo_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

