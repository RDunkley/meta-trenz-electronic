###################################################################################################
# Appends U-boot recipe to add the platform initialization files and device tree configuration.
# Copyright Richard Dunkley 2019
###################################################################################################
include u-boot-spl-zynq-init.inc

# Signal that we have a new platform init files for our generic configuration.
HAS_PLATFORM_INIT ?= " \
	te0820-03-03eg \
	"

#FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
FILESEXTRAPATHS_prepend := "${THISDIR}/files/te0820-03-03eg:"

# TE0820-03-03EG
COMPATIBLE_MACHINE_te0820-03-03eg = "te0820-03-03eg"
#SRC_URI_append = " \
#	file://psu_init_gpl.c \
#	file://psu_init_gpl.h \
#	file://te0820-03-03eg_defconfig \
#	file://te0820-03-03eg.dts \
#	"
SRC_URI_append = " \
	file://te0820-03-03eg_defconfig \
	file://te0820-03-03eg.dts \
	"

#DTB_PATH = "../build/arch/arm/dts"
#DTB_NAME = "te0820-03-03eg.dtb"

#EXTRA_OEMAKE += "${@'EXT_DTB=${B}/arch/arm/dts/te0820-03-03eg.dtb'}"

do_unpack_append () {
    bb.build.exec_func('do_modify_src', d)
}

do_modify_src() {
#	mkdir -p ${S}/board/xilinx/zynqmp/te0820-03-03eg
#    cp -r ${WORKDIR}/psu_init_gpl.c ${S}/board/xilinx/zynqmp/te0820-03-03eg/psu_init_gpl.c
    cp ${WORKDIR}/te0820-03-03eg_defconfig ${S}/configs/te0820-03-03eg_defconfig
    cp ${WORKDIR}/te0820-03-03eg.dts ${S}/arch/arm/dts/te0820-03-03eg.dts
}

