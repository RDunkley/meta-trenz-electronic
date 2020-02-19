###################################################################################################
# Adds additional platform headers for Trenz-Electronic boards.
# Copyright Richard Dunkley 2020
###################################################################################################

# Adds additional board platform headers for U-Boot and FSBL
# U-boot must be told to pull the new files in. This is done in the u-boot-xlnx appended recipe.

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

COMPATIBLE_MACHINE_te0820-03-03eg = "te0820-03-03eg"

SRC_UR_append_te0820-03-03eg += " \
	file://te0820-03-03eg/psu_init_gpl.c \
	file://te0820-03-03eg/psu_init_gpl.h \
	"
