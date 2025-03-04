###################################################################################################
# Adds additional platform headers for Trenz-Electronic boards.
# Copyright Richard Dunkley 2025
###################################################################################################

# Adds additional board platform headers for U-Boot and FSBL
# U-boot must be told to pull the new files in. This is done in the u-boot-xlnx appended recipe.

COMPATIBLE_MACHINE:te0820-03-03eg = ".*"

FILESEXTRAPATHS:prepend:te0820-03-03eg := "${THISDIR}/files/te0820-03-03eg:"
SRC_URI:append:te0820-03-03eg += " \
	file://psu_init_gpl.c \
	file://psu_init_gpl.h \
	"

