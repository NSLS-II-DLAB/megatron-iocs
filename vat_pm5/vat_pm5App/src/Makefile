TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = vat_pm5
# vat_pm5.dbd will be created and installed
DBD += vat_pm5.dbd

# vat_pm5.dbd will be made up from these files:
vat_pm5_DBD += base.dbd

# Include dbd files from all support applications:
#vat_pm5_DBD += xxx.dbd
vat_pm5_DBD += asyn.dbd
vat_pm5_DBD += calcSupport.dbd
vat_pm5_DBD += drvAsynIPPort.dbd
vat_pm5_DBD += asSupport.dbd
vat_pm5_DBD += stream.dbd
vat_pm5_DBD += devIocStats.dbd
vat_pm5_DBD += system.dbd
vat_pm5_DBD += caPutLog.dbd
vat_pm5_DBD += reccaster.dbd

# Add all the support libraries needed by this IOC
vat_pm5_LIBS += asyn stream calc autosave devIocStats caPutLog reccaster

# vat_pm5_registerRecordDeviceDriver.cpp derives from vat_pm5.dbd
vat_pm5_SRCS += vat_pm5_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
vat_pm5_SRCS_DEFAULT += vat_pm5Main.cpp
vat_pm5_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#vat_pm5_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
vat_pm5_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

