TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = te_tc
# te_tc.dbd will be created and installed
DBD += te_tc.dbd

# te_tc.dbd will be made up from these files:
te_tc_DBD += base.dbd

# Include dbd files from all support applications:
te_tc_DBD += asyn.dbd
te_tc_DBD += calcSupport.dbd
te_tc_DBD += drvAsynIPPort.dbd
te_tc_DBD += asSupport.dbd
te_tc_DBD += stream.dbd
te_tc_DBD += devIocStats.dbd
te_tc_DBD += system.dbd
te_tc_DBD += caPutLog.dbd
te_tc_DBD += reccaster.dbd

# Add all the support libraries needed by this IOC
te_tc_LIBS += asyn stream calc autosave devIocStats caPutLog reccaster

# te_tc_registerRecordDeviceDriver.cpp derives from te_tc.dbd
te_tc_SRCS += te_tc_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
te_tc_SRCS_DEFAULT += te_tcMain.cpp
te_tc_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#te_tc_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
te_tc_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

