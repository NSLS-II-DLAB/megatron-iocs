TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = edwards_tic
# edwards_tic.dbd will be created and installed
DBD += edwards_tic.dbd

# edwards_tic.dbd will be made up from these files:
edwards_tic_DBD += base.dbd

# Include dbd files from all support applications:
edwards_tic_DBD += asyn.dbd
edwards_tic_DBD += calcSupport.dbd
edwards_tic_DBD += drvAsynIPPort.dbd
edwards_tic_DBD += asSupport.dbd
edwards_tic_DBD += stream.dbd
edwards_tic_DBD += devIocStats.dbd
edwards_tic_DBD += system.dbd
edwards_tic_DBD += caPutLog.dbd

# Add all the support libraries needed by this IOC
edwards_tic_LIBS += asyn stream calc autosave devIocStats caPutLog

# edwards_tic_registerRecordDeviceDriver.cpp derives from edwards_tic.dbd
edwards_tic_SRCS += edwards_tic_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
edwards_tic_SRCS_DEFAULT += edwards_ticMain.cpp
edwards_tic_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#edwards_tic_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
edwards_tic_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

