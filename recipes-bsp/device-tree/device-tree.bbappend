###################################################################################################
# Appends the device-tree recipe to add the additional dts file provided in the sub-directory.
# Copyright Richard Dunkley 2020
###################################################################################################

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

COMPATIBLE_MACHINE_te0820-03-03eg = "te0820-03-03eg"

# device tree sources for our generic image
SRC_URI_append = " \
        file://te0820-03-03eg.dtsi \
        "

do_configure_append_te0820-03-03eg() {
        cp ${WORKDIR}/te0820-03-03eg.dtsi ${B}/device-tree
        echo "/include/ \"te0820-03-03eg.dtsi\"" >> ${B}/device-tree/system-top.dts
}
