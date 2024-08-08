TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = oxford_e500
# oxford_e500.dbd will be created and installed
DBD += oxford_e500.dbd

# oxford_e500.dbd will be made up from these files:
oxford_e500_DBD += base.dbd

# Include dbd files from all support applications:
oxford_e500_DBD += asyn.dbd
oxford_e500_DBD += calcSupport.dbd
oxford_e500_DBD += drvAsynIPPort.dbd
oxford_e500_DBD += asSupport.dbd
oxford_e500_DBD += stream.dbd
oxford_e500_DBD += devIocStats.dbd
oxford_e500_DBD += system.dbd
oxford_e500_DBD += caPutLog.dbd

# Add all the support libraries needed by this IOC
oxford_e500_LIBS += asyn stream calc autosave devIocStats caPutLog

# oxford_e500_registerRecordDeviceDriver.cpp derives from oxford_e500.dbd
oxford_e500_SRCS += oxford_e500_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
oxford_e500_SRCS_DEFAULT += oxford_e500Main.cpp
oxford_e500_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#oxford_e500_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
oxford_e500_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

