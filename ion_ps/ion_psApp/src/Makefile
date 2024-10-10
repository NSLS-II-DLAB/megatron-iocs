TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = ion_ps
# ion_ps.dbd will be created and installed
DBD += ion_ps.dbd

# ion_ps.dbd will be made up from these files:
ion_ps_DBD += base.dbd

# Include dbd files from all support applications:
ion_ps_DBD += asyn.dbd
ion_ps_DBD += calcSupport.dbd
ion_ps_DBD += drvAsynIPPort.dbd
ion_ps_DBD += asSupport.dbd
ion_ps_DBD += stream.dbd
ion_ps_DBD += devIocStats.dbd
ion_ps_DBD += system.dbd
ion_ps_DBD += caPutLog.dbd
ion_ps_DBD += reccaster.dbd

# Add all the support libraries needed by this IOC
ion_ps_LIBS += asyn stream calc autosave devIocStats caPutLog reccaster

# ion_ps_registerRecordDeviceDriver.cpp derives from ion_ps.dbd
ion_ps_SRCS += ion_ps_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
ion_ps_SRCS_DEFAULT += ion_psMain.cpp
ion_ps_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#ion_ps_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
ion_ps_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

