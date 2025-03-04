###################################################################################################
# Appends U-boot recipe to add the platform initialization files and u-boot configuration. The
# device tree isn't required since the device tree recipe will overwrite the device tree for both
# u-boot and the kernel.
# Copyright Richard Dunkley 2019
###################################################################################################
include u-boot-spl-zynq-init.inc

# Signal that we have a new platform init files for our generic configuration.
# The platform init recipe must also be appended to add the additional board specific files.
HAS_PLATFORM_INIT ?= " \
	te0820-03-03eg \
	"

FILESEXTRAPATHS:prepend := "${THISDIR}/files/te0820-03-03eg:"

# TE0820-03-03EG
COMPATIBLE_MACHINE:te0820-03-03eg = "te0820-03-03eg"
SRC_URI:append = " \
	file://te0820-03-03eg_defconfig \
	file://te0820-03-03eg.patch \
	"

do_unpack:append () {
    bb.build.exec_func('do_modify_src', d)
}

do_modify_src() {
    cp ${WORKDIR}/te0820-03-03eg_defconfig ${S}/configs/te0820-03-03eg_defconfig
}
