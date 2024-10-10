TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = nes_rte
# nes_rte.dbd will be created and installed
DBD += nes_rte.dbd

# nes_rte.dbd will be made up from these files:
nes_rte_DBD += base.dbd

# Include dbd files from all support applications:
nes_rte_DBD += asyn.dbd
nes_rte_DBD += calcSupport.dbd
nes_rte_DBD += drvAsynIPPort.dbd
nes_rte_DBD += asSupport.dbd
nes_rte_DBD += stream.dbd
nes_rte_DBD += devIocStats.dbd
nes_rte_DBD += system.dbd
nes_rte_DBD += caPutLog.dbd

# Add all the support libraries needed by this IOC
nes_rte_LIBS += asyn stream calc autosave devIocStats caPutLog

# nes_rte_registerRecordDeviceDriver.cpp derives from nes_rte.dbd
nes_rte_SRCS += nes_rte_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
nes_rte_SRCS_DEFAULT += nes_rteMain.cpp
nes_rte_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#nes_rte_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
nes_rte_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

