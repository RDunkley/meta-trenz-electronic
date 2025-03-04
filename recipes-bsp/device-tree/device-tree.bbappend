###################################################################################################
# Appends the device-tree recipe to add the additional dts file provided in the sub-directory.
# Copyright Richard Dunkley 2025
###################################################################################################

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

COMPATIBLE_MACHINE_te0820-03-03eg = "te0820-03-03eg"
COMPATIBLE_MACHINE_te0807-02-07ev = "te0807-02-07ev"

# device tree sources for our generic image
SRC_URI:append += " \
        file://te0820-03-03eg.dtsi \
	file://te0807-02-07ev.dtsi \
        "

do_configure:append:te0820-03-03eg () {
        cp ${WORKDIR}/te0820-03-03eg.dtsi ${B}/device-tree
        echo "/include/ \"te0820-03-03eg.dtsi\"" >> ${B}/device-tree/system-top.dts
}

do_configure:append:te0807-02-07ev () {
        cp ${WORKDIR}/te0807-02-07ev.dtsi ${B}/device-tree
        echo "/include/ \"te0807-02-07ev.dtsi\"" >> ${B}/device-tree/system-top.dts
}

