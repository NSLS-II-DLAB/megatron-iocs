TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = kri_rf
# kri_rf.dbd will be created and installed
DBD += kri_rf.dbd

# kri_rf.dbd will be made up from these files:
kri_rf_DBD += base.dbd

# Include dbd files from all support applications:
kri_rf_DBD += asyn.dbd
kri_rf_DBD += calcSupport.dbd
kri_rf_DBD += drvAsynIPPort.dbd
kri_rf_DBD += asSupport.dbd
kri_rf_DBD += stream.dbd
kri_rf_DBD += devIocStats.dbd
kri_rf_DBD += system.dbd
kri_rf_DBD += caPutLog.dbd
kri_rf_DBD += reccaster.dbd

# Add all the support libraries needed by this IOC
kri_rf_LIBS += asyn stream calc autosave devIocStats caPutLog reccaster

# kri_rf_registerRecordDeviceDriver.cpp derives from kri_rf.dbd
kri_rf_SRCS += kri_rf_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
kri_rf_SRCS_DEFAULT += kri_rfMain.cpp
kri_rf_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#kri_rf_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
kri_rf_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

