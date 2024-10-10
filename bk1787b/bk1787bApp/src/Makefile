TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = bk1787b
# bk1787b.dbd will be created and installed
DBD += bk1787b.dbd

# bk1787b.dbd will be made up from these files:
bk1787b_DBD += base.dbd

# Include dbd files from all support applications:
bk1787b_DBD += asyn.dbd
bk1787b_DBD += calcSupport.dbd
bk1787b_DBD += drvAsynIPPort.dbd
bk1787b_DBD += asSupport.dbd
bk1787b_DBD += stream.dbd
bk1787b_DBD += devIocStats.dbd
bk1787b_DBD += system.dbd
bk1787b_DBD += caPutLog.dbd

# Add all the support libraries needed by this IOC
bk1787b_LIBS += asyn stream calc autosave devIocStats caPutLog

# bk1787b_registerRecordDeviceDriver.cpp derives from bk1787b.dbd
bk1787b_SRCS += bk1787b_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
bk1787b_SRCS_DEFAULT += bk1787bMain.cpp
bk1787b_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#bk1787b_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
bk1787b_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

