###################################################################################################
# Adds additional platform headers for Trenz-Electronic boards.
# Copyright Richard Dunkley 2020
###################################################################################################

# Adds additional board platform headers for U-Boot and FSBL

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

COMPATIBLE_MACHINE_te0820-03-03eg = "te0820-03-03eg"

# Not sure if needed if the HDF recipe is appended to as well.
SRC_UR_append_te0820-03-03eg += " \
	file://te0820-03-03eg/psu_init_gpl.c \
	file://te0820-03-03eg/psu_init_gpl.h \
	"

#do_install_append_te0820-03-03eg() {
#    install -m 0644 ${WORKDIR}/te0820-03-03eg/psu_init_gpl.c ${D}${PLATFORM_INIT_DIR}/
#    install -m 0644 ${WORKDIR}/te0820-03-03eg/psu_init_gpl.h ${D}${PLATFORM_INIT_DIR}/
#}
